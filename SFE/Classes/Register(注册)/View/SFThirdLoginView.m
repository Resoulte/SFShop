//
//  SFThirdLoginView.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFThirdLoginView.h"
#import <UMSocial.h>

@interface SFThirdLoginView ()

/**分界线*/
@property (strong, nonatomic) UILabel *lineLable;
/**分界文字*/
@property (strong, nonatomic) UILabel *lineWordLable;
/**qq*/
@property (strong, nonatomic) UIButton *qqBtn;
/**微信*/
@property (strong, nonatomic) UIButton *wechatBtn;
/**微博*/
@property (strong, nonatomic) UIButton *weiboBtn;

@end



@implementation SFThirdLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLable];
        [self addSubview:self.lineWordLable];
        [self addSubview:self.qqBtn];
        [self addSubview:self.wechatBtn];
        [self addSubview:self.weiboBtn];
    }
    return self;
}


- (void)layoutSubviews {

    __weak typeof(self) weakSelf = self;
    
    [self.lineWordLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.size.mas_equalTo(CGSizeMake(80, 20));
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    
    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.lineWordLable.mas_centerY);
        make.right.offset(-16);
        make.left.offset(16);
        make.height.equalTo(@1);
    }];
    
    [self.wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(46, 46));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.lineWordLable.mas_bottom).offset(18);
        
    }];
    
    [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.wechatBtn.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(46, 46));
        make.left.offset((SFScreen.width - 138) / 4);
    }];
    
    [self.weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.wechatBtn.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(46, 46));
        make.right.offset(-(SFScreen.width - 138) / 4);
    }];
}

#pragma mark - setter and getter
- (UILabel *)lineLable {

    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = SFColor(190, 190, 190);
    }
    return _lineLable;
}

- (UILabel *)lineWordLable {

    if (!_lineWordLable) {
        _lineWordLable = [[UILabel alloc] init];
        _lineWordLable.text = @"一键登录";
        _lineWordLable.textColor = SFColor(190, 190, 190);
        _lineWordLable.textAlignment = NSTextAlignmentCenter;
        _lineWordLable.font = [UIFont systemFontOfSize:16.0];
        _lineWordLable.backgroundColor = SFMainColor;

    }
    return _lineWordLable;
}

- (UIButton *)qqBtn {

    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqBtn setImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
        [_qqBtn addTarget:self action:@selector(qqLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqBtn;
}

- (UIButton *)wechatBtn {

    if (!_wechatBtn) {
        _wechatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wechatBtn setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
        [_wechatBtn addTarget:self action:@selector(wechatLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wechatBtn;
}

- (UIButton *)weiboBtn {

    if (!_weiboBtn) {
        _weiboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weiboBtn setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
        [_weiboBtn addTarget:self action:@selector(weiboLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weiboBtn;
}

#pragma mark - 第三方登录
- (void)qqLogin {
    
    if (_qqLoginBlock) {
        _qqLoginBlock();
    }
}

- (void)wechatLogin {

    if (_wechatLoginBlock) {
        _wechatLoginBlock();
    }
}

- (void)weiboLogin {
    if (_weiboLoginBlock) {
        _weiboLoginBlock();
    }
}
@end
