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
@property BOOL keyboardIsShown;

@property (weak, nonatomic) UITextField* activeField; 

- (void)registerForKeyboardNotifications;
- (void)keyboardWasShown:(NSNotification*)notification;
- (NSString*)suggestName;

@end

@implementation SelectionAdderViewController

@synthesize descriptionTextField;
@synthesize oddsTextField;
@synthesize placeTermsTextField;
@synthesize placeTermsLabel;

@synthesize modaNavigationBar;

@synthesize delegate;
@synthesize presentedAsModal;
@synthesize selection;

@synthesize keyboardIsShown;
@synthesize scrollView;

@synthesize activeField;

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

    if(!self.presentedAsModal)
    {
        [modaNavigationBar setHidden:YES];
        UIBarButtonItem* submit = [[UIBarButtonItem alloc] initWithTitle:@"submit" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
        self.title = @"Add Selection";
        // displays an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = submit;
    }
    [self registerForKeyboardNotifications];
    [self keyboardWillBeHidden:nil];
    
    // So I can detect when a field is selected and move view accordingly
    self.descriptionTextField.delegate = self;
    self.oddsTextField.delegate = self;
    self.placeTermsTextField.delegate = self;
    
    // Suggest name
    self.descriptionTextField.text = [self suggestName];
}

- (void)viewDidUnload
{
    self.descriptionTextField = nil;
    [self setPlaceTermsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in scrollView.subviews)
    {
        scrollViewHeight += view.frame.size.height;
    }
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [scrollView setContentSize:(CGSizeMake(screenRect.size.width, scrollViewHeight))];
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

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    CGPoint scrollPoint = CGPointMake(0.0, self.activeField.frame.origin.y-(scrollView.contentSize.height/4));
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
    DLog("Active field contains text : %@", self.activeField.text);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == oddsTextField)
    {
        // check values aren't being deleted
        if(range.location >= textField.text.length)
        {
            self.descriptionTextField.text = [NSString stringWithFormat:@"%@%@", [self suggestName], string];
        }
        else 
        {
            self.descriptionTextField.text = [NSString stringWithFormat:@"%@%@", [[self suggestName] substringToIndex:(self.descriptionTextField.text.length - 1)], string];
        }
        
    }
    return YES;
}

- (TGGNavigationController*) tggNavigationController
{
    return (TGGNavigationController*)self.navigationController;
}

- (NSString*)nextItem
{
    return SelectionsView;
}

- (NSString*)suggestName
{
    return [NSString stringWithFormat:@"%@ - %@",[self.delegate bookieAndSport], self.oddsTextField.text];
}

@end
