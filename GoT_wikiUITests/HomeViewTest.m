//
//  HomeViewTest.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HomeViewTest : XCTestCase

@end

@implementation HomeViewTest

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTableView {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *emptyListTable = app.tables[@"Empty list"];
    [emptyListTable tap];
    [emptyListTable doubleTap];
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
}

@end
