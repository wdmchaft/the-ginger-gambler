//
//  DatabaseManager.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/21/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//



@interface DatabaseManager : NSObject

+ (void)setup;
+ (NSMutableArray*)entitiesFor:(NSString*)name;
+ (NSMutableArray*)entitiesWith:(NSString*)name withPredicate:(NSPredicate*)predicate;
+ (id)entitiesWith:(NSString*)name withPredicate:(NSPredicate*)predicate andExpression:(NSExpressionDescription*)expressionDescription;
+ (NSManagedObjectContext*) context;
+ (void) save;
+ (void) delete: (NSManagedObject*) object;
+ (NSEntityDescription*) entityDescriptionFor:(NSString*)name;

@end
