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
@synthesize builder;

- (void)setUp {
    [super setUp];
    [self setFactory:[[RequestFactory alloc] init]];
    [self setBuilder:[[HTTPBuilder alloc] init]];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFactoryCreation {
    XCTAssertNil([factory runTask:0 withHandler:nil]);
    XCTAssertNoThrow([factory runTask:CHARACTER_LIST withHandler:nil]);
    XCTAssertNotNil([factory runTask:CHARACTER_LIST withHandler:nil]);
    XCTAssertNoThrow([factory runTask:CHARACTER_LIST withHandler:
                      ^(NSData *d, NSURLResponse *r, NSError *e){}]);
    XCTAssertNotNil([factory runTask:CHARACTER_LIST withHandler:
                     ^(NSData *d, NSURLResponse *r, NSError *e){}]);
}

- (void) testBuilderParamsFormatter {
    [[self builder] useParameters:@{@"expand":@1, @"category":@"Characters", @"limit":@75}];
    BOOL bit32 = [[[self builder] paramsString] isEqualToString:@"?category=Characters&limit=75&expand=1"];
    BOOL bit64 = [[[self builder] paramsString] isEqualToString:@"?expand=1&category=Characters&limit=75"];
    XCTAssertTrue(bit32 || bit64);
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
    BOOL bit32 = [addr isEqualToString:@"https://gameofthrones.wikia.com/api/v1/Articles/Top?expand=1&category=Characters&limit=75"];
    BOOL bit64 = [addr isEqualToString:@"https://gameofthrones.wikia.com/api/v1/Articles/Top?category=Characters&limit=75&expand=1"];
    XCTAssertTrue(bit32 || bit64);
    addr = [[[[[[self builder] useParameters:@{@"limit":@75}] buildTask] currentRequest] URL] absoluteString];
    XCTAssertTrue([addr isEqualToString:@"https://gameofthrones.wikia.com/api/v1/Articles/Top?limit=75"]);
    addr = [[[[[self builder] buildTaskWithURL:addr] currentRequest] URL] absoluteString];
    XCTAssertTrue([addr isEqualToString:@"https://gameofthrones.wikia.com/api/v1/Articles/Top?limit=75"]);
}

- (void) testFactoryRequestCreation {
    NSURLSessionDataTask * task = [factory runTask:CHARACTER_LIST withHandler:nil];
    NSString * addr = [[[task currentRequest] URL] absoluteString];
    BOOL bit32 = [addr isEqualToString:@"https://gameofthrones.wikia.com/api/v1/Articles/Top?expand=1&category=Characters&limit=75"];
    BOOL bit64 = [addr isEqualToString:@"https://gameofthrones.wikia.com/api/v1/Articles/Top?category=Characters&limit=75&expand=1"];
    XCTAssertTrue(bit32 || bit64);
    
    NSString * jonSnowURL = @"https://vignette3.wikia.nocookie.net/gameofthrones/images/4/49/Battle_of_the_Bastards_08.jpg/revision/latest/window-crop/width/200/x-offset/0/y-offset/0/window-width/2700/window-height/2700?cb=20160615184845";
    task = [factory runAbsoluteUrl:jonSnowURL withHandler:nil];
    XCTAssertTrue([[[[task currentRequest] URL] absoluteString] isEqualToString:jonSnowURL]);
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

- (void) testSecuredCall {
    NSString * jonSnowURL = @"http://vignette3.wikia.nocookie.net/gameofthrones/images/4/49/Battle_of_the_Bastards_08.jpg/revision/latest/window-crop/width/200/x-offset/0/y-offset/0/window-width/2700/window-height/2700?cb=20160615184845";
    NSString *transformedURL = [[[[factory runAbsoluteUrlSecured:jonSnowURL withHandler:^(NSData *d, NSURLResponse *r, NSError *e) {}]
                                 currentRequest] URL] absoluteString];
    XCTAssertTrue([transformedURL isEqualToString: @"https://vignette3.wikia.nocookie.net/gameofthrones/images/4/49/Battle_of_the_Bastards_08.jpg/revision/latest/window-crop/width/200/x-offset/0/y-offset/0/window-width/2700/window-height/2700?cb=20160615184845"]);
}

@end
