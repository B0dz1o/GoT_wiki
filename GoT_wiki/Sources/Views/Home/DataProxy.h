//
//  DataProxy.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CharacterItem.h"

@class HomeViewDataSource;

@interface DataProxy : NSObject

@property NSArray <CharacterItem *> *characters;
@property NSString * baseURL;
@property (weak) HomeViewDataSource * ownerDS;
@property void (^requestHandler)(NSData *, NSURLResponse *, NSError *);
@property NSMutableDictionary<NSString*, UIImage*> *images;

- (void)startDownloadingData;
- (void)parseData: (NSData *) data fromResponse: (NSURLResponse *) response;

@end
