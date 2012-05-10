//
//  StakeViewController.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

@class Bet;

#import <UIKit/UIKit.h>

@interface StakeViewController : UITableViewController

@property (nonatomic, weak) Bet* bet;

- (IBAction)submitUnitBet:(id)sender;

@end
