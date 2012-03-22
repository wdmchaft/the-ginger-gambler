//
//  Bet.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/22/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "Bet.h"
#import "Bookie.h"
#import "Sport.h"

@implementation Bet

@dynamic amount;
@dynamic odds;
@dynamic name;
@dynamic bookie;
@dynamic sport;

- (NSString*) name
{
    NSString* possibleName = [self primitiveValueForKey:@"name"];
    if (possibleName == nil) {
        return [NSString stringWithFormat:@"%@ - %@ - %@ - %@", [[self bookie] name], [[self sport] name], [self odds], [self amount]];
    }
    return possibleName;
}

@end
