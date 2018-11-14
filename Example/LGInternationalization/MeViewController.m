//
//  MeViewController.m
//  LGInternationalization_Example
//
//  Created by LG on 2018/11/14.
//  Copyright © 2018年 applekwork@163.com. All rights reserved.
//

#import "MeViewController.h"
#import "LGAppDelegate.h"
@interface MeViewController ()

@end

@implementation MeViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LGAppDelegate *delegate = (LGAppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.tabBarController.rdvTabBarController.title = kLang(@"Me");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
