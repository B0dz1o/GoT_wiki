//
//  main.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/25/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestAppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        int returnValue;
        BOOL isTesting = ( NSClassFromString(@"HomeViewControllerTest") != nil );
        if (isTesting) {
            returnValue = UIApplicationMain(argc, argv, nil, NSStringFromClass([TestAppDelegate class]));
        }
        else {
            returnValue = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
        return returnValue;
    }
}
