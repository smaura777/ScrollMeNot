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
    
    self.navigationController.navigationBar.tintColor = TINTCOLOR_WHITE;
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:[NSDictionary
                             dictionaryWithObjects: [NSArray arrayWithObjects: [UIColor grayColor],[UIFont fontWithName:@"AvenirNext-Bold" size:18.0] ,nil]
                             forKeys:[NSArray arrayWithObjects: UITextAttributeTextColor,UITextAttributeFont, nil]  ]];
    
    

    
   	
    [self.view setFrame:self.navigationController.view.bounds];
    
    // Do any additional setup after loading the view.
    UIImage *bgImage = [UIImage imageNamed:@"Bee.jpg"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    
    
    //[bgView setFrame:self.view.frame];
    
    
    [self.view addSubview:bgView];
    
    // [self.view setBackgroundColor:[UIColor greenColor]];
    
    _ham = BARBUTTON_SYSTEM(UIBarButtonSystemItemOrganize, self, @selector(showParentVC) );
    _ham.tag = VC_FULL_SCREEN;
    _ham.tintColor = TINTCOLOR_GRAY;
    
    UIBarButtonItem *rightbt = BARBUTTON_WITHTITLE(@"new", UIBarButtonItemStyleBordered, self, @selector(newItem));
    rightbt.tintColor = TINTCOLOR_GRAY;
    self.navigationItem.leftBarButtonItem = _ham;
    self.navigationItem.title = @"Bee";
    self.navigationItem.rightBarButtonItem = rightbt;

    
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
    
        //NSLog(@"hey .. %@ ",  [self.parentViewController parentViewController ] ) ;
    
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
