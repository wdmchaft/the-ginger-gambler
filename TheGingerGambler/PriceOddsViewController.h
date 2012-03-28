//
//  PriceOddsViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/28/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PriceWithOddsNotifications <NSObject>

- (void) enter:(NSDecimalNumber*)price with:(NSDecimalNumber*)odds; 

@end

@interface PriceOddsViewController : UIViewController

@property (nonatomic, weak) id<PriceWithOddsNotifications> delegate;

@property (weak, nonatomic) IBOutlet UITextField* priceTextField;
@property (weak, nonatomic) IBOutlet UITextField* oddsTextField;

- (IBAction)saveButton:(id)sender;

@end
