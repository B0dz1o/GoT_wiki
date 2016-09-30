//
//  HomeViewController.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/27/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewControllerDelegate.h"
#import "HomeViewControllerDataSource.h"

@interface HomeViewController : UITableViewController

@property (retain) HomeViewControllerDelegate * delegate;
@property (retain) HomeViewControllerDataSource * dataSource;

@end
