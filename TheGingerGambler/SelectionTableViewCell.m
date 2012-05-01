//
//  SelectionTableViewCell.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "SelectionTableViewCell.h"

@implementation SelectionTableViewCell

@synthesize descriptionLabel;
@synthesize oddsLabel;
@synthesize placeTermsLabel;
@synthesize descriptionTextField;
@synthesize oddsTextField;
@synthesize placeTermsTextField;
@synthesize placeTermsValueLabel;
@synthesize oddsValueLabel;
@synthesize addSelectionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
