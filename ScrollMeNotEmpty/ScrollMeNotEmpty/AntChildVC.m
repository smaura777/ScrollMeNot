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
    self.view.backgroundColor = [UIColor whiteColor];
    
	
//  [self.view setFrame:self.parentFrame];
    
//    Do any additional setup after loading the view.
    
    UIImage *bgImage = [UIImage imageNamed:@"Ant.jpg"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [self.view addSubview:bgView];
    //   [self.view setBackgroundColor:[UIColor greenColor]];

    
    //self.wantsFullScreenLayout = YES;
//self.navigationController.navigationBar.translucent = YES;
    
//    UIScrollView *ant = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [ant setContentSize:CGSizeMake(self.view.bounds.size.width * 3 , ant.bounds.size.height)];
//  
//    
//    ant.pagingEnabled = YES;
//    ant.showsVerticalScrollIndicator = NO;
//    
//    
//    UIView *layer1 = [[UIView alloc] initWithFrame:CGRectMake(ant.bounds.origin.x,
//                                                              ant.bounds.origin.y,
//                                                              ant.bounds.size.width * 3 ,
//                                                              ant.bounds.size.height)];
//   
//    
//    [layer1 setBackgroundColor:[UIColor purpleColor]];
//    
//    [ant addSubview:layer1];
//    
//    CTLViewOne *viewOne = [[CTLViewOne alloc] initWithFrame:CGRectMake(10, 10, 300, 380) andString:@"Main"];
//    CTLViewOne *viewTwo = [[CTLViewOne alloc] initWithFrame:CGRectMake(viewOne.frame.origin.x + 320, 10, 300, 380) andString:@"SAM"];
//    CTLViewOne *viewThree = [[CTLViewOne alloc] initWithFrame:CGRectMake(viewTwo.frame.origin.x + 320 , 10, 300, 380) andString:@"MAURA"];
//    
//    
//    viewOne.backgroundColor = [UIColor lightGrayColor];
//    viewTwo.backgroundColor = [UIColor lightGrayColor];
//    viewThree.backgroundColor = [UIColor lightGrayColor];
//   
//    [layer1 addSubview:viewOne];
//    [layer1 addSubview:viewTwo];
//    [layer1 addSubview:viewThree];
//    [self.view addSubview:ant];
    
    
    
    self.navigationController.navigationBar.tintColor = TINTCOLOR_WHITE;
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:[NSDictionary
                             dictionaryWithObjects: [NSArray arrayWithObjects: [UIColor grayColor],[UIFont fontWithName:@"AvenirNext-Bold" size:18.0] ,nil]
                             forKeys:[NSArray arrayWithObjects: UITextAttributeTextColor,UITextAttributeFont, nil]  ]];
    

   
    
    _ham = BARBUTTON_SYSTEM(UIBarButtonSystemItemOrganize, self, @selector(showParentVC) );
    _ham.tag = VC_FULL_SCREEN;
    _ham.tintColor = TINTCOLOR_GRAY;
    
    UIBarButtonItem *rightbt = BARBUTTON_WITHTITLE(@"new", UIBarButtonItemStyleBordered, self, @selector(newItem));
    rightbt.tintColor = TINTCOLOR_GRAY;
    
    self.navigationItem.leftBarButtonItem = _ham;
    self.navigationItem.title = @"Ants";
    self.navigationItem.rightBarButtonItem = rightbt;

    
   
    
    //NSArray *myKeys = [NSArray arrayWithObjects:UITextAttributeTextColor, UITextAttributeFont,nil];
    // NSArray *myObjects = [NSArray arrayWithObjects:[UIColor redColor], [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:14.0], nil];
    
    //  NSLog(@"mykeys count = %d ",[myKeys count]);
    //NSLog(@"mYOBJECTS count = %d ",[myObjects count]);
    
       
     
    NSArray *myFonts = [UIFont familyNames];
    
    for (NSString *familyName  in myFonts ){
        NSLog(@"====   ====== \n\n");
        NSArray *fontsForFamily = [UIFont fontNamesForFamilyName:familyName];
        NSLog(@"======= %@  ============================ ",familyName);
        for (NSString *fontNames in fontsForFamily)
           NSLog(@"%@ ",fontNames);
    }
        
    
    
    
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

-(void)newItem{
    NSLog(@"New item");
}

@end
