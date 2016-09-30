//
//  RequestFactory.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPBuilder.h"

///Factory pattern creating http requests
@interface RequestFactory : NSObject

/**GoT wiki request types. 
 
 Enum starts with 1 to catch nil argument passing.
 @field CHARACTER_LIST Get top articles concerning certain characters
 */
typedef enum {
    CHARACTER_LIST = 1
} RequestTypes;

///Builder layer around NSURLSession initialization
@property HTTPBuilder *builder;

///Singleton access method
+(instancetype) sharedObject;
/**Abstract layer around server communication access
 @param type API call identifier
 @param handler Block to make use of server reponse data or error
 @returns Data task object to be called
 */
-(NSURLSessionDataTask *) runTask: (RequestTypes) type
                         withHandler:(void (^)(NSData*, NSURLResponse*, NSError*)) handler;
/**Abstract layer around server communication access
 @param absUrl String URL to get data from.
 @param handler Block to make use of server reponse data or error
 @returns Data task object to be called
 */
-(NSURLSessionDataTask *) runAbsoluteUrl: (NSString *) absUrl
                      withHandler:(void (^)(NSData*, NSURLResponse*, NSError*)) handler;

@end
