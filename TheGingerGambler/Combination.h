//
//  Combination.h
//  TheGingerGambler
//
//  Created by john bower on 11/05/2012.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Combination : NSObject

@property (strong, nonatomic) NSMutableArray* currentCombination;

- (id) initWithNumberOfItems:(NSInteger)numberOfItems andSubsetSize:(NSInteger)subsetSize;
- (id) initWithNumberOfItems:(NSInteger)numberOfItems andSubsetSize:(NSInteger)subsetSize andCurrentCombination:(NSMutableArray*)currentCombinations;

- (NSInteger) choose;
- (Combination*) successor;

- (NSInteger) atomValueAtIndex:(NSInteger)index;
- (void) replaceAtomValueAtIndex:(NSInteger)index with:(NSInteger)number;

@end
