//
//  BookiePickerViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/20/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BookieAdderViewController.h"

@interface BookiePickerViewController : UITableViewController <AdderNotifications> {
}

@property (strong) NSMutableArray* bookies;

@end
