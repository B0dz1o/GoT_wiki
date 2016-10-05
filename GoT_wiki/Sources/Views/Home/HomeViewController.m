//
//  HomeViewController.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "HomeViewController.h"
#import "RequestFactory.h"
#import "HomeViewCell.h"

@implementation HomeViewController

@synthesize delegate;
@synthesize dataSource;
@synthesize tableView;
@synthesize indicator;
@synthesize longPress;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        [self setDataSource:[[HomeViewDataSource alloc] init]];
        [[self dataSource] setOwnerVC:self];
        [[self dataSource] startDownloadingData];
        [self setDelegate:[[HomeViewDelegate alloc] init]];
        [[self delegate] setOwnerVC:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    
    UINib *nib = [UINib nibWithNibName:@"HomeViewCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"HomeViewCell"];
}

- (void) configureTableView {
    UITableView *tableView =[self tableView];
    
    [tableView setDataSource:[self dataSource]];
    [tableView setDelegate:[self delegate]];
    
    [tableView setRowHeight:UITableViewAutomaticDimension];
    [tableView setEstimatedRowHeight:70];
    if (![[self dataSource] dataLoaded]) {
        [self startLoadingIndicator];
    }
    
    [[self longPress] addTarget:[self delegate] action:NSSelectorFromString(@"didLongTap:")];
}


#pragma mark Data loading
- (void)reloadImage:(NSIndexPath *)indexPath {
    if (![self isViewLoaded]){
        return;
    }
    if ([[[self tableView] indexPathsForVisibleRows] containsObject:indexPath]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self tableView] reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        });
    }
}

- (void) startLoadingIndicator {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self indicator] startAnimating];
    });
}

- (void) stopLoadingIndicator {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self indicator] stopAnimating];
    });
}

#pragma mark Gesture handling

- (void)changeCollapseStatusFor:(NSIndexPath *)indexPath {
    [[self dataSource] changeCollapseStatusFor:[indexPath row]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self tableView] reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    });
}


@end
