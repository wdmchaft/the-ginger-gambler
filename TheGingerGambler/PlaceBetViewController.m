//
//  PlaceBetViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "PlaceBetViewController.h"
#import "DatabaseManager.h"
#import "Bookie.h"
#import "Sport.h"
#import "Bet.h"
#import "AppDelegate.h"

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
    
    bet = [[Bet alloc] initWithEntity:[DatabaseManager entityDescriptionFor:BET_ENTITY_NAME] insertIntoManagedObjectContext:[DatabaseManager context]];
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
    DLog(@"Selected sport category with name %@", [sport name]);
    [bet setSport:(Sport*)sport];
    self.sportSelect.textLabel.text = [sport name];
}

- (void) selectBookie:(Bookie*)bookie
{
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
    if([[segue identifier] isEqualToString:SELECT_BOOKIE_SEGUE] || [[segue identifier] isEqualToString:SELECT_BOOKIE_SEGUE])
    {
        EditableTableViewController* editableTableController = (EditableTableViewController*)[segue destinationViewController];
        [editableTableController setDelegate:self]; 
    }
    else if([[segue identifier] isEqualToString:ENTER_PRICE_ODDS_SEGUE])
    {
        PriceOddsViewController* priceOddsController = (PriceOddsViewController*)[segue destinationViewController];
        [priceOddsController setDelegate:self];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
