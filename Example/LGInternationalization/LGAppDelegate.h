//
//  LGAppDelegate.h
//  LGInternationalization
//
//  Created by applekwork@163.com on 11/14/2018.
//  Copyright (c) 2018 applekwork@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface LGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) TabBarController  *tabBarController;
@end
