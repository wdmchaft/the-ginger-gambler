//
//  SettleBetViewController.m
//  TheGingerGambler
//

#import "SettleBetViewController.h"
#import "Selection.h"
#import "DatabaseManager.h"


@implementation SettleBetViewController

@synthesize settleBetCell;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setSettleBetCell:nil];
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

- (IBAction)settleBetButton:(id)sender {
    if(selection != nil)
    {
        [selection.bet updateStatus];
        [DatabaseManager save];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
 - (IBAction)setWonOrLossed:(UISegmentedControl*)sender 
{
    if(selection != nil)
    {
        selection.selectionStatus = [sender selectedSegmentIndex] == 0 ? kWonState : kLossedState;    
    }
}

- (void)selectSelection:(Selection*)selectedSelection
{
    settleBetCell.textLabel.text = [selectedSelection name];
    selection = selectedSelection;
}

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

-(void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:PickBetSegue])
    {
        BetPickerViewController* betPickerController = (BetPickerViewController*)[segue destinationViewController];
        [betPickerController setDelegate:self]; 
    }
}

@end
