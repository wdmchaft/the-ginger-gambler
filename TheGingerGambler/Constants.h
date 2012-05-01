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

/* Entities */
extern NSString* const BetEntityName;
extern NSString* const SportEntityName;
extern NSString* const BookieEntityName;
extern NSString* const SelectionEntityName;

/* Segues */
extern NSString* const EnterPriceAndOddsSegue;
extern NSString* const PickBookieSegue;
extern NSString* const PickSportSegue;
extern NSString* const PickBetSegue;

@end
