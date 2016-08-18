//
//  SFMyViewController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyViewController.h"
#import "SFMyTableViewCell.h"
#import "SFMyMessage.h"
#import "SFMyTableViewCell.h"
#import <Masonry.h>
#import <YYModel.h>

#define SFNumber 4


@interface SFMyViewController () <UITableViewDelegate, UITableViewDataSource>

/**头部视图*/
@property (strong, nonatomic) UIView *headerView;
/**头部视图北京图片*/
@property (strong, nonatomic) UIImageView *imageView;
/**登录btn*/
@property (strong, nonatomic) UIButton *loginBtn;
/**注册*/
@property (strong, nonatomic) UIButton *registerBtn;
/**展示功能的tablView*/
@property (strong, nonatomic) UITableView *tableView;
/**table信息*/
@property (strong, nonatomic) NSArray *tableMessage;
@end


@implementation SFMyViewController

- (void)viewDidLoad {

    self.view.backgroundColor = SFColor(245, 245, 245);
    
    // 添加页面所有子控件
    [self setupAllView];
    // 设置所有子控件的布局
    [self setupAllConstrains];
}

- (void)setupAllView {

    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.imageView];
    [self.headerView addSubview:self.loginBtn];
    [self.headerView addSubview:self.registerBtn];
    [self.view addSubview:self.tableView];
}

- (void)setupAllConstrains {
    
#warning message
    self.edgesForExtendedLayout = 0;
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(125);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.headerView);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(-90);
        make.centerY.equalTo(self.headerView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(90);
        make.centerY.equalTo(self.headerView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(35);
        make.height.mas_equalTo(176);
        make.left.right.offset(0);
        
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return SFNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

     SFMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SFMyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.sourceDic = self.tableMessage[indexPath.row];
    if (indexPath.row == 3) {
        UIImageView *nextImage = [cell valueForKey:@"rightImage"];
        nextImage.hidden = YES;
        
        UILabel *phoneNum = [[UILabel alloc]init];
        phoneNum.textColor = SFColor(123, 124, 128);
        phoneNum.text = @"400-100-1111";
        [cell addSubview:phoneNum];
        
        __weak typeof (cell) weakSelf = cell;
        [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.mas_right).offset(-15);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(110, 15));
        }];
    }
    
    
    return cell;
}

#pragma mark - setter and getter
- (UIView *)headerView {

    if (!_headerView) {
        _headerView = [[UIView alloc] init];
    }
    return _headerView;
}

- (UIImageView *)imageView {

    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"我的背景"]];
    }
    return _imageView;
}

- (UIButton *)loginBtn {
    
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTintColor:[UIColor whiteColor]];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        
        
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {

    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.tintColor = [UIColor whiteColor];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    }
    return _registerBtn;
}

- (UITableView *)tableView {

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (NSArray *)tableMessage {

    if (!_tableMessage) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"SFMyMessageTablePlist.plist" ofType:nil];
        _tableMessage = [NSArray arrayWithContentsOfFile:path];
        
    }

    return _tableMessage;
}
@end
