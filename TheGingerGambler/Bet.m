//
//  Bet.m
//  TheGingerGambler
//

#import "Bet.h"
#import "Bookie.h"
#import "Sport.h"
#import "NumberManipulator.h"
#import "Selection.h"

@implementation Bet

@dynamic amount;
@dynamic selections;
@dynamic name;
@dynamic bookie;
@dynamic sport;
@dynamic status;

- (NSString*) name
{
    NSString* possibleName = [self primitiveValueForKey:@"name"];
    if (possibleName == nil) {
        return [NSString stringWithFormat:@"%@ - %@ - %@", [[self bookie] name], [[self sport] name], [NumberManipulator formattedStringWithDecimal:self.amount]];
    }
    return possibleName;
}

- (NSDecimalNumber*) profit
{
    NSDecimalNumber* total = [NSDecimalNumber zero];
    if(self.status == [NSNumber numberWithInt:kWonState])
    {
        for(Selection* selection in self.selections)
        {
            total = [total decimalNumberByAdding:[[self.amount decimalNumberByMultiplyingBy:selection.odds] decimalNumberBySubtracting:self.amount]]; 
        }
    }
    else if(self.status == [NSNumber numberWithInt:kLossedState])
    {
        total = [total decimalNumberBySubtracting:self.amount];
    }
    return total;
}

#pragma mark - Status methods

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
