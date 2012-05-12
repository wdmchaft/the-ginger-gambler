//
//  Bet.m
//  TheGingerGambler
//

#import "Bet.h"
#import "Bookie.h"
#import "Sport.h"
#import "NumberManipulator.h"
#import "Selection.h"
#import "UnitBet.h"
#import "Combination.h"

@interface Bet()

- (NSMutableArray*) winningSelections;
- (NSDecimalNumber*) payoutWithBetType:(NSInteger)betType forStake:(NSDecimalNumber*)stake fromWinningSelections:(NSArray*)selections;
- (NSDecimalNumber*) payoutFromOddsAtPositions:(NSMutableArray*)oddsPositions inWinningSelections:(NSArray*)selections withStake:(NSDecimalNumber*)stake; 

@end

@implementation Bet

@dynamic selections;
@dynamic name;
@dynamic bookie;
@dynamic sport;
@dynamic status;
@dynamic unitbets;

- (NSString*) name
{
    NSString* possibleName = [self primitiveValueForKey:@"name"];
    if (possibleName == nil) {
        return [NSString stringWithFormat:@"%@ - %@ - %@", [[self bookie] name], [[self sport] name]];
    }
    return possibleName;
}

- (NSDecimalNumber*) profit
{
    NSDecimalNumber* total = [NSDecimalNumber zero];
    
    if(self.status == [NSNumber numberWithInt:kWonState] || self.status == [NSNumber numberWithInt:kLossedState])
    {
        NSMutableArray* winningSelections = [self winningSelections];
        for(UnitBet* unitbet in self.unitbets)
        {
            if(winningSelections.count >= [unitbet.unitbet intValue])
            {
                total = [total decimalNumberByAdding:[self payoutWithBetType:[unitbet.unitbet intValue] forStake:unitbet.stake fromWinningSelections:winningSelections]];
            }
            Combination* combination = [[Combination alloc] initWithNumberOfItems:self.selections.count andSubsetSize:[unitbet.unitbet intValue]];
            NSDecimalNumber* possibleCombinationsCount = [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithInt:[combination choose]] decimalValue]];
            total = [total decimalNumberBySubtracting:[unitbet.stake decimalNumberByMultiplyingBy:possibleCombinationsCount]];
        }
    }
    return total;
}

- (void) updateStatus
{
    // set it to won, then if it doesn't hit any of the following conditions then it
    // doesn't need setting
    self.status = [NSNumber numberWithInt:kWonState];

    for(Selection* selection in self.selections)
    {
        NSInteger status = [selection.status intValue]; 
        if(status == kLossedState)
        {
            self.status = [NSNumber numberWithInt:kLossedState];
            break;
        }
        else if(status == kPlacedState)
        {
            self.status = [NSNumber numberWithInt:kPlacedState];
            break;
        }
        else if(status == kDraftState)
        {
            self.status = [NSNumber numberWithInt:kDraftState];
            break;
        }
    }
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

+ (NSSet*)keyPathsForValuesAffectingBetStatus   
{
    return [NSSet setWithObject:@"status"];
}

#pragma mark - Private methods

- (NSArray*) winningSelections
{
    NSMutableArray* selectionsWon = [NSMutableArray array];
    for (Selection* selection in self.selections) {
        if([selection.status intValue] == kWonState)
        {
            [selectionsWon addObject:selection];
        }
    }
    return selectionsWon;
}

- (NSDecimalNumber*) payoutWithBetType:(NSInteger)betType forStake:(NSDecimalNumber*)stake fromWinningSelections:(NSArray*)selections
{
    NSDecimalNumber* payout = [NSDecimalNumber zero]; 
    Combination* combination = [[Combination alloc] initWithNumberOfItems:selections.count andSubsetSize:betType];
    do 
    {
        payout = [payout decimalNumberByAdding:[self payoutFromOddsAtPositions:combination.currentCombination inWinningSelections:selections withStake:stake]];
    } 
    while ((combination = combination.successor) != nil);
    return payout;
}

- (NSDecimalNumber*) payoutFromOddsAtPositions:(NSMutableArray*)oddsPositions inWinningSelections:(NSArray*)selections withStake:(NSDecimalNumber*)stake 
{
    NSDecimalNumber* odds = [NSDecimalNumber one];
    for (NSNumber* oddPosition in oddsPositions) 
    {
        NSDecimalNumber* odd = [(Selection*)[selections objectAtIndex:[oddPosition intValue]] odds];
        odds = [odds decimalNumberByMultiplyingBy:odd];
    }
    return [stake decimalNumberByMultiplyingBy:odds];
}


@end
