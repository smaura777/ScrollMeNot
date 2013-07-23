//
//  BeeChildVC.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "BeeChildVC.h"

@interface BeeChildVC ()

@end

@implementation BeeChildVC

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
    
    
    UIImage *bgImage = [UIImage imageNamed:@"Bee.jpg"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    
    bgView.frame = appFrame;
    
    [self.view addSubview:bgView];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
