//
//  macrosUtils.h
//  ScrollMeNotEmpty
//
//  Created by samuel maura on 8/18/13.
//  Copyright (c) 2013 Maura, Sam. All rights reserved.
//

#ifndef ScrollMeNotEmpty_macrosUtils_h
#define ScrollMeNotEmpty_macrosUtils_h

#define BARBUTTON_WITHTITLE(TITLE,STYLE,TARGET,SELECTOR) [[UIBarButtonItem alloc] \
initWithTitle:TITLE \
style:STYLE \
target:TARGET \
action:SELECTOR]


#define BARBUTTON_SYSTEM(SYSTEM,TARGET,SELECTOR) [[UIBarButtonItem alloc] \
initWithBarButtonSystemItem:SYSTEM \
target:TARGET \
action:SELECTOR]
#define TINTCOLOR_WHITE [UIColor whiteColor]
#define TINTCOLOR_GRAY [UIColor grayColor]



#endif
