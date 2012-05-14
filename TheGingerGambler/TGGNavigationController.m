//
//  TGGNavigationController.m
//  TheGingerGambler
//
//  Created by john bower on 12/05/2012.
//  Copyright (c) John Bower. All rights reserved.
//

#import "TGGNavigationController.h"
#import "PlaceBetWizardManager.h"
#import "WizardItem.h"

@interface TGGNavigationController () 

@end

@implementation TGGNavigationController

@synthesize placeBetWizard;

- (void) initPlaceBetWizard
{
    self.placeBetWizard = [[PlaceBetWizardManager alloc] initWithNavigationController:self];
    [self.placeBetWizard start];
}

- (BOOL)placeBetWizardInProgress
{
    if(self.placeBetWizard)
    {
        return [self.placeBetWizard isInProgress];
    }
    return NO;
}

- (NSInteger)selectionCountForWizardBet
{
    return [self.placeBetWizard selectionCount];
}

- (void) next
{
    if([placeBetWizard isInProgress])
    {
        [placeBetWizard next];
    }
    else 
    {
        [self popViewControllerAnimated:YES];
    }
}

- (NSString*) proceedingWizardViewController
{
    if([self.visibleViewController conformsToProtocol:@protocol(WizardItem)])
    {
        return [(UIViewController<WizardItem>*) self.visibleViewController nextItem]; 
    }
    return nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
