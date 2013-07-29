//
//  CustomContainer.h
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlidingVC.h"

    //#import "AntChildVC.h"
    //#import "BeeChildVC.h"
@class AntChildVC;
@class BeeChildVC;



@interface CustomContainer : UIViewController <UITableViewDelegate,
UITableViewDataSource, SlidingVCDelegate>
@property (strong,nonatomic) NSArray *menuList;
@property (strong,nonatomic) AntChildVC *acvc;
@property (strong,nonatomic) BeeChildVC *bcvc;

@property (strong,nonatomic) UINavigationController *antNav;
@property (strong,nonatomic) UIViewController *topVC;

@property (strong , nonatomic) UIView *currentClientView;

    //-(void)showMenuFrom:(UIViewController *)childVC;


@end
