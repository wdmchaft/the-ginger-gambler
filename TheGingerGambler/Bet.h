//
//  Bet.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/22/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bookie, Sport;

typedef enum 
{
    kDraftState = 0,
    kPlacedState = 1,
    kWonState = 2,
    kLossedState = 3
} Status;

@interface Bet : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber* amount;
@property (nonatomic, retain) NSMutableArray* selections;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) Bookie* bookie;
@property (nonatomic, retain) Sport* sport;
@property (nonatomic, retain) NSNumber* status;

- (Status)betStatus;
- (void)setBetStatus:(Status)betStatus;
+ (NSSet*)keyPathsForValuesAffectingBetStatus;

@end
