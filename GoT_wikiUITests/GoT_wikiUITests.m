//
//  GoT_wikiUITests.m
//  GoT_wikiUITests
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GoT_wikiUITests : XCTestCase

@end

@implementation GoT_wikiUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testExample {
    XCUIElement *emptyListTable = [[XCUIApplication alloc] init].tables[@"Empty list"];
    [emptyListTable tap];
    [emptyListTable doubleTap];
    [emptyListTable swipeDown];
}

@end
