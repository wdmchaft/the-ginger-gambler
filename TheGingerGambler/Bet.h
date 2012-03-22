//
//  Bet.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/22/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define BET_ENTITY_NAME @"Bet"
#define BET_CELL_NAME @"BetCell"

@class Bookie, Sport;

@interface Bet : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber* amount;
@property (nonatomic, retain) NSDecimalNumber* odds;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) Bookie* bookie;
@property (nonatomic, retain) Sport* sport;

@end
