//
//  StakeAdderViewController.h
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StakeSubmitReceiver <NSObject>

- (void) submitStake:(NSDecimalNumber*)stake;

@end

@interface StakeAdderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *stakeTextField;
@property (nonatomic, weak) id<StakeSubmitReceiver> delegate;

- (IBAction)stakeSubmitButton:(id)sender;

@end
