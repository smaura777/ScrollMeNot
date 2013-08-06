//
//  CTLViewOne.m
//  ControlTouchLab
//
//  Created by Maura, Sam on 8/5/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "CTLViewOne.h"

@implementation CTLViewOne

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _viewText = @"A";
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //[_viewText drawInRect:CGRectMake(0, 0, 100, 100) withFont:[UIFont systemFontOfSize:7.0]];
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);// 3
    CGContextSetShadow(myContext, CGSizeMake(4, 4), 0);
    CGContextFillRect (myContext, CGRectMake (0, 20, 100, 50 ));// 4
    
    CGContextSaveGState(myContext);
    
    myContext = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor (myContext, 0, 0, 1, .5);// 5
    CGContextFillRect (myContext, CGRectMake (0, 110, 100, 50));
}


@end
