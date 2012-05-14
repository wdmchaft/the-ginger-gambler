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
@synthesize stakeLabel;
@synthesize betStickSwitch;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        // init code
    }
    return self;
}

- (IBAction)betStickSwitched:(UISegmentedControl*)sender
{
    if(sender.selectedSegmentIndex == BetSegment)
    {
        [self.stakeTextField setHidden:FALSE];
        [self.stakeLabel setHidden:FALSE];
    }
    else if(sender.selectedSegmentIndex == StickSegment) 
    {
        [self.stakeTextField setHidden:TRUE];
        [self.stakeLabel setHidden:TRUE];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
