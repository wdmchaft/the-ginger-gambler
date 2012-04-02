//
//  Bet.m
//  TheGingerGambler
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
@dynamic status;

- (NSString*) name
{
    NSString* possibleName = [self primitiveValueForKey:@"name"];
    if (possibleName == nil) {
        return [NSString stringWithFormat:@"%@ - %@ - %@ - %@", [[self bookie] name], [[self sport] name], [self odds], [self amount]];
    }
    return possibleName;
}

- (Status)betStatus 
{
    return (Status)[[self status] intValue];
}

- (void)setBetStatus:(Status)betStatus 
{
    [self setStatus:[NSNumber numberWithInt:betStatus]];
}

+ (NSSet*)keyPathsForValuesAffectingBetStatus   {
    return [NSSet setWithObject:@"status"];
}

@end
