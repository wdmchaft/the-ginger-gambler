

#import "SelectionsViewController.h"
#import "DatabaseManager.h"
#import "Selection.h"
#import "ModelFactory.h"
#import "TGGNavigationController.h"

@implementation SelectionsViewController

@synthesize delegate;

- (void) addDescription:(NSString*)description odds:(NSDecimalNumber*)odds placeTerms:(NSDecimalNumber*)placeTerms
{
    Selection* selection = [ModelFactory createSelection];
    selection.name = description;
    selection.odds = odds;
    selection.placeterms = placeTerms;
    [self.entities addObject:selection];
    [self setEditing:YES];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoadWithEntity:SelectionEntityName];
}

#pragma mark - Table view delegate

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) 
    {
        // Delete the row from the data source
        [self.entities removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) 
    {
        SelectionAdderViewController* modalController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:SelectionsView];
        modalController.delegate = self;
        [self presentModalViewController:modalController animated:YES];
    }   
}

- (IBAction)submitButton:(id)sender 
{
    [self.delegate submitSelections:self.entities];
    if([self.tggNavigationController placeBetWizardInProgress])
    {
        [self.tggNavigationController next];
    }
    else 
    {
        [self.tggNavigationController popViewControllerAnimated:YES];
    }
}

@end
