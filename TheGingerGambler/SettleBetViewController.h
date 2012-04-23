//
//  SettleBetViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCSwitchOnOff.h"
#import "BetPickerViewController.h"

@interface SettleBetViewController : UITableViewController<BetSelectorNotifications>{
    Bet* bet;
}

@property (weak, nonatomic) IBOutlet UITableViewCell *settleBetCell;

- (IBAction)settleBetButton:(id)sender;
- (IBAction)setWonOrLossed:(UISegmentedControl*)sender;

- (void) selectBet:(Bet*)betSelected;

@end
