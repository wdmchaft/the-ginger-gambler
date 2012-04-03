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

@implementation WinsLossesViewController

@synthesize bookieSelect;
@synthesize sportSelect;
@synthesize winsLossesCell;

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"status == %i", kPlacedState];
    NSExpression* winsLossesExpression = [NSExpression expressionForKeyPath:@"amount"];
    NSExpression* winsLossesSummationExpression = [NSExpression expressionForFunction:@"sum:" arguments:[NSArray arrayWithObject:winsLossesExpression]];
    NSExpressionDescription* expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setName:@"sumAmount"];
    [expressionDescription setExpression:winsLossesSummationExpression];
    [expressionDescription setExpressionResultType:NSDecimalAttributeType];
    NSMutableArray* summationResultsArray = [DatabaseManager entitiesWith:BetEntityName withPredicate:predicate andExpression:expressionDescription];
    NSNumber* decimal = [[summationResultsArray objectAtIndex:0] valueForKey:@"sumAmount"];
    winsLossesCell.textLabel.text = [NSString stringWithFormat:@"%d", decimal];

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
}

- (void) selectBookie:(Bookie*)bookie
{
}

-(void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:PickBookieSegue] || [[segue identifier] isEqualToString:PickSportSegue])
    {
        EditableTableViewController* editableTableController = (EditableTableViewController*)[segue destinationViewController];
        [editableTableController setDelegate:self]; 
    }
}

@end
