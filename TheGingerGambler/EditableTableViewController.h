//
//  EditableTableViewController.h
//  TheGingerGambler
//
//

#import <UIKit/UIKit.h>

#import "CategoryAdderViewController.h"
#import "TGGNavigationControllerHandle.h"
#import "Delegator.h"

@class Sport;
@class Bookie;

@interface EditableTableViewController : UITableViewController <AdderNotifications, TGGNavigationControllerHandle> {
}

@property (strong) NSMutableArray* entities;

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;


@end
