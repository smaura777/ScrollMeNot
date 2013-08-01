//
//  MenuViewController.h
//  ScrollMeNotEmpty
//
//  Created by Maura, Sam on 7/31/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegateProtocol;


@interface MenuViewController : UITableViewController

@property (nonatomic,weak) id<MenuDelegateProtocol> delegate;

@end


@protocol MenuDelegateProtocol <NSObject>
@required
-(void)forwardDidSelectRowAtIndexPath:(NSIndexPath *)index;

@end