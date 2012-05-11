//
//  Constants.h
//  TheGingerGambler
//
//  Created by john bower on 31/03/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#import <Foundation/Foundation.h>

@interface Constants : NSObject

/* Cells */
extern NSString* const BetCellName;
extern NSString* const SportCellName;
extern NSString* const BookieCellName;
extern NSString* const SelectionCellName;

/* Entities */
extern NSString* const BetEntityName;
extern NSString* const SportEntityName;
extern NSString* const BookieEntityName;
extern NSString* const SelectionEntityName;
extern NSString* const UnitBetEntityName;

/* Segues */
extern NSString* const PickSelectionsSegue;
extern NSString* const PickBookieSegue;
extern NSString* const PickSportSegue;
extern NSString* const PickBetSegue;
extern NSString* const PickStakeSegue;

/* View */
extern NSString* const CategoryAdderView;
extern NSString* const SelectionAdderView;

/* Selection Cell */
extern NSString* const DescriptionKey;
extern NSString* const OddsKey;
extern NSString* const PlaceTermsKey;

/* Unit bets */
extern NSString* const Single;
extern NSString* const Double;
extern NSString* const Treble;
extern NSString* const Fold;

@end
