//
//  MainVC.m
//  ScrollMeNotEmpty
//
//  Created by Maura, Sam on 7/19/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

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
    NSLog(@"vc: MainVC loaded");
    
}

-(void)loadView{
    
    UIImage *bgImage = [UIImage imageNamed:@"aerial_One.jpg"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    bgView.frame = [[UIScreen mainScreen] applicationFrame];
    self.view = bgView;
    
    
    CGRect newFrame = CGRectMake(-10.0, 50.0, 300.0, 40.0);
    
    UIView *searchView = [[UIView alloc] initWithFrame:newFrame];
    
    NSLog(@"searchView.bounds.origin.x = %f ,\
          \n searchView.bounds.origin.y = %f \n\
          searchView.bounds.size.width = %f \n \
          searchView.bounds.size.height = %f ",
          searchView.bounds.origin.x,
          searchView.bounds.origin.y,
          searchView.bounds.size.width,
          searchView.bounds.size.height);
    
    [searchView setBounds:CGRectMake(100.0,
                                     searchView.bounds.origin.y,
                                     searchView.bounds.size.width,
                                     searchView.bounds.size.height ) ];
    
    searchView.backgroundColor = [UIColor cyanColor];
    
    NSLog(@"searchView.bounds.origin.x = %f ,\
          \n searchView.bounds.origin.y = %f \n\
          searchView.bounds.size.width = %f \n \
          searchView.bounds.size.height = %f ",
          searchView.bounds.origin.x,
          searchView.bounds.origin.y,
          searchView.bounds.size.width,
          searchView.bounds.size.height);
    
    [self.view addSubview:searchView ];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
