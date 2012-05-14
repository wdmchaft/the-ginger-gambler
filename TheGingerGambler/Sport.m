//
//  Sport.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/16/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "Sport.h"
#import "Bet.h"


@implementation Sport

@dynamic name;
@dynamic bet;

- (NSDictionary*)dictionify
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithObject:self.name forKey:DescriptionKey];
    return dictionary;
}

@end
