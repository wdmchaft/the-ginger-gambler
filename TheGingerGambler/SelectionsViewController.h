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

@protocol SelectionsSubmitNotifications <NSObject>

- (void) submitSelections:(NSMutableArray*) selections;

@end

@interface SelectionsViewController : EditableTableViewController <SelectionNotifications> 

- (IBAction)submitButton:(id)sender;

@end
