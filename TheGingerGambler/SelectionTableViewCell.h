//
//  SelectionTableViewCell.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* description;
@property (weak, nonatomic) IBOutlet UILabel* odds;
@property (weak, nonatomic) IBOutlet UILabel* placeTerms;

@end
