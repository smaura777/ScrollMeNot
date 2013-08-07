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


-(void)setupView {
    self.layer.cornerRadius = 4.0 ;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //[_viewText drawInRect:CGRectMake(0, 0, 100, 100) withFont:[UIFont systemFontOfSize:7.0]];
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    /**
    CGContextSetRGBFillColor (myContext, 1, 0.2, 0, 1);// 3
    
    // CGContextSetShadow(myContext, CGSizeMake(4, 4), 0);
    CGContextFillRect (myContext, self.bounds);// 4
    
    
    // CGContextSaveGState(myContext);
     **/
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:20.0];
    //CGContextSetStrokeColorWithColor(myContext, [UIColor greenColor].CGColor);
    CGContextSetFillColorWithColor(myContext, [UIColor greenColor].CGColor);
    [bezierPath fill];
    
    
   }




#pragma mark - touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    // NSLog(@"%s ",__func__);
    _startLocation = [[touches anyObject] locationInView:self];
    
    //NSLog(@"location %@", NSStringFromCGPoint(_startLocation));
    //self.center = _startLocation;
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    //NSLog(@"%s ",__func__);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    // NSLog(@"%s ",__func__);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    CGPoint newLocation =  [[touches anyObject] locationInView:self];
    //CGPoint delta = CGPointMake(self.startLocation.x - newLocation.x, self.startLocation.y - newLocation.y);
    
    float dx = newLocation.x - _startLocation.x;
    float dy = newLocation.y - _startLocation.y;
    
    
    self.center = CGPointMake(self.center.x + dx , self.center.y + dy);
    
    
    //NSLog(@"%s ",__func__);
}


@end
