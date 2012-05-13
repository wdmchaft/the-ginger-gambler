//
//  BookiePickerViewController.m
//  TheGingerGambler
//
//  Created by John Bower on 3/20/12.
//  Copyright (c) 2012 John Bower. All rights reserved.
//

#import "EditableTableViewController.h"
#import "AppDelegate.h"
#import "DatabaseManager.h"
#import "CategoryAdderViewController.h"
#import "SelectionTableViewCell.h"
#import "Category.h"
#import "DictionaryPopulatable.h"
#import "TGGNavigationController.h"
#import "SportPickerViewController.h"

@implementation EditableTableViewController

@synthesize entities = _entities;

- (void) add:(NSString *)name
{
}

- (TGGNavigationController*)tggNavigationController
{
    return (TGGNavigationController*)self.navigationController;
}
   
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoadWithEntity:(NSString*)name
{
    [super viewDidLoad];
    
    // Preserves selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // displays an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.entities = [DatabaseManager entitiesFor:name];
}

- (void)viewDidLoadWithEntity:(NSString*)name andButton:(UIBarButtonItem*)button
{
    [super viewDidLoad];
    
    // Preserves selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // displays an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.editButtonItem, button, nil];
    
    self.entities = [DatabaseManager entitiesFor:name];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.entities = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return self.editing ? self.entities.count + 1 : self.entities.count;
    
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    
    NSString* cellIdentifier = @"Cell";
    
    BOOL addCell = (indexPath.row == self.entities.count);
    
    if(addCell)
    {
        cellIdentifier = @"AddCell";
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell =  (UITableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        if(!addCell)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    if(addCell)
    {
        cell.textLabel.text = @"Add...";
    }
    else
    {
        id<Category> category = [self.entities objectAtIndex:indexPath.row];
        if ([cell conformsToProtocol:@protocol(DictionaryPopulatable)])
        {
            [(UITableViewCell <DictionaryPopulatable>*)cell populateWithDictionary:[category dictionify]];
        }
        else
        {
            cell.textLabel.text = [category name];
        }
        
    }
    
    // Configure the cell...
    return cell;
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == [self.entities count])
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    [self.tableView beginUpdates];
    NSArray* paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.entities.count inSection:0]];
    if(editing)
    {
        [[self tableView] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
    }
    else
    {
        [[self tableView] deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
    }
    [self.tableView endUpdates];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSManagedObject* entityForDelete = [self.entities objectAtIndex:indexPath.row];
        [DatabaseManager delete:entityForDelete];
        
        [self.entities removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [DatabaseManager save];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) 
    {
        CategoryAdderViewController* modalController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:CategoryAdderView];
        modalController.delegate = self;
        [self presentModalViewController:modalController animated:YES];
    }   
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [(SportPickerViewController*)segue.destinationViewController setDelegate:[self.tggNavigationController placeBetWizard]]; 
}

#pragma mark - Table view delegate

@end
