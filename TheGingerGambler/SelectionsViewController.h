//
//  SelectionAdderViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableTableViewController.h"
#import "SelectionAdderViewController.h"

@protocol SelectionsAddedReceiver <NSObject>

- (void) submitSelections:(NSMutableArray*) selections;

@end

@interface SelectionsViewController : EditableTableViewController <SelectionNotifications> 

@property (nonatomic, weak) id<SelectionsAddedReceiver> delegate;

@end
