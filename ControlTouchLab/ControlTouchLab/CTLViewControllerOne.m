//
//  CTLViewControllerOne.m
//  ControlTouchLab
//
//  Created by Maura, Sam on 8/5/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "CTLViewControllerOne.h"
#import "CTLViewOne.h"

@interface CTLViewControllerOne ()
@property (nonatomic,strong) CTLViewOne *viewOne;
@end

@implementation CTLViewControllerOne

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
    NSLog(@"%s VCONE ", __func__);
    CGRect myFrame = CGRectMake(20, 30, 100, 100);
    _viewOne = [[CTLViewOne alloc] initWithFrame:myFrame];
    _viewOne.backgroundColor = [UIColor clearColor];
    //_viewOne.layer.borderWidth = 2.0;
    // _viewOne.layer.borderColor = [UIColor orangeColor].CGColor;
    //_viewOne.layer.cornerRadius = 10.0;
    
    
    
    [self.view addSubview:_viewOne];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
