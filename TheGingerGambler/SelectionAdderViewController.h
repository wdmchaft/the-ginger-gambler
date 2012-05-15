//
//  BookieAdderViewController.h
//  TheGingerGambler
//
//  Created by John Bower on 3/26/12.
//  Copyright (c) John Bower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGGNavigationControllerHandle.h"
#import "Delegator.h"
#import "WizardItem.h"

@class Selection;

@protocol SubmitSelectionReceiver <NSObject>

- (void) submitSelection:(Selection*)selection;
- (NSString*) bookieAndSport; 

@end

@interface SelectionAdderViewController : UIViewController<TGGNavigationControllerHandle, WizardItem, Delegator, UITextFieldDelegate>

@property (nonatomic, weak) id<SubmitSelectionReceiver> delegate;

@property BOOL presentedAsModal;

@property (weak, nonatomic) IBOutlet UITextField* descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField* oddsTextField;
@property (weak, nonatomic) IBOutlet UITextField* placeTermsTextField;
@property (weak, nonatomic) IBOutlet UILabel *placeTermsLabel;
 
@property (weak, nonatomic) IBOutlet UINavigationBar *modaNavigationBar;

@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;


- (IBAction)winOnlyEachWaySwitched:(UISegmentedControl *)sender;

- (IBAction)save:(id)sender;

@end
