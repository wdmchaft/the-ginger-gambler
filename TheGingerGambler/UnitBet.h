//
//  UnitBet.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bet;

@interface UnitBet : NSManagedObject

@property (nonatomic, retain) NSNumber * unitbet;
@property (nonatomic, retain) NSDecimalNumber * stake;
@property (nonatomic, retain) Bet *bet;

@end
