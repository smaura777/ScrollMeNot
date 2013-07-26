//
//  BeeChildVC.h
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomContainer.h"


@interface BeeChildVC : UIViewController

@property (assign) CGRect parentFrame;
@property (weak,nonatomic) CustomContainer *parentLink;


-(void)showParentVC;





@end
