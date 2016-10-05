//
//  RequestFactory.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "RequestFactory.h"

@implementation RequestFactory

@synthesize builder;

- (instancetype) init {
    if (self = [super init]){
        [self setBuilder:[[HTTPBuilder alloc] init]];
    }
    return self;
}

- (NSURLSessionDataTask *)runTask:(RequestTypes)type withHandler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    NSURLSessionDataTask* task;
    [[self builder] useDefaultBaseURL];
    switch(type) {
        case CHARACTER_LIST:
            [[[[self builder] usePath:@"Articles/Top"]
             useParameters: @{@"expand":@1,
                              @"category":@"Characters",
                              @"limit":@75}]
             useRequestHandler:handler];
            task = [[self builder] buildTask];
            break;
        default:
            task = nil;
            break;
    }
    return task;
}

- (NSURLSessionDataTask *)runAbsoluteUrl:(NSString *)absUrl withHandler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    HTTPBuilder *builder2 = [[HTTPBuilder alloc] init];
    return [[builder2 useRequestHandler:handler] buildTaskWithURL:absUrl];
}

- (NSURLSessionDataTask *)runAbsoluteUrlSecured:(NSString *)absUrl withHandler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    [absUrl stringByReplacingOccurrencesOfString:@"http://" withString:@"https://"];
    NSString * securedURL = [absUrl stringByReplacingOccurrencesOfString:@"http://" withString:@"https://"];
    return [self runAbsoluteUrl:securedURL withHandler:handler];
}


@end
