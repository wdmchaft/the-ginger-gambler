//
//  PlaceBetWizardManager.h
//  TheGingerGambler
//
//  Created by john bower on 12/05/2012.
//  Copyright (c) John Bower. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CategorySelectorReceiver.h"
#import "StakeViewController.h"
#import "SelectionsViewController.h"

@interface PlaceBetWizardManager : NSObject<CategorySelectorReceiver, SelectionsAddedReceiver, SubmitStakesReceiver, SubmitSelectionReceiver>

@property BOOL isInProgress;

- (id) initWithNavigationController:(UINavigationController*)controller;
- (void)start;
- (void)next;
- (NSInteger)selectionCount;

@end
