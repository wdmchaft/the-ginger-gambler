//
//  StakeCell.m
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "StakeCell.h"
#import "ModelFactory.h"

@implementation StakeCell

@synthesize stakeTextField;
@synthesize multipleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)betStickSwitched:(UISegmentedControl*)sender
{
    NSInteger const bet = 0;
    NSInteger const stick = 1;
    
    if(sender.selectedSegmentIndex == bet)
    {
        [self.stakeTextField setHidden:FALSE];
    }
    else if(sender.selectedSegmentIndex == stick) 
    {
        [self.stakeTextField setHidden:TRUE];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
