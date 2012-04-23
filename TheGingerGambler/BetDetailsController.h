//
//  BetDetailsController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/23/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetDetailsController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *betsTableView;
@property (weak, nonatomic) IBOutlet UITextField *unitStake;
@property (weak, nonatomic) IBOutlet UITextField *totalStake;
@property (weak, nonatomic) IBOutlet UITextField *returns;
@property (weak, nonatomic) IBOutlet UISegmentedControl *winOnlyOrEachWay;

@end
