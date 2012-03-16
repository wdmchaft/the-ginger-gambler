//
//  Bookie.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/16/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bet;

@interface Bookie : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *bet;
@end

@interface Bookie (CoreDataGeneratedAccessors)

- (void)addBetObject:(Bet *)value;
- (void)removeBetObject:(Bet *)value;
- (void)addBet:(NSSet *)values;
- (void)removeBet:(NSSet *)values;

@end
