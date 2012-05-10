//
//  PlaceBetViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "PlaceBetViewController.h"
#import "BookiePickerViewController.h"
#import "SportPickerViewController.h"
#import "StakeAdderViewController.h"
#import "DatabaseManager.h"
#import "ModelFactory.h"
#import "NumberManipulator.h"
#import "Bookie.h"
#import "Sport.h"
#import "Bet.h"

@implementation PlaceBetViewController

@synthesize bookieSelect;
@synthesize sportSelect;
@synthesize priceOddsCell;
@synthesize stakeCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    bet = nil;
    [self setBookieSelect:nil];
    [self setSportSelect:nil];
    [self setPriceOddsCell:nil];
    [self setStakeCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) selectSport:(Sport*)sport
{
    if(!bet)
    {
        bet = [ModelFactory createBet];
    }
    DLog(@"Selected sport category with name %@", [sport name]);
    [bet setSport:(Sport*)sport];
    self.sportSelect.textLabel.text = [sport name];
}

- (void) selectBookie:(Bookie*)bookie
{
    if(!bet)
    {
        bet = [ModelFactory createBet];
    }
    DLog(@"Selected bookie category with name %@", [bookie name]);
    [bet setBookie:(Bookie*)bookie];
    self.bookieSelect.textLabel.text = [bookie name];
}

- (void) submitSelections:(NSMutableArray*)selections
{
    if(!bet)
    {
        bet = [ModelFactory createBet];
    }
    DLog(@"%i Selections set", selections.count);
    bet.selections = [NSSet setWithArray:selections];
    self.priceOddsCell.textLabel.text = [NSString stringWithFormat:@"%i Selections set", selections.count];
}

- (void) submitStake:(NSDecimalNumber*)stake
{
    if(!bet)
    {
        bet = [ModelFactory createBet];
    }
    DLog(@"%@ Set stake with amount", stake);
    bet.amount = stake;
    self.stakeCell.textLabel.text = [NumberManipulator formattedStringWithDecimal:stake];
}

-(void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:PickBookieSegue])
    {
        BookiePickerViewController* editableTableController = (BookiePickerViewController*)[segue destinationViewController];
        [editableTableController setDelegate:self]; 
    }
    else if([[segue identifier] isEqualToString:PickSportSegue])
    {
        SportPickerViewController* editableTableController = (SportPickerViewController*)[segue destinationViewController];
        [editableTableController setDelegate:self]; 
    }
    else if([[segue identifier] isEqualToString:PickSelectionsSegue])
    {
        SelectionsViewController* selectionsViewController = (SelectionsViewController*)[segue destinationViewController];
        [selectionsViewController setDelegate:self];
    }
    else if([[segue identifier] isEqualToString:PickStakeSegue])
    {
        StakeAdderViewController* stakesViewController = (StakeAdderViewController*)[segue destinationViewController];
        [stakesViewController setDelegate:self];
    }
}

- (IBAction)betButton:(id)sender 
{   
    bet.status = [ NSNumber numberWithInt:kPlacedState];
    [DatabaseManager save];
    ALog(@"Bet placed : %@", [bet name]);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
