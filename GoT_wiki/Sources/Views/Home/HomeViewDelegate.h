//
//  HomeViewDelegate.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HomeViewController;

@interface HomeViewDelegate : NSObject <UITableViewDelegate>

@property (weak) HomeViewController *ownerVC;

- (IBAction)didLongTap:(UILongPressGestureRecognizer *)sender;

@end
