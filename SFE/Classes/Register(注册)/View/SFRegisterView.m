//
//  SFRegisterView.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRegisterView.h"

@interface SFRegisterView ()

/**提示lable*/
@property (strong, nonatomic) UILabel *tostLable;
/**phone*/
@property (strong, nonatomic) UITextField *phoneFiled;
/**pwd*/
@property (strong, nonatomic) UITextField *pwdFiled;
/**下一步*/
@property (strong, nonatomic) UIButton *nextBtn;
/**goBtn*/
@property (strong, nonatomic) UIButton *goBtn;

@end

@implementation SFRegisterView


- (void)layoutSubviews {

    __weak typeof(self) weakSelf = self;
    [self.tostLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(11);
        make.height.mas_equalTo(35);
    }];
    
    [self.phoneFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.right.left.offset(0);
        make.top.equalTo(weakSelf.tostLable.mas_bottom).offset(0);
    }];
    
    [self.pwdFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.right.left.offset(0);
        make.top.equalTo(weakSelf.phoneFiled.mas_bottom).offset(0);
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(weakSelf.pwdFiled.mas_bottom).offset(16);
        make.height.equalTo(@35);
    }];
}

#pragma mark - setter and getter
- (UILabel *)tostLable {
    
    if (!_tostLable) {
        _tostLable = [[UILabel alloc] init];
        _tostLable.text = @"请输入手机号码注册新用户";
        _tostLable.textAlignment = NSTextAlignmentLeft;
        _tostLable.font = [UIFont systemFontOfSize:14];
        _tostLable.textColor = SFColor(82, 82, 82);
    }
    return _tostLable;
}

- (UITextField *)phoneFiled {
    
    if (!_phoneFiled) {
        _phoneFiled = [[UITextField alloc] init];
        _phoneFiled.placeholder = @"请输入手机号码";
        _phoneFiled.textColor = SFColor(201, 201, 201);
        
        
    }
    return _phoneFiled;
}

- (UITextField *)pwdFiled {
    
    if (!_phoneFiled) {
        _pwdFiled = [[UITextField alloc] init];
        _pwdFiled.placeholder = @"设置账号密码";
        _pwdFiled.textColor = SFColor(201, 201, 201);
    }
    return _pwdFiled;
}

- (UIButton *)nextBtn {
    
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    }
    return _nextBtn;
}

- (UIButton *)goBtn {
    
    if (!_goBtn) {
        _goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goBtn setTitle:@"去登录" forState:UIControlStateNormal];
    }
    return _goBtn;
}

@end
