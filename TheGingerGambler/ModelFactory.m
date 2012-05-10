//
//  ModelFactory.m
//  TheGingerGambler
//

#import "ModelFactory.h"
#import "Bet.h"
#import "Selection.h"
#import "DatabaseManager.h"
#import "UnitBet.h"


@implementation ModelFactory

+ (Bet*) createBet
{
    return [[Bet alloc] initWithEntity:[DatabaseManager entityDescriptionFor:BetEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
}

+ (Selection*) createSelection
{
    return [[Selection alloc] initWithEntity:[DatabaseManager entityDescriptionFor:SelectionEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
}

+ (UnitBet*) createUnitBet
{
    return [[UnitBet alloc] initWithEntity:[DatabaseManager entityDescriptionFor:UnitBetEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
}

@end
