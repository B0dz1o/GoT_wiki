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

+ (instancetype)sharedObject {
    static RequestFactory * factory;
    static dispatch_once_t token;
    dispatch_once(&token, ^(){
        if (factory == nil) {
            factory = [[RequestFactory alloc] init];
        }
    });
    return factory;
}

- (NSURLSessionDataTask *)runTask:(RequestTypes)type withHandler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    NSURLSessionDataTask* task;
    switch(type) {
        case CHARACTER_LIST:
            [[[[builder useDefaultBaseURL] usePath:@"Articles/Top"]
             useParameters: @{@"expand":@1,
                              @"category":@"Characters",
                              @"limit":@75}]
             useRequestHandler:handler];
            task = [builder buildTask];
            break;
        default:
            task = nil;
            break;
    }
    return task;
}

- (NSURLSessionDataTask *)runAbsoluteUrl:(NSString *)absUrl withHandler:(void (^)(NSData *, NSURLResponse *, NSError *))handler {
    return [[builder useRequestHandler:handler] buildTaskWithURL:absUrl];
}

@end
