//
//  HomeViewControllerDataSource.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WholeResponse.h"

@interface HomeViewDataSource : NSObject <UITableViewDataSource>

@property NSArray <CharacterItem *> *characters;
@property (weak) UITableViewController * ownerVC;
@property NSString * baseURL;

- (void) startDownloadingData;

@end
