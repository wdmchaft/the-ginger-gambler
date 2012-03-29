//
//  PriceOddsViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/28/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "PriceOddsViewController.h"

@implementation PriceOddsViewController

@synthesize priceTextField;
@synthesize oddsTextField;

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setPriceTextField:nil];
    [self setOddsTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveButton:(id)sender 
{
    [self.delegate enter:[NSDecimalNumber decimalNumberWithString:self.priceTextField.text] with:[NSDecimalNumber decimalNumberWithString:self.oddsTextField.text]];
    [self.navigationController popViewControllerAnimated:YES]; 
}



@end
