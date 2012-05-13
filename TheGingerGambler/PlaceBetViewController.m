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
#import "StakeViewController.h"
#import "DatabaseManager.h"
#import "ModelFactory.h"
#import "NumberManipulator.h"
#import "Bookie.h"
#import "Sport.h"
#import "Bet.h"

@interface PlaceBetViewController()

@property (weak, nonatomic) Bet* bet;
 
@end

@implementation PlaceBetViewController

@synthesize bookieSelect;
@synthesize sportSelect;
@synthesize priceOddsCell;
@synthesize stakeCell;
@synthesize bet;

- (void)setUpWithBet:(Bet*)newBet
{
    self.bet = newBet;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) 
    {
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
    if(self.bet)
    {
        self.sportSelect.textLabel.text = [self.bet.sport name];
        self.bookieSelect.textLabel.text = [self.bet.bookie name];
        self.stakeCell.textLabel.text = [NSString stringWithFormat:@"%i Stakes set", self.bet.unitbets.count];
        self.priceOddsCell.textLabel.text = [NSString stringWithFormat:@"%i Selections set", self.bet.selections.count];
    }
    else 
    {
        self.bet = [ModelFactory createBet];
    }
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.bet = nil;
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
    DLog(@"Selected sport category with name %@", [sport name]);
    [self.bet setSport:(Sport*)sport];
    self.sportSelect.textLabel.text = [sport name];
}

- (void) selectBookie:(Bookie*)bookie
{
    DLog(@"Selected bookie category with name %@", [bookie name]);
    [self.bet setBookie:(Bookie*)bookie];
    self.bookieSelect.textLabel.text = [bookie name];
}

- (void) submitSelections:(NSMutableArray*)selections
{
    DLog(@"%i Selections set", selections.count);
    self.bet.selections = [NSSet setWithArray:selections];
    self.priceOddsCell.textLabel.text = [NSString stringWithFormat:@"%i Selections set", selections.count];
}

- (void) submitStakes:(NSMutableArray*)stake
{
    DLog(@"%i Set stakes", stake.count);
    self.bet.unitbets = [NSSet setWithArray:stake];
    self.stakeCell.textLabel.text = [NSString stringWithFormat:@"%i Stakes set", stake.count];
}

-(void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:PickBookieSegue])
    {
        BookiePickerViewController* editableTableController = (BookiePickerViewController*)[segue destinationViewController];
        editableTableController.delegate = self; 
    }
    else if([[segue identifier] isEqualToString:PickSportSegue])
    {
        SportPickerViewController* editableTableController = (SportPickerViewController*)[segue destinationViewController];
        editableTableController.delegate = self; 
    }
    else if([[segue identifier] isEqualToString:PickSelectionsSegue])
    {
        SelectionsViewController* selectionsViewController = (SelectionsViewController*)[segue destinationViewController];
        selectionsViewController.delegate = self;
    }
    else if([[segue identifier] isEqualToString:PickStakeSegue])
    {
        StakeViewController* stakeViewController = (StakeViewController*)[segue destinationViewController];
        stakeViewController.selectionCount = self.bet.selections.count;
        stakeViewController.delegate = self;
    }
}

- (IBAction)betButton:(id)sender 
{   
    self.bet.status = [ NSNumber numberWithInt:kPlacedState];
    [DatabaseManager save];
    ALog(@"Bet placed : %@", [self.bet name]);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
