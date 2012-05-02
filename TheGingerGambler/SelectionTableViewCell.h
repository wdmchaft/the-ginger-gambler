//
//  SelectionTableViewCell.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DictionaryPopulator.h"

@interface SelectionTableViewCell : UITableViewCell<DictionaryPopulator>

@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel* oddsLabel;
@property (weak, nonatomic) IBOutlet UILabel* placeTermsLabel;
@property (weak, nonatomic) IBOutlet UILabel* oddsValueLabel;
@property (weak, nonatomic) IBOutlet UILabel* placeTermsValueLabel;

@end
