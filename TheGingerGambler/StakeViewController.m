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
#import "NumberManipulator.h"

@interface StakeViewController ()

@property (strong) NSMutableSet* betTypes; 

@end

@implementation StakeViewController

@synthesize selectionCount;
@synthesize delegate;
@synthesize betTypes;

- (void)setUpWithBetTypes:(NSMutableSet*)newBetTypes
{
    self.betTypes = newBetTypes;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selectionCount = [self.tggNavigationController selectionCountForWizardBet];
    if(self.betTypes == nil)
    {
        self.betTypes = [NSMutableArray array];
    } 
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
    
    if(self.betTypes.count != 0)
    {
        for (UnitBet* betType in self.betTypes) 
        {
            if([betType.unitbet intValue] == (indexPath.row + 1))
            {
                [cell.betStickSwitch setSelectedSegmentIndex:0];
                cell.stakeTextField.text = [NumberManipulator formattedStringWithDecimal:betType.stake];
                [cell betStickSwitched:cell.betStickSwitch];
            }
        }
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
    for (int i = 0; i < [self.tableView numberOfRowsInSection:0]; i++) 
    {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        StakeCell* cell = (StakeCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        if (cell.betStickSwitch.selectedSegmentIndex == BetSegment) 
        {
            UnitBet* unitBet = [ModelFactory createUnitBet];
            unitBet.unitbet = [NSNumber numberWithInt:i + 1];
            unitBet.stake = [NSDecimalNumber decimalNumberWithString:cell.stakeTextField.text];
            [self.betTypes addObject:unitBet];
        }
    } 
    [self.delegate submitStakes:betTypes]; 

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

- (NSString*)nextItem
{
    return PlaceBetView;
}
     
@end
