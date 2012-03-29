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
    Sport* sport = [[Sport alloc] initWithEntity:[DatabaseManager entityDescriptionFor:SPORT_ENTITY_NAME] insertIntoManagedObjectContext:[DatabaseManager context]];
    [sport setName:name];
    [self.entities addObject:sport];
    [DatabaseManager save];
    [self setEditing:YES];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoadWithEntity:SPORT_ENTITY_NAME];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return [super tableView:tableView cellForRowAtIndexPath:indexPath entityCell:SPORT_ENTITY_NAME];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate selectSport:[self.entities objectAtIndex:indexPath.row]];
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath withEntityName:SPORT_ENTITY_NAME];
}

@end
