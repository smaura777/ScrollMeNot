//
//  MasterContainer.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/30/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "MasterContainer.h"
#import "AntChildVC.h"
#import "BeeChildVC.h"
#import "MenuViewController.h"


@interface MasterContainer () <SlidingVCDelegate>

@property (nonatomic,assign) BOOL showingMenu;
@property (nonatomic,assign) BOOL antVCLoaded;
@property (nonatomic,assign) BOOL beeVCLoaded;

@property (nonatomic,strong) UINavigationController *antVCNav;
@property (nonatomic,strong) AntChildVC *antVC;
@property (nonatomic,strong) BeeChildVC *beeVC;
@property (nonatomic,strong) MenuViewController *mvc;

@end

@implementation MasterContainer


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
    NSLog(@"Master container loaded");
    NSLog(@"Building main view");
    [self setupAndLoadDefaultContentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark setupAndLoadCenterView

-(void)setupAndLoadDefaultContentView {
    if (!_antVC){
        self.antVC = [[AntChildVC alloc] init];
        self.antVC.delegate = self;
        
    
        UINavigationController *tmp = [[UINavigationController alloc] initWithRootViewController:_antVC];
        [self.view addSubview:tmp.view];
        //self.antVC.view.frame = self.view.bounds;
        [self addChildViewController:tmp];
        [tmp didMoveToParentViewController:self];
        
        self.antVCNav = tmp;
    }
    
}




#pragma mark -

#pragma mark setupAndLoadMenuView

-(void)setupAndLoadMenuView {
    if (!_mvc){
        self.mvc = [[MenuViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    [self.mvc.view setFrame:self.view.bounds];
    
        //[self.view addSubview:self.mvc.view];
        [self.view insertSubview:self.mvc.view belowSubview:self.antVCNav.view];
    
    [self addChildViewController:_mvc];
    [_mvc didMoveToParentViewController:self];

        //[self.view sendSubviewToBack:self.mvc.view];
    /**
          [self.antVCNav.view setFrame:CGRectMake(200,
              self.antVCNav.view.frame.origin.y,
              self.antVCNav.view.frame.size.width,
              self.antVCNav.view.frame.size.height)];
    **/

    [self subviewDebug:self.antVCNav.view withParent:nil];
    
    NSLog(@"\n\n ========================================================\n\n");
    
    [self subviewDebug:self.mvc.view withParent:nil];
    
}

-(void)subviewDebug:(UIView *)sub withParent:(UIView *)parentView {
    
    if (parentView)
       NSLog(@"\nParent view: %@ \nSubview: %@ \n\n",[parentView description],  [sub description]);
    else
       NSLog(@"\nSubview: %@ \n\n",[sub description]);
    
    NSLog(@"Subview Count : %d", [sub.subviews count]);
    
    for (UIView *inner in sub.subviews){
        [self subviewDebug:inner withParent:sub];
    }
}


#pragma mark -

#pragma mark loadContentViewController:(UIViewController *)vc 

-(void)loadContentViewController:(UIViewController *)vc {
    
    if (vc){
        UINavigationController *tmp = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.view addSubview:tmp.view];
        [self addChildViewController:tmp];
        [tmp didMoveToParentViewController:self];
    }

}


#pragma mark -

#pragma mark unloadViewController:(UIViewController *)vc


-(void)unloadViewController:(UIViewController *)vc{

}


#pragma mark -

#pragma mark swapViewController:(UIViewController *)vca forViewController:(UIViewController *)vcb


-(void)swapViewController:(UIViewController *)vca forViewController:(UIViewController *)vcb {
    
    //...
    
    [self unloadViewController:vca];
    
    //..
    [self loadContentViewController:vcb];
}


#pragma mark -

#pragma mark SlidingVCDelegate methods


-(void)showAppMenuFor:(UIViewController *)vc {
    NSLog(@"Will show nenu");
    [self setupAndLoadMenuView];
}

-(void)hideAppMenuFor:(UIViewController *)vc {
     NSLog(@"Will hide nenu");
}



@end
