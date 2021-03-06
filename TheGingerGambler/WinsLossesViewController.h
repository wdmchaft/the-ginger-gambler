//
//  PlaceBetViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategorySelectorReceiver.h"

@interface WinsLossesViewController : UITableViewController<CategorySelectorReceiver>

@property (weak, nonatomic) IBOutlet UITableViewCell *sportSelect;
@property (weak, nonatomic) IBOutlet UITableViewCell *bookieSelect;

@property (weak, nonatomic) IBOutlet UITableViewCell* winsLossesCell;

@end
