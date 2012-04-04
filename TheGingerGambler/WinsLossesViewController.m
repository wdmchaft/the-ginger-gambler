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
    NSMutableArray* predicates = [NSMutableArray arrayWithObject:[NSPredicate predicateWithFormat:@"status == %i", kWonState]];
    if(self.selectedSport != nil)
    {
        [predicates addObject:[NSPredicate predicateWithFormat:@"sport.objectID == %@", selectedSport.objectID]];
    }
    if(self.selectedBookie != nil)
    {
        [predicates addObject:[NSPredicate predicateWithFormat:@"bookie.objectID == %@", selectedBookie.objectID]];
    }
    NSExpression* winsLossesExpression = [NSExpression expressionForKeyPath:@"amount"];
    NSExpression* winsLossesSummationExpression = [NSExpression expressionForFunction:@"sum:" arguments:[NSArray arrayWithObject:winsLossesExpression]];
    NSExpressionDescription* expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setName:@"sumAmount"];
    [expressionDescription setExpression:winsLossesSummationExpression];
    [expressionDescription setExpressionResultType:NSDecimalAttributeType];
    NSMutableArray* summationResultsArray = [DatabaseManager entitiesWith:BetEntityName withPredicate:[NSCompoundPredicate andPredicateWithSubpredicates:predicates] andExpression:expressionDescription];
    NSDecimalNumber* decimal = [[summationResultsArray objectAtIndex:0] valueForKey:@"sumAmount"];
    winsLossesCell.textLabel.text = [NumberManipulator formattedStringWithDecimal:decimal];   
}

@end
