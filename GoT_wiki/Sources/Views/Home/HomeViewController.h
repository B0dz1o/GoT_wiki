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

@interface HomeViewController : UIViewController

@property HomeViewDelegate * delegate;
@property HomeViewDataSource * dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

-(void)reloadImage: (NSIndexPath*) indexPath;
-(void) startLoadingIndicator;
-(void) stopLoadingIndicator;

@end
