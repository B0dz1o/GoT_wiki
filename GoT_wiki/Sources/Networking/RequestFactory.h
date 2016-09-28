//
//  RequestFactory.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPBuilder.h"

@interface RequestFactory : NSObject

///GoT wiki request types. Enum starts with 1 to catch nil argument passing.
typedef enum {
    CHARACTER_LIST = 1
} RequestTypes;

///Builder layer around NSURLSession initialization
@property HTTPBuilder *builder;

///Singleton access method
+(instancetype) sharedObject;
///Abstract layer around server communication access
-(NSURLSessionDataTask *) runTask: (RequestTypes) type
                         withHandler:(void (^)(NSData*, NSURLResponse*, NSError*)) handler;

@end
