//
//  WholeResponse.h
//  GoT_wiki
//
//  Created by Piotr Bogdan on 10/3/16.
//  Copyright © 2016 Piotr Bogdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "CharacterItem.h"

@interface WholeResponse : JSONModel

@property NSArray <CharacterItem> * items;

@end

