//
//  DatabaseManager.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "DatabaseManager.h"

#import "AppDelegate.h"

@implementation DatabaseManager

+ (NSArray*)entitiesFor:(NSString*)name 
{
    NSManagedObjectContext* context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray* fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if(![context save:&error]){
        NSLog(@"Whoops, couldn´t save: %@", [error localizedDescription]);
    }
    return fetchedObjects;
}


@end
