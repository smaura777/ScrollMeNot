//
//  MainVC.m
//  ScrollMeNotEmpty
//
//  Created by Maura, Sam on 7/19/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()
-(void)moveScrollViewContainer:(id)sender;
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
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    
    bgView.frame = appFrame;
    self.view = bgView;
    CGRect newFrame = CGRectMake(10.0, 10.0, 300.0, 40.0);
    UIView *searchView = [[UIView alloc] initWithFrame:newFrame];
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
    
    
    // Scrollview container
    self.scrollViewContainer = [[UIView alloc] initWithFrame:appFrame];
    [self.scrollViewContainer setFrame:CGRectMake(_scrollViewContainer.frame.origin.x, 400.0, _scrollViewContainer.frame.size.width, _scrollViewContainer.frame.size.height)];
    self.scrollViewContainer.backgroundColor = [UIColor whiteColor];
    self.scrollViewContainer.alpha = 0.4;
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewContainer:)];
    self.tap.numberOfTapsRequired = 1;
    
    [_scrollViewContainer addGestureRecognizer:self.tap];
    //[scrollViewContainer setUserInteractionEnabled:YES];
    
    [self.view addSubview:self.scrollViewContainer];
    
    [self.view setUserInteractionEnabled:YES];
    
    //NSLog(@"USER INTERACTION ENABLED == %d ", self.view.userInteractionEnabled);
    
    // Scrollview
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

-(void)moveScrollViewContainer:(id)sender {
    NSLog(@"ScrollViewContainer tapped...");
    [UIView animateWithDuration:0.4 animations:^{
        self.scrollViewContainer.alpha = 1.0;
       
        [self.scrollViewContainer setFrame:[[UIScreen mainScreen] bounds]];
        
    } ];
}

@end
