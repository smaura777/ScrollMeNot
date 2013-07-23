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
    self.curremtClientView =   _acvc.view;
    
    [self displayAntController:_acvc];
    
    
    //_bcvc = [[BeeChildVC alloc]  init];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)displayAntController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview: self.curremtClientView];
    
    [content didMoveToParentViewController:self];
}

-(void)displayBeeController {

}



@end
