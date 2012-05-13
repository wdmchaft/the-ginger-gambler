//
//  StakeViewController.m
//  TheGingerGambler
//
//  Created by john bower on 09/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "StakeViewController.h"
#import "StakeCell.h"
#import "ModelFactory.h"
#import "UnitBet.h"
#import "TGGNavigationController.h"
#import "Bet.h"

@interface StakeViewController ()

@end

@implementation StakeViewController

@synthesize selectionCount;
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selectionCount = [self.tggNavigationController selectionCountForWizardBet];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.selectionCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    StakeCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    switch (indexPath.row) 
    {
        case 0:
            cell.multipleLabel.text = Single;
            break;
        case 1:
            cell.multipleLabel.text = Double;
            break;
        case 2:
            cell.multipleLabel.text = Treble;
            break;    
        default:
            cell.multipleLabel.text = [NSString stringWithFormat:@"%i-@%", indexPath.row, Fold];
            break;
    }
    
    return cell;
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

- (IBAction)submitUnitBet:(id)sender 
{
    NSMutableArray* unitBets = [NSMutableArray array];
    for (int i = 0; i < [self.tableView numberOfRowsInSection:0]; i++) 
    {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        StakeCell* cell = (StakeCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        UnitBet* unitBet = [ModelFactory createUnitBet];
        unitBet.unitbet = [NSNumber numberWithInt:i + 1];
        unitBet.stake = [NSDecimalNumber decimalNumberWithString:cell.stakeTextField.text];
        [unitBets addObject:unitBet];
    } 
    [self.delegate submitStakes:unitBets]; 

    if([self.tggNavigationController placeBetWizardInProgress])
    {
        [self.tggNavigationController next];
    }
    else 
    {
        [self.tggNavigationController popViewControllerAnimated:YES];
    }
}

- (TGGNavigationController*) tggNavigationController
{
    return (TGGNavigationController*)self.navigationController;
}
     
@end
