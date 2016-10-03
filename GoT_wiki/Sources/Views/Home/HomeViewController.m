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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        [self setDataSource:[[HomeViewDataSource alloc] init]];
        [self setDelegate:[[HomeViewDelegate alloc] init]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    
    UINib *nib = [UINib nibWithNibName:@"HomeViewCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"HomeViewCell"];
    [[[RequestFactory sharedObject] runTask:CHARACTER_LIST withHandler:^(NSData *d, NSURLResponse *r, NSError *e) {
//        TODO
    }] resume];
}

- (void) configureTableView {
    UITableView *tableView =[self tableView];
    
    [tableView setDataSource:[self dataSource]];
    [tableView setDelegate:[self delegate]];
    
    [tableView setRowHeight:UITableViewAutomaticDimension];
    [tableView setEstimatedRowHeight:70];
}


@end
