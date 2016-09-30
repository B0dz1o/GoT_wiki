//
//  HTTPBuilder.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/28/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Builder pattern creating HTTP required objects
 */
@interface HTTPBuilder : NSObject

///Server address with common part
@property NSString *baseURL;
///Call-specific URL part
@property NSString *path;
///Ampersand-separated parameters
@property NSString *paramsString;
///Block handling received data or error code
@property void (^requestHandler)(NSData *, NSURLResponse *, NSError *);

/** Method creating data task based on builder configuration
 @returns Data task to be called
 */
-(NSURLSessionDataTask *) buildTask;
/** Method creating data task based on builder configuration
 @returns Data task to be called
 */
-(NSURLSessionDataTask *) buildTaskWithURL: (NSString *) absUrl;
/** Set default Game of Thrones wiki API URL
 @returns The builder itself for future use
 */
-(HTTPBuilder *) useDefaultBaseURL;
/** Set default Game of Thrones wiki API URL
 @param params Dictionary with query parameters to be parsed into URL
 @returns The builder itself for future use
 */
-(HTTPBuilder *) useParameters: (NSDictionary<NSString *, NSString *> *) params;
/** Part of building process, path setter
 @param path Query-specific path to be used
 @returns The builder itself for future use
 */
-(HTTPBuilder *) usePath: (NSString *) path;
/** Part of building process, handler setter
 @param handler Block to make use of server reponse data or error
 @returns The builder itself for future use
 */
-(HTTPBuilder *) useRequestHandler: (void (^)(NSData *, NSURLResponse *, NSError *)) handler;

@end
