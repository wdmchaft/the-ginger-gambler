//
//  Selection.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/23/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Category.h"

@class Bookie, Sport;

@interface Selection : NSManagedObject<Category>

@property (nonatomic, retain) NSDecimalNumber* odds;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSNumber* status;
@property (nonatomic, retain) NSDecimalNumber* placeterms;
@property (nonatomic, retain) NSManagedObject* multiple;
@property (nonatomic, retain) Sport* sport;
@property (nonatomic, retain) Bookie* bookie;

@end
