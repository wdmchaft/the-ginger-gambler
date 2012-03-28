//
//  EditableTableViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/27/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryAdderViewController.h"

@class Sport;
@class Bookie;

@protocol CategorySelectorNotifications <NSObject>

- (void) selectSport:(Sport*) sport;
- (void) selectBookie:(Bookie*) bookie;

@end

@interface EditableTableViewController : UITableViewController <AdderNotifications>{
}

@property (nonatomic, weak) id<CategorySelectorNotifications> delegate;

@property (strong) NSMutableArray* entities;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath entityCell:(NSString*)name;
- (void)viewDidLoadWithEntity:(NSString*)name;

@end
