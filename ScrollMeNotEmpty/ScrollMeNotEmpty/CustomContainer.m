//
//  CustomContainer.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "CustomContainer.h"
#import "AntChildVC.h"
#import "BeeChildVC.h"



@interface CustomContainer ()
-(void)displayAntController:(UIViewController *)content;
-(void)displayBeeController;

@end

@implementation CustomContainer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
    _acvc = [[AntChildVC alloc] init];
    _acvc.parentFrame = self.view.bounds;
    _acvc.parentLink = self;
    
    
  self.antNav = [[UINavigationController alloc] initWithRootViewController:_acvc];
    
   
    
    NSLog(@"VIEW BOUNDS : X : %f Y: %f  width: %f height %f ", self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
    NSLog(@"VIEW FRAME : X : %f Y: %f  width: %f height %f ", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
    [self displayAntController:self.antNav];
    
    self.currentClientView =   _acvc.view;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)displayAntController:(UIViewController *)content {
    //[content.view setFrame:self.view.bounds];
    
    
    
    NSLog(@"VIEW BOUNDS : X : %f Y: %f  width: %f height %f ", content.view.bounds.origin.x, content.view.bounds.origin.y, content.view.bounds.size.width, content.view.bounds.size.height);
    NSLog(@"VIEW FRAME : X : %f Y: %f  width: %f height %f ", content.view.frame.origin.x, content.view.frame.origin.y, content.view.frame.size.width, content.view.frame.size.height);

    [self addChildViewController:content];
    
   [self.view addSubview: content.view ];
    [content didMoveToParentViewController:self];
    
   
}

-(void)displayBeeController {

}

-(void)showMainVC {
    NSLog(@"PARENT VC ");
    CGRect newFrame = CGRectMake(300, self.antNav.view.frame.origin.y, self.antNav.view.frame.size.width, self.antNav.view.frame.size.height);
    
    
    
    [self.antNav.view setFrame:newFrame];

}



@end
