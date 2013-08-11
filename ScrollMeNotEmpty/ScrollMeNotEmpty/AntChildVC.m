//
//  AntChildVC.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "AntChildVC.h"
#import "CTLViewOne.h"



@interface AntChildVC () <UIScrollViewDelegate>

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
    
//    Do any additional setup after loading the view.
    
//    UIImage *bgImage = [UIImage imageNamed:@"Ant.jpg"];
//    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
//    [self.view addSubview:bgView];
//    [self.view setBackgroundColor:[UIColor greenColor]];
//    
    
    UIScrollView *ant = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [ant setContentSize:CGSizeMake(self.view.bounds.size.width * 3 , ant.bounds.size.height)];
    // [ant setContentInset:UIEdgeInsetsMake(64.0,0.0,44.0,0.0)];
    
    ant.pagingEnabled = YES;
    ant.showsVerticalScrollIndicator = NO;
    
    
    UIView *layer1 = [[UIView alloc] initWithFrame:CGRectMake(ant.bounds.origin.x,
                                                              ant.bounds.origin.y,
                                                              ant.bounds.size.width * 3 ,
                                                              ant.bounds.size.height)];
   
    
    [layer1 setBackgroundColor:[UIColor purpleColor]];
    
    [ant addSubview:layer1];
    
    CTLViewOne *viewOne = [[CTLViewOne alloc] initWithFrame:CGRectMake(10, 10, 300, 380) andString:@"Main"];
    CTLViewOne *viewTwo = [[CTLViewOne alloc] initWithFrame:CGRectMake(viewOne.frame.origin.x + 320, 10, 300, 380) andString:@"SAM"];
    CTLViewOne *viewThree = [[CTLViewOne alloc] initWithFrame:CGRectMake(viewTwo.frame.origin.x + 320 , 10, 300, 380) andString:@"MAURA"];
    
    
    viewOne.backgroundColor = [UIColor lightGrayColor];
    viewTwo.backgroundColor = [UIColor lightGrayColor];
    viewThree.backgroundColor = [UIColor lightGrayColor];
   
    [layer1 addSubview:viewOne];
    [layer1 addSubview:viewTwo];
    [layer1 addSubview:viewThree];
    
    
    [self.view addSubview:ant];
    
    
    
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
