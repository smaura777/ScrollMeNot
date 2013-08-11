//
//  CTLViewOne.m
//  ControlTouchLab
//
//  Created by Maura, Sam on 8/5/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "CTLViewOne.h"

#define kDefaultText @"No Text"
#define kDefaultTextLength 7


@implementation CTLViewOne

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andString:(NSString *)str {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _viewText = str;
    }
    return self;
}


-(void)drawOne:(CGContextRef)ref  {
    CGContextRef myContext = ref;
   
    CGContextSaveGState(myContext);
    UIBezierPath *bezierPath = [UIBezierPath
                                bezierPathWithRoundedRect:CGRectMake(self.bounds.origin.x + self.bounds.size.width/8,
                                                                     self.bounds.size.height/10,
                                                                     self.bounds.size.width - self.bounds.size.width/4,
                                                                     self.bounds.size.height/1.8)
                                                        cornerRadius:20.0];
    
    CGContextSetFillColorWithColor(myContext, [UIColor orangeColor].CGColor);
    CGContextSetShadow(myContext, CGSizeMake(-8, 18), 15);
    [bezierPath fill];
    CGContextRestoreGState(myContext);
   /*
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(38, 270, 80, 80)  cornerRadius:20.0];
    CGContextSetFillColorWithColor(myContext, [UIColor orangeColor].CGColor);
    [bezierPath2 fill];
   */
}

-(void)drawText:(CGContextRef)ref  {
    CGContextRef myContext = ref;
     CGContextSaveGState(myContext);
    CGContextSetFillColorWithColor(myContext, [UIColor whiteColor].CGColor);
    CGContextSelectFont (myContext,
                         "Helvetica-Bold",
                         48,
                         kCGEncodingMacRoman);
    CGContextSetCharacterSpacing (myContext, 1);
    CGContextSetTextDrawingMode (myContext, kCGTextFill);
    CGContextSetTextMatrix(myContext, CGAffineTransformMakeScale(1.0, -1.0));
    if (![_viewText length])
       CGContextShowTextAtPoint(myContext,self.bounds.origin.x + self.bounds.size.width/6,self.bounds.size.height/2.5,[kDefaultText UTF8String],kDefaultTextLength);
    else
        CGContextShowTextAtPoint(myContext,self.bounds.origin.x + self.bounds.size.width/6,self.bounds.size.height/2.5,[_viewText UTF8String],[_viewText length]);
    
     CGContextRestoreGState(myContext);

}

-(void)drawTwo:(CGContextRef)ref  {
     CGContextRef myContext = ref;
     CGContextSetRGBFillColor(myContext, 1, .4, 0.3, 1);
     CGContextFillRect(myContext, self.bounds);
    
     CGContextSetFillColorWithColor(myContext, [UIColor whiteColor].CGColor);
     UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(138, 300, 40, 40) cornerRadius:20.0];
     [bezierPath fill];
    
    CGContextSetFillColorWithColor(myContext, [UIColor whiteColor].CGColor);
    
    
    
}

-(void)drawThree:(CGContextRef)ref {
    CGContextRef myContext = ref;
    CGContextSetFillColorWithColor(myContext, [UIColor whiteColor].CGColor);
    CGContextSelectFont (myContext, 
                         "Helvetica",
                         60,
                         kCGEncodingMacRoman);

    CGContextSetCharacterSpacing (myContext, 2);
   CGContextSetTextDrawingMode (myContext, kCGTextFill);
   CGContextSetTextMatrix(myContext, CGAffineTransformMakeScale(1.0, -1.0)); 
   CGContextShowTextAtPoint (myContext, 85, 195, "JOE", 3);
    CGContextSelectFont (myContext,
                         "Helvetica",
                         16,
                         kCGEncodingMacRoman);
   CGContextShowTextAtPoint (myContext, 220, 180, "FRESH", 5);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
     [super drawRect:rect];
     CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    [self drawOne:myContext];
    [self drawText:myContext];
    
    //  [self drawTwo:myContext];
    //[self drawThree:myContext];
    
}




#pragma mark - touches

/**

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
 
**/

@end
