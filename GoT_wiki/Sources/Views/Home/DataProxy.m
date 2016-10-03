//
//  DataProxy.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "DataProxy.h"
#import "RequestFactory.h"
#import "WholeResponse.h"
#import "HomeViewDataSource.h"

@implementation DataProxy

@synthesize ownerDS;
@synthesize requestHandler;

- (void)startDownloadingData {
    if ([self requestHandler] == nil) {
        [self defaultHandler];
    }
    [[[RequestFactory sharedObject] runTask:CHARACTER_LIST withHandler:[self requestHandler]] resume];
}

- (void) parseData: (NSData *) data fromResponse: (NSURLResponse *) response {
    NSString * result;
    if([[response textEncodingName] isEqualToString:@"utf-8"]){
        result = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    } else {
        [NSString stringEncodingForData:data encodingOptions:nil convertedString:&result usedLossyConversion:false];
    }
    JSONModelError *err;
    WholeResponse* whRes = [[WholeResponse alloc] initWithString:result error:&err];
    if (err == nil) {
        [[self ownerDS] setCharacters:[whRes items]];
        [[self ownerDS] setBaseURL:[whRes basepath]];
    }
}

- (void) defaultHandler {
    [self setRequestHandler:^(NSData *d, NSURLResponse *r, NSError *e) {
        if (e != nil) {
            return;
        }
        [self parseData:d fromResponse:r];
        if ([[[self ownerDS] ownerVC] isViewLoaded]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[[self ownerDS] ownerVC] tableView] reloadData];
            });
        };
    }];
}

@end
