//
//  AntChildVC.m
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 7/22/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import "AntChildVC.h"

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
	
    [self.view setFrame:self.parentFrame];
    
    // Do any additional setup after loading the view.
    UIImage *bgImage = [UIImage imageNamed:@"Ant.jpg"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    
    
     [bgView setFrame:self.view.frame];
    
    
    [self.view addSubview:bgView];
    
    // [self.view setBackgroundColor:[UIColor greenColor]];
    
    UIBarButtonItem *ham = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(showParentVC)];
    
    self.navigationItem.leftBarButtonItem = ham;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showParentVC{
    
    NSLog(@"hey .. %@ ",  [self.parentViewController parentViewController ] ) ;
    [_parentLink  showMainVC];
    
    
  
    // [self.parentViewController];
}

@end