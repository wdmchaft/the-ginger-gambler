//
//  PlaceBetViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "WinsLossesViewController.h"
#import "DatabaseManager.h"
#import "ModelFactory.h"
#import "Bookie.h"
#import "Sport.h"
#import "Bet.h"
#import "NumberManipulator.h"

@interface WinsLossesViewController()
{
@private
    Bookie* selectedBookie;
    Sport* selectedSport;
} 

@property (strong, nonatomic) Bookie* selectedBookie;
@property (strong, nonatomic) Sport* selectedSport;

- (void) calculateProfits;
- (NSPredicate*) categoryPredicate;

@end
    
@implementation WinsLossesViewController

@synthesize bookieSelect;
@synthesize sportSelect;
@synthesize winsLossesCell;
@synthesize selectedBookie;
@synthesize selectedSport;

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
    [self setBookieSelect:nil];
    [self setSportSelect:nil];
    [self setWinsLossesCell:nil];
    [self setSportSelect:nil];
    [self setBookieSelect:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self calculateProfits];
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
    self.selectedSport = sport;
    [self calculateProfits];
    self.sportSelect.textLabel.text = [self.selectedSport name];
}

- (void) selectBookie:(Bookie*)bookie
{
    self.selectedBookie = bookie;
    [self calculateProfits];
    self.bookieSelect.textLabel.text = [self.selectedBookie name];
}

- (void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:PickBookieSegue] || [[segue identifier] isEqualToString:PickSportSegue])
    {
        EditableTableViewController* editableTableController = (EditableTableViewController*)[segue destinationViewController];
        [editableTableController setDelegate:self]; 
    }
}

- (void) calculateProfits
{   
    NSFetchRequest* winsLossesRequest = [DatabaseManager fetchReqestForEntitiesWith:BetEntityName]; 
    [winsLossesRequest setPredicate:self.categoryPredicate];
    [winsLossesRequest setResultType:NSDictionaryResultType];
    NSArray* props = [NSArray arrayWithObjects:@"amount", @"odds", @"status", nil];
    [winsLossesRequest setPropertiesToFetch:props];
    // amounts is an array of dictionaries, each hold the desired property values.
    NSArray* amounts = [DatabaseManager executeFetchRequest:winsLossesRequest]; 
    
    // Loop and sum the individual amounts
    NSDecimalNumber* total = [NSDecimalNumber zero];
    
    // Should do something with auto release pool
    for (NSDictionary* result in amounts) 
    {
        NSDecimalNumber* amount = [result valueForKeyPath:@"amount"];
        if([[result valueForKeyPath:@"status"] intValue] == kWonState)
        {
            NSDecimalNumber* odds = [result valueForKeyPath:@"odds"];
            
            // do the unit rate multiplication and accumulate the result in the total
            
            NSDecimalNumber* betWinnings = [amount decimalNumberByMultiplyingBy:odds];   
            total = [total decimalNumberByAdding:betWinnings];
        }
        else 
        {
            total = [total decimalNumberBySubtracting:amount];
        }
    }
    winsLossesCell.textLabel.text = [NumberManipulator formattedStringWithDecimal:total];
}

- (NSPredicate*) categoryPredicate
{
    // Get wins and losses in separate predicates as different operations are performed
    NSMutableArray* winsPredicates = [NSMutableArray arrayWithObject:[NSPredicate predicateWithFormat:@"(status == %i) OR (status == %i)", kWonState, kLossedState]];
    if(self.selectedSport != nil)
    {
        NSPredicate* sportPredicate = [NSPredicate predicateWithFormat:@"sport == %@", selectedSport];
        [winsPredicates addObject:sportPredicate];
    }
    if(self.selectedBookie != nil)
    {
        NSPredicate* bookiePredicate = [NSPredicate predicateWithFormat:@"bookie == %@", selectedBookie];
        [winsPredicates addObject:bookiePredicate];
    }
    return [NSCompoundPredicate andPredicateWithSubpredicates:winsPredicates];
}


@end
