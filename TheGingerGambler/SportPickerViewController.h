//
//  SportPickerViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableTableViewController.h"
#import "CategorySelectorReceiver.h"

@interface SportPickerViewController : EditableTableViewController

@property (nonatomic, weak) id<CategorySelectorReceiver> delegate;

@end
