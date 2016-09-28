//
//  HTTPBuilder.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/28/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "HTTPBuilder.h"

@implementation HTTPBuilder

@synthesize baseURL, path, paramsString, requestHandler;

-(NSURLSessionDataTask *)buildTask {
    NSURL * taskURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",
                                            [self baseURL], [self path], [self paramsString]]];
    [self requestHandler];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask * task = [session dataTaskWithURL:taskURL completionHandler: [self requestHandler]];
    return task;
}

- (HTTPBuilder *)useDefaultBaseURL {
    [self setBaseURL:@"http://gameofthrones.wikia.com/api/v1/"];
    return self;
}

- (HTTPBuilder *)useParameters:(NSDictionary <NSString *, NSString *> *)params {
    if (params == nil) {
        paramsString = nil;
        return self;
    }
    NSMutableString* formattedParams = [NSMutableString string];
    NSArray<NSString *> * keys = [params allKeys];
    NSArray<NSString *> * values = [params allValues];
    NSUInteger i;
    NSUInteger count = [keys count];
    for (i = 0; i < count; ++i) {
        char separator = (i == 0) ? '?' : '&';
        [formattedParams appendFormat:@"%c%@=%@", separator, [keys objectAtIndex:i], [values objectAtIndex:i]];
    }
    [self setParamsString:formattedParams];
    return self;
}

- (HTTPBuilder *)usePath: (NSString *) argPath {
    [self setPath:argPath];
    return self;
}


@end
