//
//  HomeViewControllerDelegate.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "HomeViewDelegate.h"
#import "HomeViewController.h"

@implementation HomeViewDelegate

@synthesize ownerVC;

 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:true];
 }

- (IBAction)didLongTap:(UILongPressGestureRecognizer *)sender {
    if ([sender state] != UIGestureRecognizerStateBegan) {
        return;
    }
    CGPoint pressLocation = [sender locationInView:[[self ownerVC] tableView]];
    NSIndexPath *indexPath = [[[self ownerVC] tableView] indexPathForRowAtPoint:pressLocation];
    [[self ownerVC] changeCollapseStatusFor:indexPath];
}

@end
