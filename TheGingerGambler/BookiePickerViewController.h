
#import <UIKit/UIKit.h>
#import "EditableTableViewController.h"
#import "CategorySelectorReceiver.h"
#import "WizardItem.h"

@interface BookiePickerViewController : EditableTableViewController<Delegator, WizardItem>

@property (nonatomic, weak) id<CategorySelectorReceiver> delegate;

@end
