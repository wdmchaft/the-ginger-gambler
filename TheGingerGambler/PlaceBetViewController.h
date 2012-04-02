//
//  PlaceBetViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableTableViewController.h"
#import "PriceOddsViewController.h"

@class Bet;

@interface PlaceBetViewController : UITableViewController<CategorySelectorNotifications, PriceWithOddsNotifications>{
    Bet* bet;
}

@property (weak, nonatomic) IBOutlet UITableViewCell* bookieSelect;
@property (weak, nonatomic) IBOutlet UITableViewCell* sportSelect;
@property (weak, nonatomic) IBOutlet UITableViewCell* priceOddsCell;
- (IBAction)betButton:(id)sender;

@end
