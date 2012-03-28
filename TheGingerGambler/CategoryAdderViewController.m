//
//  BookieAdderViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/26/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "CategoryAdderViewController.h"

@implementation CategoryAdderViewController

@synthesize nameTextField;
@synthesize delegate;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)save:(id)sender 
{
    if([[self delegate] respondsToSelector:@selector(add:)])
    {
        [[self delegate] add:self.nameTextField.text];
    }
    [self dismissModalViewControllerAnimated:YES];
}
@end
