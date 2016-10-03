//
//  DataProxyTest.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JSONModel/JSONModel.h>
#import "DataProxy.h"
#import "HomeViewDataSource.h"

@interface DataProxyTest : XCTestCase

@property HomeViewDataSource *ds;
@property (weak) DataProxy *dp;
@property NSString *responseText;

@end

@implementation DataProxyTest

@synthesize dp;
@synthesize ds;
@synthesize responseText;

- (void)setUp {
    [super setUp];
    ds = [[HomeViewDataSource alloc] init];
    dp = [ds proxy];
    [self setResponseText:@"{\"basepath\":\"http://gameofthrones.wikia.com\",\"items\":[{\"id\":2123,\"title\":\"Jon Snow\",\"ns\":0,\"url\":\"/wiki/Jon_Snow\",\"revision\":{\"id\":297563,\"user\":\"Lorisa214\",\"user_id\":3003805,\"timestamp\":\"1472547480\"},\"comments\":0,\"type\":\"article\",\"abstract\":\"King Jon Snow is a major character in the first, second, third, fourth, fifth, sixth, and...\",\"thumbnail\":\"http://vignette3.wikia.nocookie.net/gameofthrones/images/4/49/Battle_of_the_Bastards_08.jpg/revision/latest/window-crop/width/200/x-offset/0/y-offset/0/window-width/2700/window-height/2700?cb=20160615184845\",\"original_dimensions\":{\"width\":2700,\"height\":4057}},{\"id\":2157,\"title\":\"Daenerys Targaryen\",\"ns\":0,\"url\":\"/wiki/Daenerys_Targaryen\",\"revision\":{\"id\":301527,\"user\":\"CrappyScrap\",\"user_id\":5731827,\"timestamp\":\"1474760945\"},\"comments\":0,\"type\":\"article\",\"abstract\":\"Queen Daenerys I Targaryen, also known as Dany and Daenerys Stormborn, is a major character in...\",\"thumbnail\":\"http://vignette2.wikia.nocookie.net/gameofthrones/images/2/28/Dany_finale_s6_winds_of_winter.jpg/revision/latest/window-crop/width/200/x-offset/0/y-offset/0/window-width/346/window-height/346?cb=20160630224410\",\"original_dimensions\":{\"width\":346,\"height\":475}}]}"];
}

- (void)testUTF8Parsing {
    NSURLResponse *resp = [[NSURLResponse alloc] initWithURL:[NSURL URLWithString:@""] MIMEType:nil expectedContentLength:0 textEncodingName:@"utf-8"];
    NSData *data = [[self responseText] dataUsingEncoding:NSUTF8StringEncoding];
    [dp parseData:data fromResponse:resp];
    XCTAssertEqual([[dp characters] count], 2);
}

- (void)testASCIIParsing {
    NSData *data = [[self responseText] dataUsingEncoding:NSASCIIStringEncoding];
    [dp parseData:data fromResponse:nil];
    XCTAssertEqual([[dp characters] count], 2);
}

@end
