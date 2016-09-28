//
//  HTTPBuilder.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/28/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPBuilder : NSObject

-(NSURLSessionDataTask *) buildTask;

@end
