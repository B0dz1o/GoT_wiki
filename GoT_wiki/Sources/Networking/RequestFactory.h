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

typedef enum {
    CharactersList
} RequestTypes;

@property (weak) HTTPBuilder *builder;

+(instancetype) sharedObject;
-(NSURLSessionDataTask *) createTask: (RequestTypes) type
                         withHandler:(void (^)(NSData*, NSURLResponse*, NSError*)) handler;

@end
