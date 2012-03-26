    //
//  BookiePickerViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/20/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "BookiePickerViewController.h"
#import "AppDelegate.h"
#import "DatabaseManager.h"
#import "BookieAdderViewController.h";
#import "Bookie.h"


@implementation BookiePickerViewController

@synthesize bookies = _bookies;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Preserves selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // displays an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.bookies = [DatabaseManager entitiesFor:BOOKIE_ENTITY_NAME];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.bookies = nil;
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
    return self.editing ? self.bookies.count + 1 : self.bookies.count;
     
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString* cellIdentifier = BOOKIE_CELL_NAME;
    
    BOOL addCell = (indexPath.row == self.bookies.count);
    
    if(addCell)
    {
        cellIdentifier = @"AddCell";
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
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
        Bookie* bookie = [self.bookies objectAtIndex:indexPath.row];
        cell.textLabel.text = [bookie name];
    }
    
    /*
    if(self.editing)
    {
        if(indexPath.row == 0)
        {
            cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
            cell.text = @"insert";
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:BOOKIE_CELL_NAME];
            Bookie* bookie = [self.bookies objectAtIndex:indexPath.row - 1];
            cell.textLabel.text = [bookie name];
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:BOOKIE_CELL_NAME];
        Bookie* bookie = [self.bookies objectAtIndex:indexPath.row];
        cell.textLabel.text = [bookie name];
    }
     */
    // Configure the cell...
    return cell;
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == [self.bookies count])
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
    NSArray* paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.bookies.count inSection:0]];
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
        NSManagedObject* bookieForDelete = [self.bookies objectAtIndex:indexPath.row];
        [DatabaseManager delete:bookieForDelete];
        
        [self.bookies removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [DatabaseManager save];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) 
    {
        UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:[BookieAdderViewController new]];
        [self presentModalViewController:navigationController animated:YES];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
