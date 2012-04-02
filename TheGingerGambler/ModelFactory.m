//
//  ModelFactory.m
//  TheGingerGambler
//

#import "ModelFactory.h"
#import "Bet.h"
#import "DatabaseManager.h"

@implementation ModelFactory

+ (Bet*) createBet
{
    return [[Bet alloc] initWithEntity:[DatabaseManager entityDescriptionFor:BetEntityName] insertIntoManagedObjectContext:[DatabaseManager context]];
}

@end
