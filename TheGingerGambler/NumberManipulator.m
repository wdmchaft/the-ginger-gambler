//
//  NumberManipulator.m
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 4/4/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import "NumberManipulator.h"

@implementation NumberManipulator

+ (NSString *)formattedStringWithDecimal:(NSDecimalNumber *)decimalNumber
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:2]; //two deimal spaces
    [formatter setRoundingMode: NSNumberFormatterRoundHalfUp]; //round up
    
    
    NSString *result =[NSString stringWithString:[formatter stringFromNumber:decimalNumber]];
    return result;
}


@end
