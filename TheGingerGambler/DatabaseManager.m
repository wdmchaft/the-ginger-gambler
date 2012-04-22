//
//  DatabaseManager.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "DatabaseManager.h"

#import "AppDelegate.h"

@interface DatabaseManager()

@end

@implementation DatabaseManager

+ (NSMutableArray*)entitiesFor:(NSString*)name 
{
    NSFetchRequest* fetchRequest = [DatabaseManager fetchReqestForEntitiesWith:name];
    return [DatabaseManager executeFetchRequest:fetchRequest];
}

+ (NSMutableArray*)entitiesWith:(NSString*)name withPredicate:(NSPredicate*)predicate
{
    NSFetchRequest* fetchRequest = [DatabaseManager fetchReqestForEntitiesWith:name];
    [fetchRequest setPredicate:predicate];
    return [DatabaseManager executeFetchRequest:fetchRequest];
}

+ (NSMutableArray*) executeFetchRequest:(NSFetchRequest*)fetchRequest
{
    NSError* error;
    NSArray* fetchedObjects = [[DatabaseManager context] executeFetchRequest:fetchRequest error:&error];
    if(error){
        NSLog(@"Whoops, couldn´t fetch: %@", [error localizedDescription]);
    } 
    return [fetchedObjects mutableCopy];
}

+ (NSFetchRequest*) fetchReqestForEntitiesWith:(NSString*)name
{
    NSManagedObjectContext* context = [DatabaseManager context];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    return fetchRequest;
}

+ (void) save
{
    NSError *error;
    if(![[DatabaseManager context] save:&error]){
        NSLog(@"Whoops, couldn´t save: %@", [error localizedDescription]);
    }    
}

+ (NSEntityDescription*) entityDescriptionFor:(NSString*)name
{
    return [NSEntityDescription entityForName:name inManagedObjectContext:[DatabaseManager context]];
}

+ (void) delete:(NSManagedObject *)object
{
    [[self context] deleteObject:object];
}

+ (NSManagedObjectContext*) context
{
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];    
}

+ (NSMutableArray*)entitiesWith:(NSString*)name withPredicate:(NSPredicate*)predicate andExpression:(NSExpressionDescription*)expressionDescription
{
    NSFetchRequest* fetchRequest = [DatabaseManager fetchReqestForEntitiesWith:name];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setResultType:NSDictionaryResultType];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObject:expressionDescription]];
    return [DatabaseManager executeFetchRequest:fetchRequest];
}

+ (void) setup {
        
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *storePath = [[[appDelegate applicationDocumentsDirectory] URLByAppendingPathComponent:@"TheGingerGambler.sqlite"] path];
    /*
        Set up the store.
        For the sake of illustration, provide a pre-populated default store.
    */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // If the expected store doesn't exist, copy the default store.
    if (![fileManager fileExistsAtPath:storePath]) 
    {
        NSString* defaultStorePath = [[NSBundle mainBundle] pathForResource:@"TheGingerGambler" ofType:@"sqlite"];
        if (defaultStorePath) 
        {
            [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
            ALog("Using default database at : %@" , defaultStorePath);
        }
        else
        {
            ALog("Database doesn't exist and no default database exists at : %@" , defaultStorePath);
        }
    }
        
    NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
        
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber   numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil]; 
    NSPersistentStoreCoordinator*  persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[appDelegate managedObjectModel]];
        
    NSError *error;
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }    
}

+ (void) populate
{
    
}

@end
