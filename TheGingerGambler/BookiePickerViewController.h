
#import <UIKit/UIKit.h>
#import "EditableTableViewController.h"
#import "CategorySelectorReceiver.h"

@interface BookiePickerViewController : EditableTableViewController

@property (nonatomic, weak) id<CategorySelectorReceiver> delegate;

@end
