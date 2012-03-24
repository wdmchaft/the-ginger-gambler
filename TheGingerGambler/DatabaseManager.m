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

+ (NSMutableArray*)entitiesFor:(NSString*)name 
{
    NSManagedObjectContext* context = [DatabaseManager context];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray* fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    [self save];
    return [fetchedObjects mutableCopy];
}

+ (void) save
{
    NSError *error;
    if(![[DatabaseManager context] save:&error]){
        NSLog(@"Whoops, couldn´t save: %@", [error localizedDescription]);
    }    
}

+ (void) delete:(NSManagedObject *)object
{
    [[self context] deleteObject:object];
}

+ (NSManagedObjectContext*) context
{
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];    
}


@end
