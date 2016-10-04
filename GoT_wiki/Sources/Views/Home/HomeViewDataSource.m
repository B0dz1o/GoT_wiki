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
#import "HomeViewController.h"

@implementation HomeViewDataSource

@synthesize ownerVC;
@synthesize proxy;

- (instancetype)init {
    if (self = [super init]){
        [self setProxy:[[DataProxy alloc] init]];
        [[self proxy] setOwnerDS:self];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self proxy] characters] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell" forIndexPath:indexPath];
    [self configCell:cell for:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark Proxy handling

- (void)startDownloadingData {
    [[self proxy] startDownloadingData];
}

- (void)callDataReload {
    if ([[self ownerVC] isViewLoaded]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[self ownerVC] tableView] reloadData];
        });
    };
}

- (void)reloadImage:(NSUInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [[self ownerVC] reloadImage:indexPath];
}

#pragma mark Cell configuration
-(HomeViewCell *)configCell:(HomeViewCell *)cell for:(NSIndexPath *)indexPath {
    CharacterItem *character = [[proxy characters] objectAtIndex:[indexPath row]];
    UIImage *img = [[proxy images] objectForKey:[NSString stringWithFormat:@"%d", [indexPath row]]];
    if (img == nil){
        [[cell imageLoading] setHidden:false];
        [[cell imageLoading] startAnimating];
    } else {
        [[cell imageLoading] setHidden:true];
        [[cell imageLoading] stopAnimating];
    }
    [[cell title] setText:[character title]];
    [[cell characterDescription] setText:[character abstract]];
    [[cell image] setImage:img];
    return cell;
}


@end
