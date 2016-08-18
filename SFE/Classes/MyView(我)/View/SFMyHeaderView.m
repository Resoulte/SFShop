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

@end

@implementation SFMyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registerBtn];

    }
    return self;
}

- (void)layoutSubviews {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(-90);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(90);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];

    
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



@end
