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

@end
