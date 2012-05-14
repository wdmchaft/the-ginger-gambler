//
//  StakeViewController.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

@class Bet;

#import <UIKit/UIKit.h>

#import "TGGNavigationControllerHandle.h"
#import "Delegator.h"
#import "WizardItem.h"

@protocol SubmitStakesReceiver <NSObject>

- (void) submitStakes:(NSMutableSet*)stakes;

@end

@interface StakeViewController : UITableViewController<TGGNavigationControllerHandle, Delegator, WizardItem>

@property NSInteger selectionCount;
@property (nonatomic, weak) id<SubmitStakesReceiver> delegate;

- (IBAction)submitUnitBet:(id)sender;
- (void)setUpWithBetTypes:(NSMutableSet*)betTypes;

@end
