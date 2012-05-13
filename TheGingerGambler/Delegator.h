//
//  Delegator.h
//  TheGingerGambler
//
//  Created by john bower on 12/05/2012.
//  Copyright (c) 2012 John Bower. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Delegator <NSObject>

@property (weak, nonatomic) id delegate;

@end
