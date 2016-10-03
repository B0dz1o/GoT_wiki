//
//  HomeViewControllerDataSource.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "HomeViewDataSource.h"
#import "HomeViewCell.h"
#import "RequestFactory.h"
#import "WholeResponse.h"

@implementation HomeViewDataSource

@synthesize characters;
@synthesize ownerVC;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self characters] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell" forIndexPath:indexPath];
    CharacterItem *character = [characters objectAtIndex:[indexPath row]];
    [[cell title] setText:[character title]];
    [[cell characterDescription] setText:[character abstract]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark Downloading

- (void)startDownloadingData {
    [[[RequestFactory sharedObject] runTask:CHARACTER_LIST withHandler:^(NSData *d, NSURLResponse *r, NSError *e) {
        if (e != nil) {
            return;
        }
        [self parseData:d fromResponse:r];
        if ([[self ownerVC] isViewLoaded]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[self ownerVC] tableView] reloadData];
            });
        }
    }] resume];
}

- (void) parseData: (NSData *) data fromResponse: (NSURLResponse *) response {
//    NSURLRespons
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

@end
