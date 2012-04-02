//
//  PlaceBetViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "PlaceBetViewController.h"
#import "DatabaseManager.h"
#import "ModelFactory.h"
#import "Bookie.h"
#import "Sport.h"
#import "Bet.h"

@implementation PlaceBetViewController

@synthesize bookieSelect;
@synthesize sportSelect;
@synthesize priceOddsCell;

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

- (void) enter:(NSDecimalNumber*)price with:(NSDecimalNumber*)odds
{
    DLog(@"Price and odds set %@", [NSString stringWithFormat:@"%@ : %@", [price stringValue], [odds stringValue]]);
    [bet setAmount:price];
    [bet setOdds:odds];
    self.priceOddsCell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", [price stringValue], [odds stringValue]];
}

-(void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:PickBookieSegue] || [[segue identifier] isEqualToString:PickSportSegue])
    {
        EditableTableViewController* editableTableController = (EditableTableViewController*)[segue destinationViewController];
        [editableTableController setDelegate:self]; 
    }
    else if([[segue identifier] isEqualToString:EnterPriceAndOddsSegue])
    {
        PriceOddsViewController* priceOddsController = (PriceOddsViewController*)[segue destinationViewController];
        [priceOddsController setDelegate:self];
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
