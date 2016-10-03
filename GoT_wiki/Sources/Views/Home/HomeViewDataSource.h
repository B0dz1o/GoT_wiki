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
#import "DataProxy.h"

@interface HomeViewDataSource : NSObject <UITableViewDataSource>

@property DataProxy *proxy;
@property (weak) UITableViewController * ownerVC;

- (void) startDownloadingData;
- (void) callDataReload;

@end
