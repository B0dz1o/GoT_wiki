//
//  AppDelegate.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@class HomeViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    HomeViewController *viewObj;
    UINavigationController *navObj;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *viewObj;
@property (strong, nonatomic) UINavigationController *navObj;

@end
