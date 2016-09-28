//
//  HTTPBuilder.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/28/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPBuilder : NSObject

@property NSString *baseURL;
@property NSString *path;
@property NSString *paramsString;
@property void (^requestHandler)(NSData *, NSURLResponse *, NSError *);


-(NSURLSessionDataTask *) buildTask;
-(HTTPBuilder *) useDefaultBaseURL;
-(HTTPBuilder *) useParameters: (NSDictionary<NSString *, NSString *> *) params;
-(HTTPBuilder *) usePath: (NSString *) path;

@end
