//
//  BookieAdderViewController.h
//  TheGingerGambler
//
//  Created by John Bower on 3/26/12.
//  Copyright (c) John Bower. All rights reserved.
//

#define VIEW_CATEGORY_ADDER @"ViewCategoryAdder" 

#import <UIKit/UIKit.h>

@protocol SelectionNotifications <NSObject>

- (void) addDescription:(NSString*)description odds:(NSDecimalNumber*)odds placeTerms:(NSDecimalNumber*)placeTerms;

@end

@interface SelectionAdderViewController : UIViewController

@property (nonatomic, weak) id<SelectionNotifications> delegate;

@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *oddsTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeTermsTextField;

- (IBAction)save:(id)sender;

@end
