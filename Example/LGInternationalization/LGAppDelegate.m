//
//  LGAppDelegate.m
//  LGInternationalization
//
//  Created by applekwork@163.com on 11/14/2018.
//  Copyright (c) 2018 applekwork@163.com. All rights reserved.
//

#import "LGAppDelegate.h"
#import <LGInternationalization/LanguageChange.h>
#import <LGInternationalization/Language.h>
#import "HomeViewController.h"
#import "MeViewController.h"
@interface LGAppDelegate()<LanguageChange, TabBarControllerDelegate>

@end
@implementation LGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    _tabBarController = [[TabBarController alloc] init];
    _tabBarController.delegate = self;
    _tabBarController.viewControllers = @[NSStringFromClass([HomeViewController class]),NSStringFromClass([MeViewController class])];
    _tabBarController.tabItemImages = @[@"today",@"me"];
    _tabBarController.tabItemTitles = @[kLang(@"Home"),kLang(@"Me")];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.tabBarController.rdvTabBarController];
    
    UIColor *bgColor = THEMECOLOR;
    [[UINavigationBar appearance] setBarTintColor:bgColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"backicon.png"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"backicon.png"]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:navi_bar_textsize]}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    _tabBarController.nav = nav;
    self.window.rootViewController = nav;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -160)
                                                         forBarMetrics:UIBarMetricsDefault];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark -<LanguageChange>
- (void)reloadUIWhenLanguageChange {
    self.tabBarController.tabItemTitles = @[kLang(@"Home"),kLang(@"Me")];
    [self.tabBarController reloadUIWhenLanguageChange];
    
}
#pragma mark - <TabBarControllerDelegate>
- (void)tabBarController:(TabBarController *)tabBarController didSelectIndex:(NSInteger)index {
    
}
@end
