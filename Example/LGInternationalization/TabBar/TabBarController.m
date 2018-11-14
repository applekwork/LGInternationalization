//
//  TabBarController.m
//  LGInternationalization_Example
//
//  Created by LG on 15/7/13.
//  Copyright (c) 2015年 applekwork@163.com. All rights reserved.
//

#import "TabBarController.h"
#import "RDVTabBarItem.h"
#import "Macro.h"
@interface TabBarController () <RDVTabBarControllerDelegate>
@end

@implementation TabBarController
- (RDVTabBarController *)rdvTabBarController {
    if (!_rdvTabBarController) {
        NSMutableArray *mutableViewControllers = [NSMutableArray array];
        for (NSString *controllerStr in self.viewControllers) {
            UIViewController *vc = [[NSClassFromString(controllerStr) alloc] init];
            [mutableViewControllers addObject:vc];
        }
        RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
        [tabBarController setViewControllers:mutableViewControllers];
        tabBarController.tabBar.backgroundColor = TABBARCOLOR;
        _rdvTabBarController = tabBarController;
        _rdvTabBarController.delegate = self;
        [self customizeTabBarForController:tabBarController];
        _rdvTabBarController.modalPresentIndex = 2;
    }
    return _rdvTabBarController;
}


- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {

    NSArray *tabBarItemImages = self.tabItemImages;
    NSArray *tabBarTitles = self.tabItemTitles;
    NSInteger index = 0;

    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = [tabBarTitles objectAtIndex:index];
        
//        if (index != 1) {
//            item.imagePositionAdjustment = UIOffsetMake(0, -3.5);
//            item.titlePositionAdjustment = UIOffsetMake(0, 4);
//        }
        
        
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
            item.unselectedTitleAttributes = @{
                                           NSFontAttributeName: [UIFont systemFontOfSize:11],
                                           NSForegroundColorAttributeName: MINORCOLOR,
                                           };
            item.selectedTitleAttributes = @{
                                             NSFontAttributeName: [UIFont systemFontOfSize:11],
                                             NSForegroundColorAttributeName: THEMECOLOR,
                                             };
        } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
            item.unselectedTitleAttributes = @{
                                           UITextAttributeFont: [UIFont systemFontOfSize:11],
                                           UITextAttributeTextColor: MINORCOLOR,
                                           };
            item.selectedTitleAttributes = @{
                                             NSFontAttributeName: [UIFont systemFontOfSize:11],
                                             NSForegroundColorAttributeName: THEMECOLOR,
                                             };
#endif
        }
        index++;
    }
}

- (void)reloadUIWhenLanguageChange {
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self.rdvTabBarController tabBar] items])  {
         item.title = [self.tabItemTitles objectAtIndex:index];
        [item setNeedsDisplay];
        index++;
    }
}

#pragma mark RDVTabBarControllerDelegate
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:didSelectIndex:)]) {
        [self.delegate tabBarController:self didSelectIndex:index];
    }
}


@end
