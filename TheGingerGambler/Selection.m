//
//  Selection.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/23/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "Selection.h"
#import "Bookie.h"
#import "Sport.h"
#import "Bet.h"


@implementation Selection

@dynamic odds;
@dynamic bet;
@dynamic name;
@dynamic status;
@dynamic placeterms;
@dynamic multiple;
@dynamic sport;
@dynamic bookie;


- (NSDictionary*)dictionify
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithObject:self.name forKey:DescriptionKey];
    [dictionary setObject:self.odds forKey:OddsKey];
    [dictionary setObject:self.placeterms forKey:PlaceTermsKey];
    return dictionary;
}

#pragma mark - Status methods

- (Status)selectionStatus 
{
    return (Status)[[self status] intValue];
}

- (void)setSelectionStatus:(Status)selectionStatus 
{
    [self setStatus:[NSNumber numberWithInt:selectionStatus]];
}

+ (NSSet*)keyPathsForValuesAffectingSelectionStatus   
{
    return [NSSet setWithObject:@"status"];
}

@end
