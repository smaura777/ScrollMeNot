//
//  CTLViewOne.h
//  ControlTouchLab
//
//  Created by Maura, Sam on 8/5/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTLViewOne : UIView
@property (nonatomic,copy) NSString *viewText;
@property (nonatomic,assign) CGPoint startLocation;


- (id)initWithFrame:(CGRect)frame andString:(NSString *)str;

@end
