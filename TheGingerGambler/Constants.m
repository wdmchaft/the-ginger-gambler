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
NSString* const NextWizardViewSegue = @"NextWizardView";
NSString* const MasterBookiePickerSegue = @"MasterBookiePicker";


/* View */
NSString* const CategoryAdderView = @"CategoryAdder";
NSString* const SelectionsView = @"Selections";
NSString* const StakeView = @"Stake";
NSString* const SportPickerView = @"SportPicker";
NSString* const BookiePickerView = @"BookiePicker";
NSString* const PlaceBetView = @"PlaceBet";
NSString* const SelectionAdderView = @"SelectionAdder";

/* Selection Cell */
NSString* const DescriptionKey = @"description";
NSString* const OddsKey = @"odds";
NSString* const PlaceTermsKey = @"placeTerms";

/* Unit bets */
NSString* const Single = @"Single";
NSString* const Double = @"Double";
NSString* const Treble = @"Treble";
NSString* const Fold = @"Fold";

/* Stake cell */
NSInteger const BetSegment = 0;
NSInteger const StickSegment = 1;

/* Storyboard name */
NSString* const StoryboardName = @"MainStoryboard";

@end
