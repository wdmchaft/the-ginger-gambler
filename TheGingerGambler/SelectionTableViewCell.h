//
//  SelectionTableViewCell.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel* oddsLabel;
@property (weak, nonatomic) IBOutlet UILabel* placeTermsLabel;
@property (weak, nonatomic) IBOutlet UILabel* oddsValueLabel;
@property (weak, nonatomic) IBOutlet UILabel* placeTermsValueLabel;
@property (weak, nonatomic) IBOutlet UITextField* descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField* oddsTextField;
@property (weak, nonatomic) IBOutlet UITextField* placeTermsTextField;
@property (weak, nonatomic) IBOutlet UILabel* addSelectionLabel;

@end
