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
#import "TGGNavigationController.h"
#import "PlaceBetViewController.h"
#import "Bet.h"
#import "ModelFactory.h"
#import "Sport.h"
#import "Bookie.h"
#import "Selection.h"

@interface PlaceBetWizardManager()

@property (strong, nonatomic) Bet* bet;
@property (strong, nonatomic) Selection* selection;
@property (weak, nonatomic) TGGNavigationController* navigationController;
@property (weak, nonatomic) UIViewController* initiatingView;

- (void) nextViewController;

@end

@implementation PlaceBetWizardManager

@synthesize bet;
@synthesize isInProgress;
@synthesize navigationController;
@synthesize initiatingView;
@synthesize selection;

- (id) initWithNavigationController:(TGGNavigationController*)controller
{
    if (self = [super init])
    {
        self.bet = [ModelFactory createBet];
        self.isInProgress = YES;
        self.navigationController = controller;
        self.initiatingView = controller.visibleViewController;
    }
    return self;
}

- (void)start
{
    self.isInProgress = YES;
    UIViewController<Delegator>* controller = [[UIStoryboard storyboardWithName:StoryboardName bundle:NULL] instantiateViewControllerWithIdentifier:BookiePickerView];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
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
    NSString* viewName = [self.navigationController proceedingWizardViewController];
    DLog(@"Next View : %@", viewName);
    UIViewController<Delegator>* controller = [[UIStoryboard storyboardWithName:StoryboardName bundle:NULL] instantiateViewControllerWithIdentifier:viewName];
    if (viewName == PlaceBetView)
    {
        self.isInProgress = NO; 
        [(PlaceBetViewController*)controller setUpWithBet:bet];
        [self.navigationController popToViewController:initiatingView animated:NO];
    }
    else 
    {
        if(viewName == SelectionsView)
        {
            [(SelectionsViewController*)controller setUpWithSelection:self.selection];
        }
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
             
- (void) submitSelection:(Selection*)newSelection
{
    DLog(@"Selection set : %@", newSelection.name);
    self.selection = newSelection;
}

- (void) submitStakes:(NSMutableArray*)stake
{
    DLog(@"%i Set stakes", stake.count);
    bet.unitbets = [NSSet setWithArray:stake];
}

- (NSString*) bookieAndSport
{
    if(self.bet)
    {
        return [NSString stringWithFormat:@"%@ - %@", [self.bet.bookie.name substringToIndex:4], [self.bet.sport.name substringToIndex:4]];
    }
    return nil;
}

@end
