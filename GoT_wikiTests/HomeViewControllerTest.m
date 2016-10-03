//
//  HomeViewControllerTest.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "HomeViewDelegate.h"
#import "HomeViewDataSource.h"

@interface HomeViewControllerTest : XCTestCase

@property HomeViewController *vc;

@end

@implementation HomeViewControllerTest

- (void)setUp {
    [super setUp];
    HomeViewController *newVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [self setVc:newVC];
}

- (void) testCellCreation {
    UITableView *tableView = [[self vc] tableView];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell"];
    UITableViewCell *nilCell = [tableView dequeueReusableCellWithIdentifier:@"UNKNOWN"];
    XCTAssertTrue([cell isKindOfClass:[HomeViewCell class]]);
    XCTAssertNil(nilCell);
}

- (void) testTableViewConfig {
    UITableView *tableView = [[self vc] tableView];
    [[self vc] viewDidLoad];
    XCTAssertTrue([[tableView delegate] isKindOfClass:[HomeViewDelegate class]]);
    XCTAssertTrue([[tableView dataSource] isKindOfClass:[HomeViewDataSource class]]);
}

- (void) testHomeViewPerformance {
    [self measureBlock:^{
        for (int j = 0; j < 10; ++j){
            UITableView *tableView = [[self vc] tableView];
            for (int i = 0; i < 100 ; ++i) {
                NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell" forIndexPath:indexPath];
            }
        }
    }];
}

@end
