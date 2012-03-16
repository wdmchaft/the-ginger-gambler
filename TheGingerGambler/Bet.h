//
//  Bet.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/16/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sport;
@class Bookie;

@interface Bet : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber* amount;
@property (nonatomic, retain) NSDecimalNumber* odds;
@property (nonatomic, retain) Bookie* bookie;
@property (nonatomic, retain) Sport* sport;

@end
