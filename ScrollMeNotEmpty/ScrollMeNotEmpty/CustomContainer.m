//
//  CustomContainer.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CustomContainer.h"
#import "AntChildVC.h"
#import "BeeChildVC.h"

#define CORNER_RADIUS 30.0
#define SHADOW_OFFSET -4
#define SHADOW_OPACITY 0.8



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



- (void)loadView
{
    //_menuList = [NSArray arrayWithObjects:[NSString stringWithString:@"Ants"],[NSString stringWithString:@"Bees"] ,nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    
    self.view = tableView;
    //self.view.backgroundColor = [UIColor blackColor];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
        //self.acvc =[[AntChildVC alloc] init];
    
    
       _acvc = [[AntChildVC alloc] init];
       _bcvc = [[BeeChildVC alloc] init];
   
    _menuList = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:_acvc forKey:@"Ants"], [NSDictionary dictionaryWithObject:_bcvc forKey:@"Bee"],nil];

    UITableView *mv = (UITableView *) self.view;
    [mv reloadData];
    
    
    
    _acvc.parentFrame = self.view.bounds;
    
    _acvc.delegate = self;
    _bcvc.delegate = self;
    
    
    
  self.antNav = [[UINavigationController alloc] initWithRootViewController:_acvc];
    
    _topVC = _acvc;
    
    
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


#pragma mark - TableViewDataSourceDelegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [ [UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    NSLog(@"menu %@",[_menuList objectAtIndex:indexPath.row]);
    
    cell.textLabel.text = [[[_menuList objectAtIndex:indexPath.row] allKeys] lastObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
    
    id temp =  [[[_menuList objectAtIndex:indexPath.row] allValues] lastObject] ;
    
    if (![_topVC  isEqual:  temp] ){
        [self.antNav willMoveToParentViewController:nil];
        [self.antNav.view removeFromSuperview];
        [self.antNav removeFromParentViewController];
        
        _topVC = temp;
        //_topVC.parentLink = self;
        
        
        [self.antNav setViewControllers:[NSArray arrayWithObject:_topVC] ];
        [self displayAntController:self.antNav];
        [self showAppMenuFor:self.antNav];
        
    }
    
}



#pragma mark - SlidingVCDelegate

-(void)showAppMenuFor:(UIViewController *)vc {
   /**
    NSLog(@"VIEW BOUNDS : X : %f Y: %f  width: %f height %f ", self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
    NSLog(@"VIEW FRAME : X : %f Y: %f  width: %f height %f ", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    NSLog(@"PARENT VC ");
    **/
    
    
    CGRect newFrame;
    newFrame = CGRectMake(260.0, vc.view.frame.origin.y, vc.view.frame.size.width, vc.view.frame.size.height);
    [vc.view.layer setCornerRadius:CORNER_RADIUS];
    [vc.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [vc.view.layer setShadowOpacity:SHADOW_OPACITY];
    [vc.view.layer setShadowOffset:CGSizeMake(SHADOW_OFFSET, SHADOW_OFFSET)];
   
    
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [vc.view setFrame:newFrame];
        
    } completion:nil];
    
}


-(void)hideAppMenuFor:(UIViewController *)vc {
    CGRect newFrame;
     newFrame = CGRectMake(0.0, vc.view.frame.origin.y, vc.view.frame.size.width, vc.view.frame.size.height);
    
    [vc.view.layer setCornerRadius:0];
    [vc.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [vc.view.layer setShadowOffset:CGSizeMake(0, 0)];

    
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [vc.view setFrame:newFrame];
    } completion:nil];

}

@end
