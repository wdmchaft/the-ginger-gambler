//
//  StakeAdderViewController.m
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "StakeAdderViewController.h"
#import "NumberManipulator.h"

@interface StakeAdderViewController ()

@end

@implementation StakeAdderViewController

@synthesize stakeTextField;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setStakeTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)stakeSubmitButton:(id)sender 
{
    [self.delegate submitStake:[NSDecimalNumber decimalNumberWithString:self.stakeTextField.text]]; 
    [self.navigationController popViewControllerAnimated:TRUE];
}
@end
