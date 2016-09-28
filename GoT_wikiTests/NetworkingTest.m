//
//  NetworkingTest.m
//  NetworkingTest
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RequestFactory.h"
#import "HTTPBuilder.h"

@interface NetworkingTest : XCTestCase

@property RequestFactory* factory;
@property HTTPBuilder* builder;

@end

@implementation NetworkingTest

@synthesize factory;

- (void)setUp {
    [super setUp];
    [self setFactory:[RequestFactory sharedObject]];
    [self setBuilder:[[HTTPBuilder alloc] init]];
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
    XCTAssertNil([factory runTask:nil withHandler:nil]);
    XCTAssertNoThrow([factory runTask:CHARACTER_LIST withHandler:nil]);
    XCTAssertNotNil([factory runTask:CHARACTER_LIST withHandler:nil]);
    XCTAssertNoThrow([factory runTask:CHARACTER_LIST withHandler:
                      ^(NSData *d, NSURLResponse *r, NSError *e){}]);
    XCTAssertNotNil([factory runTask:CHARACTER_LIST withHandler:
                     ^(NSData *d, NSURLResponse *r, NSError *e){}]);
}

- (void) testBuilderParamsFormatter {
    [[self builder] useParameters:@{@"expand":@1, @"category":@"Characters", @"limit":@75}];
    XCTAssertTrue([[[self builder] paramsString] isEqualToString:@"?expand=1&category=Characters&limit=75"]);
    [[self builder] useParameters:nil];
    XCTAssertNil([[self builder] paramsString]);
    [[self builder] useParameters:@{@"limit":@75}];
    XCTAssertTrue([[[self builder] paramsString] isEqualToString:@"?limit=75"]);
}

- (void) testBuilder {
    [[[[self builder] useDefaultBaseURL] usePath:@"Articles/Top"]
     useParameters: @{@"expand":@1,
                      @"category":@"Characters",
                      @"limit":@75}];
    NSString * addr = [[[[[self builder] buildTask] currentRequest] URL] absoluteString];
    XCTAssertTrue([addr isEqualToString:@"http://gameofthrones.wikia.com/api/v1/Articles/Top?expand=1&category=Characters&limit=75"]);
}

- (void)testBuilderPerformance {
    [self measureBlock:^{
        for (int i = 0; i < 100; ++i) {
            [[[[[self builder] useDefaultBaseURL]
               usePath:@"Articles/Top"]
              useParameters: @{@"expand":@1,
                              @"category":@"Characters",
                              @"limit":@75}]
             buildTask];
        }
    }];
}

- (void) testFactoryPerformance {
    [self measureBlock:^{
        for(int i = 0; i < 100; ++i) {
            [[self factory] runTask:CHARACTER_LIST
                        withHandler:^(NSData *d, NSURLResponse *r, NSError *e) {}];
        }
    }];
}

@end
