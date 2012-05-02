//
//  BookieAdderViewController.h
//  TheGingerGambler
//
//  Created by John Bower on 3/26/12.
//  Copyright (c) 2012 John Bower. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdderNotifications <NSObject>

@optional
- (void) add:(NSString*) name;

@end

@interface CategoryAdderViewController : UIViewController

@property (nonatomic, weak) id<AdderNotifications> delegate;

@property (weak, nonatomic) IBOutlet UITextField* nameTextField;

- (IBAction)save:(id)sender;

@end
