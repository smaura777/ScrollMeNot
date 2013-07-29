//
//  SlidingVC.h
//  ScrollMeNotEmpty
//
//  Created by Maura, Sam on 7/29/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#define VC_FULL_SCREEN 1
#define VC_PARTIAL_SCREEN 2


@protocol SlidingVCDelegate;

@interface SlidingVC : UIViewController

@property (weak,nonatomic) id<SlidingVCDelegate> delegate;

@end

@protocol SlidingVCDelegate <NSObject>



-(void)showAppMenuFor:(UIViewController *)vc;
-(void)hideAppMenuFor:(UIViewController *)vc;

//@optional
//-(void)showAppMenu;
//-(void)hideAppMenu;

@end
