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

@end

@interface SelectionAdderViewController : UIViewController<TGGNavigationControllerHandle, WizardItem, Delegator>

@property (nonatomic, weak) id<SubmitSelectionReceiver> delegate;

@property BOOL presentedAsModal;

@property (weak, nonatomic) IBOutlet UITextField* descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField* oddsTextField;
@property (weak, nonatomic) IBOutlet UITextField* placeTermsTextField;
@property (weak, nonatomic) IBOutlet UILabel *placeTermsLabel;

- (IBAction)winOnlyEachWaySwitched:(UISegmentedControl *)sender;

- (IBAction)save:(id)sender;

@end
