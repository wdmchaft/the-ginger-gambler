//
//  Multiple.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/23/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Selection;

@interface Multiple : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * stake;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSSet *selections;
@end

@interface Multiple (CoreDataGeneratedAccessors)

- (void)addSelectionsObject:(Selection *)value;
- (void)removeSelectionsObject:(Selection *)value;
- (void)addSelections:(NSSet *)values;
- (void)removeSelections:(NSSet *)values;

@end
