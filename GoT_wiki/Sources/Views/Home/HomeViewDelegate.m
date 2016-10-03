//
//  HomeViewControllerDelegate.m
//  GoT_wiki
//
//  Created by Piotr Bogdan on 9/30/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import "HomeViewDelegate.h"

@implementation HomeViewDelegate

 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:true];
 }

@end
