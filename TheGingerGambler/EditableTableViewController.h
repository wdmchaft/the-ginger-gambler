//
//  EditableTableViewController.h
//  TheGingerGambler
//
//

#import <UIKit/UIKit.h>

#import "CategoryAdderViewController.h"

@class Sport;
@class Bookie;

@interface EditableTableViewController : UITableViewController <AdderNotifications> {
}

@property (strong) NSMutableArray* entities;

- (void)viewDidLoadWithEntity:(NSString*)name;
- (void)viewDidLoadWithEntity:(NSString*)name andButton:(UIBarButtonItem*)button;

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;


@end
