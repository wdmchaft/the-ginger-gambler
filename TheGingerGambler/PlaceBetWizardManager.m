//
//  PlaceBetWizardManager.m
//  TheGingerGambler
//
//  Created by john bower on 12/05/2012.
//  Copyright (c) John Bower. All rights reserved.
//

#import "PlaceBetWizardManager.h"
#import "BookiePickerViewController.h"
#import "SportPickerViewController.h"
#import "SelectionsViewController.h"
#import "StakeViewController.h"
#import "PlaceBetViewController.h"
#import "Bet.h"
#import "ModelFactory.h"
#import "Sport.h"
#import "Bookie.h"

@interface PlaceBetWizardManager()

@property (strong, nonatomic) Bet* bet;
@property (strong, nonatomic) NSMutableArray* viewSequence;
@property (weak, nonatomic) UINavigationController* navigationController;

- (void) nextViewController;

@end

@implementation PlaceBetWizardManager

@synthesize bet;
@synthesize isInProgress;
@synthesize navigationController;
@synthesize viewSequence;

- (id) initWithNavigationController:(UINavigationController*)controller
{
    if (self = [super init])
    {
        self.bet = [ModelFactory createBet];
        self.isInProgress = YES;
        self.navigationController = controller;
        self.viewSequence = [NSMutableArray arrayWithObjects:BookiePickerView, SportPickerView, SelectionsView, StakeView, PlaceBetView, nil];
    }
    return self;
}

- (void)start
{
    self.isInProgress = YES;
    [self nextViewController];
}

- (void)next
{
    [self nextViewController];
    
}

- (NSInteger)selectionCount
{
    return [self.bet.selections count];
}

- (void) nextViewController
{
    DLog(@"Views count : %i", self.viewSequence.count);
    UIViewController<Delegator>* controller = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:[self.viewSequence objectAtIndex:0]];
    [self.viewSequence removeObjectAtIndex:0];
    if (self.viewSequence.count == 0)
    {
        [(PlaceBetViewController*)controller setUpWithBet:bet];
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController popViewControllerAnimated:NO];
    }
    else 
    {
        controller.delegate = self;
    }
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) selectSport:(Sport*)sport
{
    DLog(@"Selected sport category with name %@", [sport name]);
    [bet setSport:sport];
}

- (void) selectBookie:(Bookie*)bookie
{
    DLog(@"Selected bookie category with name %@", [bookie name]);
    [bet setBookie:bookie];
}

- (void) submitSelections:(NSMutableArray*)selections
{
    DLog(@"%i Selections set", selections.count);
    bet.selections = [NSSet setWithArray:selections];
}

- (void) submitStakes:(NSMutableArray*)stake
{
    DLog(@"%i Set stakes", stake.count);
    bet.unitbets = [NSSet setWithArray:stake];
}


@end
