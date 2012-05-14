//
//  BookieAdderViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "SelectionAdderViewController.h"
#import "ModelFactory.h"
#import "Selection.h"
#import "NumberManipulator.h"

@interface SelectionAdderViewController()

@property (strong, nonatomic) Selection* selection;

@end

@implementation SelectionAdderViewController

@synthesize descriptionTextField;
@synthesize oddsTextField;
@synthesize placeTermsTextField;
@synthesize placeTermsLabel;

@synthesize delegate;
@synthesize presentedAsModal;
@synthesize selection;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selection = [ModelFactory createSelection];
    
    UIBarButtonItem* submit = [[UIBarButtonItem alloc] initWithTitle:@"submit" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.title = @"Add Selection";
    // displays an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = submit;
}

- (void)viewDidUnload
{
    self.descriptionTextField = nil;
    [self setPlaceTermsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)winOnlyEachWaySwitched:(UISegmentedControl*)sender 
{
    const NSInteger winOnlySegment = 0;
    const NSInteger eachWaySegment = 1;
    
    if(sender.selectedSegmentIndex  == winOnlySegment)
    {
        [self.placeTermsTextField setHidden:YES];
        [self.placeTermsLabel setHidden:YES];
    }
    else if(sender.selectedSegmentIndex == eachWaySegment) 
    {
        [self.placeTermsTextField setHidden:NO];
        [self.placeTermsLabel setHidden:NO];
    }
}

- (IBAction)save:(id)sender 
{
    self.selection.name = self.descriptionTextField.text;
    self.selection.odds = [NumberManipulator decimalWithString:self.oddsTextField.text];
    self.selection.placeterms = [NumberManipulator decimalWithString:self.placeTermsTextField.text];
    
    if([[self delegate] respondsToSelector:@selector(submitSelection:)])
    {
        [[self delegate] submitSelection:self.selection]; 
    }
    
    if([self presentedAsModal])
    {
        [self dismissModalViewControllerAnimated:YES];
    }
    else 
    {
        [self.tggNavigationController next];
    }
}

- (TGGNavigationController*) tggNavigationController
{
    return (TGGNavigationController*)self.navigationController;
}

- (NSString*)nextItem
{
    return SelectionsView;
}

@end
