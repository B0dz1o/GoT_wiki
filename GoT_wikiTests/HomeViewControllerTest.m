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
@property UITableView *tableview;

@end

@implementation HomeViewControllerTest

@synthesize vc;

- (void)setUp {
    [super setUp];
    HomeViewController *newVC = [[HomeViewController alloc] init];
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"HomeViewController" owner:newVC options:nil];
    [newVC viewDidLoad];
    [self setVc:newVC];
    [self setTableview:[newVC tableView]];
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
    XCTAssertTrue([[tableView delegate] isKindOfClass:[HomeViewDelegate class]]);
    XCTAssertTrue([[tableView dataSource] isKindOfClass:[HomeViewDataSource class]]);
}

- (void) testDelegate {
    UITableView *tableView = [[self vc] tableView];
    XCTAssertNoThrow([[tableView delegate] tableView:tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]);
    XCTAssertNoThrow([[[[HomeViewController alloc] init] dataSource] reloadImage:0]);
}

- (void) testHomeViewPerformance {
    [self measureBlock:^{
        UITableView *tableView = [[self vc] tableView];
        for (int j = 0; j < 10; ++j){
            for (int i = 0; i < 100 ; ++i) {
                NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell" forIndexPath:indexPath];
            }
        }
    }];
}

@end
