//
//  StakeViewController.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

@class Bet;

#import <UIKit/UIKit.h>

@protocol SubmitStakesReceiver <NSObject>

- (void) submitStakes:(NSMutableArray*)stakes;

@end

@interface StakeViewController : UITableViewController

@property NSInteger selectionCount;
@property (nonatomic, weak) id<SubmitStakesReceiver> delegate;

- (IBAction)submitUnitBet:(id)sender;

@end
