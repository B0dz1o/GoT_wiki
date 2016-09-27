//
//  AppDelegate.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

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

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
