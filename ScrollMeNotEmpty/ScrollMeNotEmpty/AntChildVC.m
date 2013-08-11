//
//  AntChildVC.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "AntChildVC.h"
#import "CTLViewOne.h"



@interface AntChildVC ()

@end

@implementation AntChildVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//
//-(void)loadView {
//    UIImage *bgImage = [UIImage imageNamed:@"Ant.jpg"];
//    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
//    [bgView setFrame:self.view.frame];
//    self.view = bgView;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //  [self.view setFrame:self.parentFrame];
    
    // Do any additional setup after loading the view.
    
//    UIImage *bgImage = [UIImage imageNamed:@"Ant.jpg"];
//    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
//    [self.view addSubview:bgView];
//    [self.view setBackgroundColor:[UIColor greenColor]];
//    
    
   CTLViewOne *viewOne = [[CTLViewOne alloc] initWithFrame:self.view.bounds andString:@"Main"];
   viewOne.backgroundColor = [UIColor lightGrayColor];
   [self.view addSubview:viewOne];
    
    
    
    _ham = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
            target:self
            action:@selector(showParentVC)];
    _ham.tag = VC_FULL_SCREEN;
    self.navigationItem.leftBarButtonItem = _ham;
    
    NSLog(@"View for %@  %s ", NSStringFromClass([self class]),__func__); 
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"View for %@  %s ", NSStringFromClass([self class]),__func__);
    
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"View for %@  %s ", NSStringFromClass([self class]),__func__);
}

- (void)viewDidLayoutSubviews{
    NSLog(@"View for %@  %s ", NSStringFromClass([self class]),__func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showParentVC{
    
    NSLog(@"hey .. %@ ",  [self.parentViewController parentViewController ] ) ;
   
    
    
    if (_ham.tag == VC_FULL_SCREEN){
        [self.delegate  showAppMenuFor:self.navigationController];
        _ham.tag = VC_PARTIAL_SCREEN;
    }
    else {
        [self.delegate hideAppMenuFor:self.navigationController];
        _ham.tag = VC_FULL_SCREEN;
    }
    
    
    // [self.parentViewController];
}

@end
