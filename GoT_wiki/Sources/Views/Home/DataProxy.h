//
//  DataProxy.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeViewDataSource;

@interface DataProxy : NSObject

@property (weak) HomeViewDataSource * ownerDS;
@property void (^requestHandler)(NSData *, NSURLResponse *, NSError *);

- (void)startDownloadingData;
- (void) parseData: (NSData *) data fromResponse: (NSURLResponse *) response;

@end
