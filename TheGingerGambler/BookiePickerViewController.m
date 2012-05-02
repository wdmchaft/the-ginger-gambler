

#import "BookiePickerViewController.h"
#import "DatabaseManager.h"
#import "Bookie.h"

@implementation BookiePickerViewController

- (void) add:(NSString *)name
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate selectBookie:[self.entities objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES]; 
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
