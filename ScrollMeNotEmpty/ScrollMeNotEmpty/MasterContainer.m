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
#import <QuartzCore/QuartzCore.h>

@interface MasterContainer () <SlidingVCDelegate, UITableViewDataSource, MenuDelegateProtocol>

@property (nonatomic,assign) BOOL showingMenu;
@property (nonatomic,assign) BOOL antVCLoaded;
@property (nonatomic,assign) BOOL beeVCLoaded;

    //@property (nonatomic,strong) UINavigationController *antVCNav;
@property (nonatomic,strong) UIViewController *selectedViewController;
@property (nonatomic,strong) NSMutableArray *viewControllersList;


@property (nonatomic,strong) AntChildVC *antVC;
@property (nonatomic,strong) BeeChildVC *beeVC;
@property (nonatomic,strong) MenuViewController *mvc;

@property (nonatomic,assign) CGRect defaultMenuFrame;
@property (nonatomic,assign) CGRect defaultSlideFrame;


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
  
    
    // Set up view frames
    self.defaultMenuFrame = self.view.bounds;
    self.defaultSlideFrame = CGRectMake(250,
                                        self.view.bounds.origin.y,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    
        //self.antVC = [[AntChildVC alloc] init];
    
    
    
    NSDictionary *tmpVCDetailsList = [NSDictionary
                    dictionaryWithObjects:[NSArray
                    arrayWithObjects:@"Ant",@"basic", [[UINavigationController alloc] initWithRootViewController:[[AntChildVC alloc] init]], nil]
                    forKeys:[NSArray arrayWithObjects:@"title",@"type",@"vc", nil]];


    NSDictionary *tmpVCDetailsList2 = [NSDictionary
                            dictionaryWithObjects:[NSArray arrayWithObjects:@"Bee",@"basic",
                            [[UINavigationController alloc] initWithRootViewController:[[BeeChildVC alloc] init]], nil]
                            forKeys:[NSArray arrayWithObjects:@"title",@"type",@"vc", nil]];

    
    self.viewControllersList = [[NSMutableArray alloc] init];
    [self.viewControllersList addObject:tmpVCDetailsList];
    [self.viewControllersList addObject:tmpVCDetailsList2];
    
    [self setupAndLoadDefaultContentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark setupAndLoadDefaultContentView

-(void)setupAndLoadDefaultContentView {
    
    UINavigationController *tmp = [[_viewControllersList objectAtIndex:0] objectForKey:@"vc"];
    if (tmp){
        [self addChildViewController:tmp];
        [[[tmp viewControllers] objectAtIndex:0] setDelegate:self];
        [self.view addSubview:tmp.view];
        [tmp didMoveToParentViewController:self];
        _selectedViewController = tmp;
    }
    
    /**
    if (!_antVC){
        self.antVC = [[AntChildVC alloc] init];
        self.antVC.delegate = self;
        
    
        UINavigationController *tmp = [[UINavigationController alloc] initWithRootViewController:_antVC];
        [self.view addSubview:tmp.view];
        [self addChildViewController:tmp];
        [tmp didMoveToParentViewController:self];
        _selectedViewController = tmp;
    }
    **/
    
}




#pragma mark -

#pragma mark setupAndLoadMenuView

-(void)setupAndLoadMenuView {
    if (!_mvc){
        self.mvc = [[MenuViewController alloc] initWithStyle:UITableViewStylePlain];
        self.mvc.tableView.dataSource = self;
        self.mvc.delegate = self;
        
    }
    [self.mvc.view setFrame:self.view.bounds];
    
    //[self.view addSubview:self.mvc.view];
    [self.view insertSubview:self.mvc.view belowSubview:_selectedViewController.view];
    
    [self addChildViewController:_mvc];
    [_mvc didMoveToParentViewController:self];

    //[self.view sendSubviewToBack:self.mvc.view];
    
//          [self.antVCNav.view setFrame:CGRectMake(200,
//              self.antVCNav.view.frame.origin.y,
//              self.antVCNav.view.frame.size.width,
//              self.antVCNav.view.frame.size.height)];
    

    // [self subviewDebug:self.antVCNav.view withParent:nil];
    
    //NSLog(@"\n\n ========================================================\n\n");
    
    //[self subviewDebug:self.mvc.view withParent:nil];
    
}


#pragma mark -

#pragma mark displayMainMenu

-(void)displayMainMenu {
        
    [self decorateViewController:_selectedViewController];
    
    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //[self.antVCNav.view setFrame:CGRectMake(200, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
         [_selectedViewController.view setFrame:self.defaultSlideFrame];
        
    } completion:nil];
}

#pragma mark -

#pragma mark decorateViewController

-(void)decorateViewController:(UIViewController *)vc {
     
    
    //[vc.view.layer setMasksToBounds:YES];
    // [vc.view.layer setCornerRadius:24];
    [vc.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [vc.view.layer setShadowOpacity:0.8];
    [vc.view.layer setShadowOffset:CGSizeMake(-2, -2)];
}

#pragma mark -

#pragma mark decorateViewController

-(void)unDecorateViewController:(UIViewController *)vc {
   
    [vc.view.layer setShadowColor:[UIColor whiteColor].CGColor];
    [vc.view.layer setShadowOpacity:1.0];
    [vc.view.layer setShadowOffset:CGSizeMake(0, 0)];
    
}





#pragma mark -

#pragma mark hideMainMenu

-(void)hideMainMenu {
    [self unDecorateViewController:_selectedViewController];
   
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [_selectedViewController.view setFrame:self.defaultMenuFrame];
        
    } completion:nil];
    
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
    
    NSLog(@"NAV frame : %@", NSStringFromCGRect(_selectedViewController.view.frame));
    NSLog(@" MENU frame : %@", NSStringFromCGRect(_mvc.view.frame));
    NSLog(@" Master container view frame : %@", NSStringFromCGRect(self.view.frame));
    NSLog(@" Master container view bounds : %@", NSStringFromCGRect(self.view.bounds));
    
    [self displayMainMenu];
    self.showingMenu = YES;
    
}

-(void)hideAppMenuFor:(UIViewController *)vc {
     NSLog(@"Will hide nenu");
     [self hideMainMenu];
     self.showingMenu = NO;
}

#pragma mark
#pragma mark TableView DataSource Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewControllersList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil; // [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
    }
    cell.textLabel.text = [[_viewControllersList objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    
        //[[_viewControllersList objectAtIndex:0] objectForKey:@"vc"];
        // Configure the cell...
    
    return cell;
}


#pragma mark
#pragma mark MenuDelegateProtocol

-(void)forwardDidSelectRowAtIndexPath:(NSIndexPath *)index {
    NSLog(@"Hello... %d", index.row);
}

@end
