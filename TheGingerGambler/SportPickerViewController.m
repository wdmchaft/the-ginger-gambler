//
//  SportPickerViewController.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "SportPickerViewController.h"
#import "DatabaseManager.h"
#import "Sport.h"

@implementation SportPickerViewController

- (void) add:(NSString *)name
{
    Sport* sport = [[Sport alloc] initWithEntity:[DatabaseManager entityDescriptionFor:SportEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
    [sport setName:name];
    [self.entities addObject:sport];
    [DatabaseManager save];
    [self setEditing:YES];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoadWithEntity:SportEntityName];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate selectBookie:[self.entities objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES]; 
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
