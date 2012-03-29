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

@interface SettleBetViewController : UITableViewController<BetSelectorNotifications>

@property (weak, nonatomic) IBOutlet RCSwitchOnOff *winLossSwitch;

@end
