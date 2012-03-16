//
//  PlaceBetViewController.h
//  TheGingerGambler
//
//  Created by Huawei R&D Mexico on 3/16/12.
//  Copyright (c) 2012 Huawei Technologies de Mexico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceBetViewController : UIViewController{
    NSArray* _sports;
    NSManagedObjectContext* _context;
}

@property (nonatomic, retain) NSArray* sports;
@property (nonatomic, retain) NSManagedObjectContext* context;

@end
