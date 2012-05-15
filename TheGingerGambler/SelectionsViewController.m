

#import "SelectionsViewController.h"
#import "DatabaseManager.h"
#import "Selection.h"
#import "ModelFactory.h"
#import "TGGNavigationController.h"

@implementation SelectionsViewController

@synthesize delegate;

- (void)setUpWithSelection:(Selection*)newSelection
{
    self.entities = [NSMutableArray arrayWithObject:newSelection];
}

- (void)setUpWithSelections:(NSMutableArray*)newSelections
{
    self.entities = newSelections;    
}


- (void) submitSelection:(Selection *)selection
{
    [self.entities addObject:selection];
    [self setEditing:YES];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.entities == nil)
    {
        self.entities = [NSMutableArray array];
    }
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
        SelectionAdderViewController* modalController = [[UIStoryboard storyboardWithName:StoryboardName bundle:NULL] instantiateViewControllerWithIdentifier:SelectionAdderView];
        modalController.delegate = self;
        modalController.presentedAsModal = YES;
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

- (NSString*)nextItem
{
    return StakeView;
}

- (NSString*) bookieAndSport
{
    return [self.delegate bookieAndSport];
}

@end
