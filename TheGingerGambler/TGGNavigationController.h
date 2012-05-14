//
//  TGGNavigationController.h
//  TheGingerGambler
//
//  Created by john bower on 12/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlaceBetWizardManager;

@interface TGGNavigationController : UINavigationController

@property (strong, nonatomic) PlaceBetWizardManager* placeBetWizard;

- (void)next;
- (NSString*) proceedingWizardViewController;
- (BOOL)placeBetWizardInProgress;
- (void)initPlaceBetWizard;
- (NSInteger)selectionCountForWizardBet;

@end
