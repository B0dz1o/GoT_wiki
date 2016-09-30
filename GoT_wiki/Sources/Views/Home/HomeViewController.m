//
//  HomeViewController.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "HomeViewController.h"


@implementation HomeViewController

@synthesize delegate;
@synthesize dataSource;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        [self setDataSource:[[HomeViewControllerDataSource alloc] init]];
        [self setDelegate:[[HomeViewControllerDelegate alloc] init]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self tableView] setDataSource:[self dataSource]];
    [[self tableView] setDelegate:[self delegate]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell" forIndexPath:indexPath];
    return cell;
}

@end
