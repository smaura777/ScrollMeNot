//
//  AntChildVC.h
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomContainer.h"
#import "SlidingVC.h"



@interface AntChildVC : SlidingVC

@property (strong,nonatomic)  UIBarButtonItem *ham;
@property (assign) CGRect parentFrame;
    //@property (weak,nonatomic) CustomContainer *parentLink;


-(void)showParentVC;


@end


