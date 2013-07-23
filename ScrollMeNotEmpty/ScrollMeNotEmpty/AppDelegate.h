//
//  AppDelegate.h
//  ScrollMeNotEmpty
//
//  Created by Maura, Sam on 7/19/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainVC;
@class CustomContainer;



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) MainVC *mainVC;
@property (strong,nonatomic) CustomContainer *cc;



@end
