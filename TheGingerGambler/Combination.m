//
//  Combination.m
//  TheGingerGambler
//
//  Created by john bower on 11/05/2012.
//  Copyright (c) 2012 John Bower. All rights reserved.
//
// http://msdn.microsoft.com/es-mx/magazine/cc163957(en-us).aspx#S2

#import "Combination.h"

@interface Combination() 

@property NSInteger numberOfItems;
@property NSInteger subsetSize;

@end

@implementation Combination

@synthesize numberOfItems;
@synthesize subsetSize;
@synthesize currentCombination;

- (Combination*) initWithNumberOfItems:(NSInteger)number andSubsetSize:(NSInteger)size
{
    NSMutableArray* combination = [NSMutableArray array];
    for (NSInteger i = 0; i < number; ++i)
    {
        [combination addObject:[NSNumber numberWithInt:i]];
    }
    return [self initWithNumberOfItems:number andSubsetSize:size andCurrentCombination:combination];
}

- (id) initWithNumberOfItems:(NSInteger)number andSubsetSize:(NSInteger)size andCurrentCombination:(NSMutableArray*)combination
{
    if (self = [super init])
    {
        self.numberOfItems = number;
        self.subsetSize = size;
        self.currentCombination = [[NSMutableArray alloc] initWithArray:combination copyItems:YES];
    }
    return self;
}

- (Combination*) successor
{
    // Check if there is a proceeding combination or if we are at the end 
    if(self.currentCombination.count == 0 || ([self atomValueAtIndex:0] == (self.numberOfItems - self.subsetSize)))
    {
        return nil;
    }
    
    // create combination we will use to generate successor
    Combination* newCombination = [ [Combination alloc] initWithNumberOfItems:numberOfItems andSubsetSize:subsetSize andCurrentCombination:self.currentCombination];
    
    NSInteger combinationPosition;
    for (combinationPosition = self.subsetSize - 1; combinationPosition > 0 && [newCombination atomValueAtIndex:combinationPosition] == (self.numberOfItems - self.subsetSize + combinationPosition); --combinationPosition);
    
    [newCombination replaceAtomValueAtIndex:combinationPosition with:[newCombination atomValueAtIndex:++combinationPosition]];
    
    for (NSInteger j = combinationPosition; j < self.subsetSize - 1; ++j)
    {
        [newCombination replaceAtomValueAtIndex:j+1 with:[newCombination atomValueAtIndex:j]+1];
    }
    return newCombination;
}

- (NSInteger) atomValueAtIndex:(NSInteger)index
{
    return [(NSNumber*)[self.currentCombination objectAtIndex:index] intValue]; 
}

- (void) replaceAtomValueAtIndex:(NSInteger)index with:(NSInteger)number
{
    [self.currentCombination replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:number]];
}
     
-(NSInteger) choose
{
    if (numberOfItems < subsetSize)
    {
        return 0;
    }
    else if (numberOfItems == subsetSize) 
    {
        return 1;
    }
    
    NSInteger delta = 0;
    NSInteger iMax = 0;
 
    // this is because Choose(10, 2) is same as Choose(10, 8) but the latter is slower
    if(subsetSize < (numberOfItems - subsetSize))
    {
        delta = numberOfItems - subsetSize;
        iMax = subsetSize;
    }
    else 
    {
        delta = subsetSize;
        iMax = numberOfItems - subsetSize;
    }
    
    NSInteger numberOfCombinations = delta + 1;
    
    for(NSInteger i = 2; i <= iMax; ++i)
    {
        // calculating partial products so we don't have huge numbers flying around
        numberOfCombinations = (numberOfCombinations * (delta * i))/i; 
    }
    return numberOfCombinations;
} 

@end
