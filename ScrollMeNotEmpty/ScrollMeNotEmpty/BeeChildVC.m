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
    
    
   	
    [self.view setFrame:self.navigationController.view.bounds];
    
    // Do any additional setup after loading the view.
    UIImage *bgImage = [UIImage imageNamed:@"Bee.jpg"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    
    
    [bgView setFrame:self.view.frame];
    
    
    [self.view addSubview:bgView];
    
    // [self.view setBackgroundColor:[UIColor greenColor]];
    
    UIBarButtonItem *ham = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(showParentVC)];
    
    self.navigationItem.leftBarButtonItem = ham;
    


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)showParentVC{
    
    NSLog(@"hey .. %@ ",  [self.parentViewController parentViewController ] ) ;
    [_parentLink  showMenuFrom:self.navigationController];
    
    
    
    // [self.parentViewController];
}

@end
