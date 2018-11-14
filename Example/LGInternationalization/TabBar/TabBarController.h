//
//  TabBarController.h
//  LGInternationalization_Example
//
//  Created by LG on 15/7/13.
//  Copyright (c) 2015年 applekwork@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDVTabBarController.h"
#import "LanguageChange.h"
@class TabBarController;
@protocol TabBarControllerDelegate <NSObject>
@optional
- (void)tabBarController:(TabBarController *)tabBarController didSelectIndex:(NSInteger)index;

@end
@interface TabBarController : NSObject<LanguageChange>
@property (strong, nonatomic) RDVTabBarController   *rdvTabBarController;
@property (weak, nonatomic) id<TabBarControllerDelegate> delegate;
@property (strong, nonatomic) NSArray   *viewControllers;
@property (strong, nonatomic) NSArray   *tabItemImages;
@property (strong, nonatomic) NSArray   *tabItemTitles;
@property (weak, nonatomic) UINavigationController  *nav;

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController;
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end
