//
//  CustomContainer.h
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  AntChildVC;
@class BeeChildVC;

@interface CustomContainer : UIViewController
@property (strong,nonatomic) AntChildVC *acvc;
@property (strong,nonatomic) BeeChildVC *bcvc;
@property (strong,nonatomic) UINavigationController *antNav;

@property (strong , nonatomic) UIView *currentClientView;

-(void)showMainVC;


@end
