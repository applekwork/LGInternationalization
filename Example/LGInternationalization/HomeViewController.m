
//
//  HomeViewController.m
//  LGInternationalization_Example
//
//  Created by LG on 2018/11/14.
//  Copyright © 2018年 applekwork@163.com. All rights reserved.
//

#import "HomeViewController.h"
#import "LGAppDelegate.h"
#import <LGInternationalization/LanguageContainer.h>
#import <MBProgressHUD.h>
@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView  *languageTableView;
@property (nonatomic, strong) NSArray      *languagesArray;
@property (nonatomic, strong) NSArray      *languageCodeArray;
@property (nonatomic, strong) NSArray      *detailLanguageArray;
@property (nonatomic, strong) NSIndexPath  *selectedIndexPath;
@property (strong, nonatomic) MBProgressHUD  *hud;
@end

@implementation HomeViewController

- (void)setRightNav {
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:kLang(@"Save") style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    LGAppDelegate *delegate = (LGAppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.tabBarController.rdvTabBarController.navigationItem.rightBarButtonItem = rightButtonItem;
//    self.navigationItem.rightBarButtonItem = rightButtonItem;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LGAppDelegate *delegate = (LGAppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.tabBarController.rdvTabBarController.title = kLang(@"Language");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRightNav];
    self.view.backgroundColor = [UIColor whiteColor];
    _languageTableView = [[UITableView alloc] init];
    _languageTableView.tableFooterView = [UIView new];
    _languagesArray  = @[@"简体中文",@"Français",@"English"];
    
    _languageCodeArray = @[@"zh-Hans",@"fr",@"en"];
    _detailLanguageArray = @[@"SimpleChinese",@"Franch",@"English"];
    
    NSString *currentLanguageCode = [Language currentLanguageCode];
    NSInteger index = [self.languageCodeArray indexOfObject:currentLanguageCode];
    _selectedIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
    _languageTableView.dataSource = self;
    _languageTableView.delegate = self;
    [self.view addSubview:self.languageTableView];
    [self addViewConstraints];
    // Do any additional setup after loading the view.
}

- (void)reloadUIWhenLanguageChange {
    [self.navigationItem.rightBarButtonItem setTitle:kLang(@"Save")];
}

- (void)save {
    NSString *selectedLanguageCode = [self.languageCodeArray objectAtIndex:self.selectedIndexPath.row];
    if ([selectedLanguageCode isEqualToString:[Language currentLanguageCode]]) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    } else {
        [Language userSelectedLanguage:selectedLanguageCode];
        [[LanguageContainer sharedLanguageContainer] reloadUI:^{
            self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [self.hud setLabelText:kLang(@"Setting...")];
        }
                                                 completBlock:^{
                                                     [self.hud hide:YES];
                                                 }];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)addViewConstraints {
    [self.view addSubview:self.languageTableView];
    [self.languageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.languagesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"languagecell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"languagecell"];
        
    }
    
    if (indexPath.row == self.selectedIndexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedIndexPath = indexPath;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.font =  [UIFont systemFontOfSize:17];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    //未修改前
    //    cell.textLabel.text = [self.languagesArray objectAtIndex:indexPath.row];
    //    cell.detailTextLabel.text = kLang([self.detailLanguageArray objectAtIndex:indexPath.row]);
    //修改后
    cell.textLabel.text = kLang([self.detailLanguageArray objectAtIndex:indexPath.row]);
    cell.detailTextLabel.text = [self.languagesArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectedIndexPath.row == indexPath.row) {
        return;
    }
    UITableViewCell *preSelectedCell = [tableView cellForRowAtIndexPath:self.selectedIndexPath];
    if (preSelectedCell) {
        preSelectedCell.accessoryType = UITableViewCellAccessoryNone;
    }
    self.selectedIndexPath = indexPath;
    UITableViewCell *currentSelectedCell = [tableView cellForRowAtIndexPath:indexPath];
    currentSelectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
}


@end
