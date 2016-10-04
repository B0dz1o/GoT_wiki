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

@synthesize characters;
@synthesize baseURL;
@synthesize ownerDS;
@synthesize requestHandler;
@synthesize images;

- (void)startDownloadingData {
    if ([self requestHandler] == nil) {
        [self defaultHandler];
    }
    [[[[RequestFactory alloc] init] runTask:CHARACTER_LIST withHandler:[self requestHandler]] resume];
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
        [self setCharacters:[whRes items]];
        [self setBaseURL:[whRes basepath]];
    }
}

- (void) defaultHandler {
    [self setRequestHandler:^(NSData *d, NSURLResponse *r, NSError *e) {
        if (e != nil) {
            return;
        }
        [self parseData:d fromResponse:r];
        [self startDownloadingImages];
        [[self ownerDS] callDataReload];
    }];
}

- (void) startDownloadingImages {
    NSUInteger i;
    NSUInteger limit = [[self characters] count];
    images = [NSMutableDictionary dictionaryWithCapacity:limit];
    for (i = 0; i < limit ; ++i) {
        [[[[RequestFactory alloc] init] runAbsoluteUrlSecured:[[characters objectAtIndex:i] thumbnail] withHandler:
         ^(NSData *d, NSURLResponse *r, NSError *e) {
             if (e != nil){
                 return;
             }
             UIImage *img = [UIImage imageWithData:d];
             [images setObject:img forKey:[NSString stringWithFormat:@"%d", i]];
             [ownerDS reloadImage:i];
        }] resume];
    }
}

@end
