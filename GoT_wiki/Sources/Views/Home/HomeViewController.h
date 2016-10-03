//
//  HomeViewController.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewDelegate.h"
#import "HomeViewDataSource.h"

@interface HomeViewController : UITableViewController

@property (retain) HomeViewDelegate * delegate;
@property (retain) HomeViewDataSource * dataSource;

@end
