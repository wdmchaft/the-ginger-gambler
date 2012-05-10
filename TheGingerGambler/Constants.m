//
//  Constants.m
//  TheGingerGambler
//
//  Created by john bower on 31/03/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "Constants.h"

@implementation Constants

/* Cells */
NSString* const BetCellName = @"BetCell";
NSString* const SportCellName = @"SportCell";
NSString* const BookieCellName = @"BookieCell";
NSString* const SelectionCellName = @"SelectionCell";

/* Entities */
NSString* const SportEntityName = @"Sport";
NSString* const BookieEntityName = @"Bookie";
NSString* const BetEntityName = @"Bet";
NSString* const SelectionEntityName = @"Selection";
NSString* const UnitBetEntityName = @"UnitBet";

/* Segues */
NSString* const PickBookieSegue = @"PickBookie";
NSString* const PickSportSegue = @"PickSport";
NSString* const PickBetSegue = @"PickBet";
NSString* const PickSelectionsSegue = @"PickSelection";
NSString* const PickStakeSegue = @"PickStake";

/* View */
NSString* const CategoryAdderView = @"CategoryAdder";
NSString* const SelectionAdderView = @"SelectionAdder";

/* Selection Cell */
NSString* const DescriptionKey = @"description";
NSString* const OddsKey = @"odds";
NSString* const PlaceTermsKey = @"placeTerms";

@end
