

#import "SelectionsViewController.h"
#import "DatabaseManager.h"
#import "Selection.h"
#import "ModelFactory.h"

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
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(submitButton:)];
    [super viewDidLoadWithEntity:SelectionEntityName andButton:saveButton];
}

#pragma mark - Table view delegate

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
        SelectionAdderViewController* modalController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:SelectionAdderView];
        modalController.delegate = self;
        [self presentModalViewController:modalController animated:YES];
    }   
}

- (IBAction)submitButton:(id)sender 
{
    [self.delegate submitSelections:self.entities];
    [self.navigationController popViewControllerAnimated:YES]; 
}

@end
