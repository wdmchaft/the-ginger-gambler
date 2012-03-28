

#import "BookiePickerViewController.h"
#import "BookieAdderViewController.h"
#import "DatabaseManager.h"
#import "Bookie.h"

@implementation BookiePickerViewController

- (void) add:(NSString *)name
{
    Bookie* bookie = [[Bookie alloc] initWithEntity:[DatabaseManager entityDescriptionFor:BOOKIE_ENTITY_NAME] insertIntoManagedObjectContext:[DatabaseManager context]];
    [bookie setName:name];
    [self.entities addObject:bookie];
    [DatabaseManager save];
    [self setEditing:YES];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoadWithEntity:BOOKIE_ENTITY_NAME];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return [super tableView:tableView cellForRowAtIndexPath:indexPath entityCell:BOOKIE_ENTITY_NAME];
}

@end
