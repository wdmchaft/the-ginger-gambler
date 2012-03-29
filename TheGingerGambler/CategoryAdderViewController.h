//
//  BookieAdderViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#define VIEW_CATEGORY_ADDER @"ViewCategoryAdder" 

#import <UIKit/UIKit.h>

@protocol AdderNotifications <NSObject>

@optional
- (void) add:(NSString*) name;

@end

@interface CategoryAdderViewController : UIViewController

@property (nonatomic, weak) id<AdderNotifications> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)save:(id)sender;

@end
