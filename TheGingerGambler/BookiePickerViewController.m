

#import "BookiePickerViewController.h"
#import "DatabaseManager.h"
#import "Bookie.h"
#import "TGGNavigationController.h"

@implementation BookiePickerViewController

@synthesize delegate;

- (void) add:(NSString*)name
{
    Bookie* bookie = [[Bookie alloc] initWithEntity:[DatabaseManager entityDescriptionFor:BookieEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
    [bookie setName:name];
    [self.entities addObject:bookie];
    [DatabaseManager save];
    [self setEditing:YES];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoadWithEntity:BookieEntityName];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [self.delegate selectBookie:[self.entities objectAtIndex:indexPath.row]];
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
