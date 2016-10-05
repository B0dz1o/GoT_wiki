//
//  HomeViewControllerDataSource.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#define COLLAPSED 2
#define FULL_DISPLAY 0

#import "HomeViewDataSource.h"
#import "HomeViewController.h"

@implementation HomeViewDataSource

@synthesize ownerVC;
@synthesize proxy;
@synthesize dataLoaded;
@synthesize expandedCells;

- (instancetype)init {
    if (self = [super init]){
        [self setProxy:[[DataProxy alloc] init]];
        [[self proxy] setOwnerDS:self];
        [self setExpandedCells:[NSMutableSet set]];
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
    [self setDataLoaded:false];
    [[self proxy] startDownloadingData];
}

- (void)callDataReload {
    [self setDataLoaded:true];
    [self setExpandedCells:[NSMutableSet setWithCapacity:[[[self proxy] characters] count]]];
    if ([[self ownerVC] isViewLoaded]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[self ownerVC] tableView] reloadData];
            [[self ownerVC] stopLoadingIndicator];
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
    if ([[self expandedCells] containsObject:indexPath]) {
        [[cell characterDescription] setNumberOfLines:FULL_DISPLAY];
    } else {
        [[cell characterDescription] setNumberOfLines:COLLAPSED];
    }
    [[cell title] setText:[character title]];
    [[cell characterDescription] setText:[character abstract]];
    [[cell image] setImage:img];
    return cell;
}

- (void)changeCollapseStatusFor:(NSIndexPath *)indexPath {
    if ([[self expandedCells] containsObject:indexPath]) {
        [[self expandedCells] removeObject:indexPath];
    } else {
        [[self expandedCells] addObject:indexPath];
    }
}


@end
