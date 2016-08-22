//
//  SFMyHeaderView.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyHeaderView.h"

@interface SFMyHeaderView ()


/**头部视图北京图片*/
@property (strong, nonatomic) UIImageView *imageView;
/**登录btn*/
@property (strong, nonatomic) UIButton *loginBtn;
/**注册*/
@property (strong, nonatomic) UIButton *registerBtn;
/**头像*/
@property (strong, nonatomic) UIImageView *iconImage;
/**用户名*/
@property (strong, nonatomic) UILabel *usernameLable;
/**等级*/
@property (strong, nonatomic) UILabel *lvLable;

@end

@implementation SFMyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registerBtn];
        [self addSubview:self.iconImage];
        [self addSubview:self.usernameLable];
        [self addSubview:self.lvLable];
    }
    return self;
}

- (void)layoutSubviews {
    
    __weak typeof(self) weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-90);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(90);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.imageView.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(60);
        make.size.mas_equalTo(CGSizeMake(75, 75));
        
    }];
    
    [self.usernameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(12);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(39);
        make.height.equalTo(@16);
        make.right.equalTo(weakSelf.mas_right);
    }];
    
    [self.lvLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.iconImage.mas_bottom).offset(-12);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(39);
        make.height.equalTo(@16);
        make.right.equalTo(weakSelf.mas_right);
    }];

    
}

- (void)reloadHeaderView {

    NSDictionary *loginDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
    if (loginDic.count) {
        _loginBtn.hidden = YES;
        _registerBtn.hidden = YES;
        _iconImage.hidden = NO;
        _usernameLable.hidden = NO;
        _lvLable.hidden = NO;
        _usernameLable.text = loginDic[@"MemberName"];
        _lvLable.text = loginDic[@"MemberLvl"];
    } else {
        _loginBtn.hidden = NO;
        _registerBtn.hidden = NO;
        _iconImage.hidden = YES;
        _usernameLable.hidden = YES;
        _lvLable.hidden = YES;

    }
}

#pragma mark - setter and getter
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
        [_loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.tintColor = [UIColor whiteColor];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        [_registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

- (UIImageView *)iconImage {

    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登陆界面微博登录"]];
    }
    return _iconImage;
}

- (UILabel *)usernameLable {

    if (!_usernameLable) {
        _usernameLable = [[UILabel alloc] init];
        _usernameLable.text = @"用户名";
        _usernameLable.textColor = [UIColor whiteColor];
    }
    return _usernameLable;
}

- (UILabel *)lvLable {

    if (!_lvLable) {
        _lvLable = [[UILabel alloc] init];
        _lvLable.text = @"一级";
        _lvLable.textColor = [UIColor whiteColor];
    }
    return _lvLable;
}

- (void)registerAction {

    if (_registerBlock) {
        _registerBlock();
    }

}

- (void)loginAction {

    if (_loginBlock) {
        _loginBlock();
    }
}

@end
