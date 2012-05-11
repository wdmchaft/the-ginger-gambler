//
//  BetPickerViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/22/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Selection;

@protocol BetSelectorNotifications <NSObject>
    
- (void) selectSelection:(Selection*)selection;

@end

@interface BetPickerViewController : UITableViewController

@property (nonatomic, weak) id<BetSelectorNotifications> delegate;

@property (strong) NSArray* bets;

@end
