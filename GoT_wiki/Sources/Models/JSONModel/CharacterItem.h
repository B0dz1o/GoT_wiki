//
//  CharacterItem.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import <Foundation/Foundation.h>

@protocol CharacterItem;

@interface CharacterItem : JSONModel

@property NSString * title;
@property NSString * abstract;
@property NSString * thumbnail;

@end

