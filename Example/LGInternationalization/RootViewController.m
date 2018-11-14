//
//  RootViewController.m
//  LGInternationalization_Example
//
//  Created by LG on 2018/11/14.
//  Copyright © 2018年 applekwork@163.com. All rights reserved.
//

#import "RootViewController.h"
#import "UINavigationBar+Awesome.h"
#import <LGInternationalization/LanguageContainer.h>


@interface RootViewController ()

@end

@implementation RootViewController

- (void)setLeftNav {
    UIImage *backNormalImage = [UIImage imageNamed:@"backicon"];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.titleLabel.text = @"返回";
    backBtn.bounds = CGRectMake( 0, 0, 44, 44);
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backBtn setImage:backNormalImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)back {
    [[LanguageContainer sharedLanguageContainer] removeLanguageChangeController:self];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    //    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColorFromRGB(0x0a285a) colorWithAlphaComponent:1.0]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftNav];
    [[LanguageContainer sharedLanguageContainer] addLanguageChangeController:self];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    
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

- (void)reloadUIWhenLanguageChange {
    
}

@end
