//
//  StakeCell.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 john bower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StakeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* multipleLabel;
@property (weak, nonatomic) IBOutlet UITextField* stakeTextField;
@property (weak, nonatomic) IBOutlet UILabel* stakeLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl* betStickSwitch;

- (IBAction)betStickSwitched:(UISegmentedControl*)sender;

@end
