//
//  IntegrationTesting.m
//  IntegrationTesting
//
//  Created by Piotr Bogdan on 10/1/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RequestFactory.h"
#import "HTTPBuilder.h"

@interface IntegrationTesting : XCTestCase

@property RequestFactory* factory;
@property HTTPBuilder* builder;

@end

@implementation IntegrationTesting

@synthesize factory;
@synthesize builder;

- (void)setUp {
    [super setUp];
    [self setFactory:[RequestFactory sharedObject]];
    [self setBuilder:[[HTTPBuilder alloc] init]];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testFactoryCalls {
    XCTestExpectation * expectCharacters = [self expectationWithDescription:@"expectCharacters"];
    XCTestExpectation * expectAbsolute = [self expectationWithDescription:@"expectAbsolute"];
    [[factory runTask:CHARACTER_LIST withHandler:^(NSData * d, NSURLResponse *r , NSError * e){
        if (e == nil){
            [expectCharacters fulfill];
        }
    }] resume];
    NSString * jonSnowURL = @"https://vignette3.wikia.nocookie.net/gameofthrones/images/4/49/Battle_of_the_Bastards_08.jpg/revision/latest/window-crop/width/200/x-offset/0/y-offset/0/window-width/2700/window-height/2700?cb=20160615184845";
    [[factory runAbsoluteUrl:jonSnowURL withHandler:^(NSData * d, NSURLResponse * r, NSError * e) {
        UIImage * img = [UIImage imageWithData:d];
        XCTAssertNotNil(img);
        if (e == nil){
            [expectAbsolute fulfill];
        }
    }] resume];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}



@end
