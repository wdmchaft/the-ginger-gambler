//
//  CategorySelectorReceiver.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sport;
@class Bookie;

@protocol CategorySelectorReceiver <NSObject>

- (void) selectSport:(Sport*) sport;
- (void) selectBookie:(Bookie*) bookie;

@end
