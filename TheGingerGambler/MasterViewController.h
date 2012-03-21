//
//  MasterViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/14/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *placeBetsTextField;
@property (weak, nonatomic) IBOutlet UITableViewCell *settleBetsTextField;
@property (weak, nonatomic) IBOutlet UITableViewCell *winsLossesTextField;

@end
