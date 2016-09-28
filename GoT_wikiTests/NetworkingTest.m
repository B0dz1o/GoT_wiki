//
//  NetworkingTest.m
//  NetworkingTest
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RequestFactory.h"

@interface NetworkingTest : XCTestCase

@property RequestFactory* factory;

@end

@implementation NetworkingTest

@synthesize factory;

- (void)setUp {
    [super setUp];
    [self setFactory:[RequestFactory sharedObject]];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSingleton {
    XCTAssertNotNil([self factory]);
    RequestFactory * anotherFactory = [RequestFactory sharedObject];
    XCTAssertEqual([self factory], anotherFactory);
}

- (void)testFactoryCreation {
    XCTAssertNil([factory createTask:nil withHandler:nil]);
    XCTAssertNotNil([factory createTask:CHARACTER_LIST withHandler:nil]);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
