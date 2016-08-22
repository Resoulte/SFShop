//
//  SFMyViewController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyViewController.h"
#import "SFRegisterViewController.h"
#import "SFLoginViewController.h"
#import "SFMyTableView.h"
#import "SFMyHeaderView.h"

@interface SFMyViewController ()

/**头部视图*/
@property (strong, nonatomic) SFMyHeaderView *headerView;
/**展示功能的tablView*/
@property (strong, nonatomic) SFMyTableView *tableView;

@end


@implementation SFMyViewController

- (void)viewDidLoad {

    self.view.backgroundColor = SFMainColor;
    
    // 添加页面所有子控件
    [self setupAllView];
    
    // 设置所有子控件的布局
//    [self setupAllConstrains];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
    [_headerView reloadHeaderView];
}

- (void)setupAllView {
    
//    [self.view addSubview:self.headerView];
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.tableView];
}

- (void)setupAllConstrains {
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.mas_equalTo(@125);
    }];

//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.headerView.mas_bottom).offset(35);
//        make.height.mas_equalTo(176);
//        make.left.right.offset(0);
//        
//    }];
    
}

#pragma mark - setter and getter
- (SFMyHeaderView *)headerView {

    if (!_headerView) {
        _headerView = [[SFMyHeaderView alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, 125)];
        
        __weak typeof(self) weakSelf = self;
        _headerView.registerBlock = ^(){
            SFRegisterViewController *registe = [[SFRegisterViewController alloc] init];
            [weakSelf.navigationController pushViewController:registe animated:YES];
        };
        
        _headerView.loginBlock = ^() {
            SFLoginViewController *login = [[SFLoginViewController alloc] init];
            [weakSelf.navigationController pushViewController:login animated:YES];
        };
    }
    return _headerView;
}


- (SFMyTableView *)tableView {

    if (!_tableView) {
        _tableView = [[SFMyTableView alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, SFScreen.height) style:UITableViewStylePlain];
        __weak typeof(self) weakSelf = self;
        _tableView.existBtnBlock = ^(){
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isLogin"];
            [weakSelf.tableView reloadData];
            [weakSelf.headerView reloadHeaderView];
        };
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

@end
