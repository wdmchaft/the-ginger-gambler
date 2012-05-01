//
//  ModelFactory.m
//  TheGingerGambler
//

#import "ModelFactory.h"
#import "Bet.h"
#import "Selection.h"
#import "DatabaseManager.h"

@implementation ModelFactory

+ (Bet*) createBet
{
    return [[Bet alloc] initWithEntity:[DatabaseManager entityDescriptionFor:BetEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
}

+ (Selection*) createSelection
{
    return [[Selection alloc] initWithEntity:[DatabaseManager entityDescriptionFor:SelectionEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
}

@end
