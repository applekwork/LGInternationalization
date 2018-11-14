//
//  RootViewController.h
//  LGInternationalization_Example
//
//  Created by LG on 2018/11/14.
//  Copyright © 2018年 applekwork@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LGInternationalization/LanguageChange.h>
@interface RootViewController : UIViewController<LanguageChange>
- (void)setLeftNav;
- (void)back;
@end
