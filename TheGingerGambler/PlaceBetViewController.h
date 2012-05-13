//
//  PlaceBetViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionsViewController.h"
#import "CategorySelectorReceiver.h"
#import "StakeViewController.h"

@class Bet;

@interface PlaceBetViewController : UITableViewController<CategorySelectorReceiver, SelectionsAddedReceiver, SubmitStakesReceiver>

@property (weak, nonatomic) IBOutlet UITableViewCell* bookieSelect;
@property (weak, nonatomic) IBOutlet UITableViewCell* sportSelect;
@property (weak, nonatomic) IBOutlet UITableViewCell* priceOddsCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *stakeCell;

- (IBAction)betButton:(id)sender;

- (void) setUpWithBet:(Bet*)bet;

@end
