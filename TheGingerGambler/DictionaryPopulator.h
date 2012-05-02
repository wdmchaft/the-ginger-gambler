//
//  DictionaryPopulator.h
//  TheGingerGambler
//
//  Created by John Bower on 01/05/2012.
//  Copyright (c) 2012 John Bower. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DictionaryPopulator <NSObject>

- (void) populateWithDictionary:(NSDictionary*)dictionary;   

@end
