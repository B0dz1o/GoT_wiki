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
    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    XCUIElement *dany = tablesQuery.staticTexts[@"Daenerys Targaryen"];
    XCUIElement *rhaegar = tablesQuery.staticTexts[@"Rhaegar Targaryen"];
    XCUIElement *jon = tablesQuery.staticTexts[@"Jon Snow"];
    NSPredicate *exists = [NSPredicate predicateWithFormat:@"exists == 1"];
    [self expectationForPredicate:exists evaluatedWithObject:dany handler:nil];
    [self expectationForPredicate:exists evaluatedWithObject:jon handler:nil];
    [self expectationForPredicate:exists evaluatedWithObject:rhaegar handler:nil];
    
    XCUICoordinate *rhaegarCoord = [rhaegar coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    XCUICoordinate *jonCoord = [jon coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    [rhaegarCoord pressForDuration:0.3 thenDragToCoordinate:jonCoord];
    
    [self expectationForPredicate:exists evaluatedWithObject:tablesQuery.staticTexts[@"Cersei Lannister"] handler:nil];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
   
}

- (void)testExpanding {
    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    XCUIElement *dany = tablesQuery.staticTexts[@"Daenerys Targaryen"];
    XCUIElement *rhaegar = tablesQuery.staticTexts[@"Rhaegar Targaryen"];
    
    NSPredicate *exists = [NSPredicate predicateWithFormat:@"exists == 1"];
    [self expectationForPredicate:exists evaluatedWithObject:dany handler:nil];
    [self expectationForPredicate:exists evaluatedWithObject:rhaegar handler:nil];
    [self waitForExpectationsWithTimeout:15 handler:nil];
    
    XCUIElement *rhaegarDesc = tablesQuery.staticTexts[@"Prince Rhaegar Targaryen is an unseen character in Game of Thrones. He is deceased when the..."];
    [self expectationForPredicate:exists evaluatedWithObject:dany handler:nil];
    [self waitForExpectationsWithTimeout:15 handler:nil];
    
    [rhaegarDesc pressForDuration:1.0];
    [rhaegarDesc tap];
    [rhaegarDesc pressForDuration:1.0];
    
    [rhaegar pressForDuration:1.0];
    [rhaegar tap];
    [rhaegar pressForDuration:1.0];
    
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    
    
}

@end
