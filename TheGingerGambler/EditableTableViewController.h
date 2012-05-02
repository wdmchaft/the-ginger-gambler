//
//  EditableTableViewController.h
//  TheGingerGambler
//
//

#import <UIKit/UIKit.h>

#import "CategoryAdderViewController.h"

@class Sport;
@class Bookie;

@protocol CategorySelectorNotifications <NSObject>

- (void) selectSport:(Sport*) sport;
- (void) selectBookie:(Bookie*) bookie;

@end

@interface EditableTableViewController : UITableViewController <AdderNotifications> {
}

@property (nonatomic, weak) id<CategorySelectorNotifications> delegate;

@property (strong) NSMutableArray* entities;

- (void)viewDidLoadWithEntity:(NSString*)name;

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;


@end
