//
//  ManagedObjectFactory.h
//  TheGingerGambler
//
//  Created by john bower on 31/03/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bet;
@class Selection;
@class UnitBet;

@interface ModelFactory : NSObject

+ (Bet*) createBet;
+ (Selection*) createSelection;
+ (UnitBet*) createUnitBet;

@end
