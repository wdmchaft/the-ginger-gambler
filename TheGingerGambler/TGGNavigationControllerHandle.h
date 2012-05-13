//
//  TGGNavigationControllerHandle.h
//  TheGingerGambler
//
//  Created by john bower on 12/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TGGNavigationController.h"

@protocol TGGNavigationControllerHandle <NSObject>

- (TGGNavigationController*)tggNavigationController;
- (void) initPlaceBetWizard;
- (void) selectionCountForWizardBet;

@end
