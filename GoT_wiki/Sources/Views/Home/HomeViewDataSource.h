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

@class HomeViewController;

@interface HomeViewDataSource : NSObject <UITableViewDataSource>

@property DataProxy *proxy;
@property (weak) HomeViewController * ownerVC;
@property BOOL dataLoaded;

- (void) startDownloadingData;
- (void) callDataReload;
- (void) reloadImage: (NSUInteger)index;
- (void) changeCollapseStatusFor: (NSUInteger) index;

@end
