//
//  DataSourceTest.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeViewDataSource.h"

@interface DataSourceTest : XCTestCase

@property HomeViewDataSource * ds;

@end

@implementation DataSourceTest

@synthesize ds;

- (void)setUp {
    [super setUp];
    ds = [[HomeViewDataSource alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testStandardParsing {
    XCTestExpectation *ex =[self expectationWithDescription:@"Character list"];
    [[ds proxy] setRequestHandler:^(NSData *d, NSURLResponse *r, NSError *e) {
        XCTAssertNotNil(d);
        XCTAssertNil(e);
        XCTAssertTrue([[r textEncodingName] isEqualToString:@"utf-8"]);
        WholeResponse *whRes = [[WholeResponse alloc] initWithData:d error:nil];
        NSLog(@"%d", [[whRes items] count]);
        [ex fulfill];
    }];
    [ds startDownloadingData];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}


@end
