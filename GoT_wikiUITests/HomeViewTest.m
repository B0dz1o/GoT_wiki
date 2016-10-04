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
    XCUIElementQuery *cellsQuery = [[XCUIApplication alloc] init].tables.cells;
    XCUIElement *labelStaticText = [[cellsQuery childrenMatchingType:XCUIElementTypeStaticText] elementAtIndex:1];
    [labelStaticText tap];
    [labelStaticText swipeDown];
    [labelStaticText swipeUp];
    [labelStaticText doubleTap];
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    
//    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
//    [tablesQuery.staticTexts[@"Daenerys Targaryen"] tap];
//    [tablesQuery.staticTexts[@"Rhaegar Targaryen"] tap];
//    [tablesQuery.staticTexts[@"Jon Snow"] tap];
    
}

@end
