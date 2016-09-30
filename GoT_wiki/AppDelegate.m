//
//  AppDelegate.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UISplitViewControllerDelegate, UIApplicationDelegate>

@end

@implementation AppDelegate
@synthesize viewObj,window,navObj;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    viewObj = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    navObj = [[UINavigationController alloc] initWithRootViewController:viewObj];
    
    window.rootViewController=navObj;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}



@end
