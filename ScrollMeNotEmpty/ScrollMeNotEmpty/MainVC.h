//
//  MainVC.h
//  ScrollMeNotEmpty
//
//  Created by Maura, Sam on 7/19/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController
@property (strong,nonatomic) UITapGestureRecognizer *tap;
@property (strong,nonatomic)  UIView *scrollViewContainer;
@property (strong,nonatomic) UIScrollView *scroller;

@end
