//
//  ColorMemoryAppDelegate.h
//  ColorMemory
//
//  Created by admin on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface ColorMemoryAppDelegate : UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
