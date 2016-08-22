//
//  SFLoginInputView.m
//  SFE
//
//  Created by ma c on 16/8/21.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLoginInputView.h"

@interface SFLoginInputView () <UITextFieldDelegate>

/**背景view*/
@property (strong, nonatomic) UILabel *backLable;
/**分隔线*/
@property (strong, nonatomic) UILabel *lineLable;
/**账号*/
@property (strong, nonatomic) UITextField *userName;
/**密码*/
@property (strong, nonatomic) UITextField *passWord;
/**登录*/
@property (strong, nonatomic) UIButton *loginBtn;
/**免费注册*/
@property (strong, nonatomic) UIButton *freeBtn;

@end

@implementation SFLoginInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backLable];
        [self addSubview:self.userName];
        [self addSubview:self.passWord];
        [self addSubview:self.lineLable];
        [self addSubview:self.loginBtn];
        [self addSubview:self.freeBtn];
    }
    return self;
}

- (void)layoutSubviews {

    __weak typeof(self) weakSelf = self;
    [self.backLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.offset(-1);
        make.right.offset(1);
        // 要大一个像素
        make.height.equalTo(@89);
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLable.mas_top);
        make.left.right.offset(15);
        make.height.mas_equalTo(44);
        make.top.equalTo(weakSelf.backLable.mas_top);
    }];
    
   
    [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.right.left.offset(15);
        make.top.equalTo(weakSelf.userName.mas_bottom).offset(1);
    }];
    
    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.right.equalTo(weakSelf.backLable.mas_right).offset(-15);
        make.left.equalTo(weakSelf.backLable.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.backLable.mas_centerY);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(weakSelf.passWord.mas_bottom).offset(16);
        make.height.equalTo(@35);
    }];
    
    [self.freeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 17));
        make.right.offset(-15);
        make.top.equalTo(weakSelf.loginBtn.mas_bottom).offset(23);
        
    }];


}

#pragma mark - setter and getter 
- (UILabel *)backLable {

    if (!_backLable) {
        _backLable = [[UILabel alloc] init];
        _backLable.backgroundColor = [UIColor whiteColor];
        _backLable.layer.borderWidth = 1;
        _backLable.layer.borderColor = SFColor(201, 199, 204).CGColor;

    }
    return _backLable;
}

- (UILabel *)lineLable {

    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = SFColor(201, 199, 204);
    }
    return _lineLable;
}

- (UITextField *)userName {

    if (!_userName) {
        _userName = [[UITextField alloc] init];
        _userName.placeholder = @"请输入手机号";
        _userName.textColor = SFColor(201, 201, 201);
        _userName.delegate = self;
        [_userName addTarget:self action:@selector(usernameChangeValue:) forControlEvents:UIControlEventAllEvents];
        
    }
    return _userName;
}

- (UITextField *)passWord {

    if (!_passWord) {
        _passWord = [[UITextField alloc] init];
        _passWord.placeholder = @"请输入密码";
        _passWord.textColor = SFColor(201, 201, 201);
        _passWord.delegate = self;
        [_passWord addTarget:self action:@selector(passwordChangeValue:) forControlEvents:UIControlEventAllEvents];
    }
    return _passWord;
}

- (UIButton *)loginBtn {

    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:SFColor(132, 132, 132) forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _loginBtn.backgroundColor = SFColor(234, 234, 234);
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.contentMode = 0;
        
        [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)freeBtn {

    if (!_freeBtn) {
        _freeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_freeBtn setTitle:@"免费注册" forState:UIControlStateNormal];
        [_freeBtn setTitleColor:SFColor(0, 156, 188) forState:UIControlStateNormal];
    }
    return _freeBtn;
}


- (void)login {
    if (_loginBlock) {
        _loginBlock(@{@"LoginName" : _userName.text, @"Lpassword" : _passWord.text});
    }
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //    SFLog(@"%zd", range);
    // 不能用length
    if (textField == _userName && range.location == 11) {
        return NO;
    }
    return YES;
}

#pragma mark - phoneFiled监听的方法
- (void)usernameChangeValue:(UITextField *)textFiled {
    
    if (textFiled.text.length == 11 && _passWord.text.length > 5) {
        _loginBtn.userInteractionEnabled = YES;
        _loginBtn.backgroundColor = SFColor(0, 183, 239);
        
    } else {
        _loginBtn.userInteractionEnabled = NO;
        _loginBtn.backgroundColor = SFColor(234, 234, 234);
    }
    //        SFLog(@"phone%@", textFiled.text);
}

#pragma mark - pwdChange的监听方法
- (void)passwordChangeValue:(UITextField *)textFiled {
    
    if (textFiled.text.length > 5  && _userName.text.length == 11) {
        _loginBtn.userInteractionEnabled = YES;
        _loginBtn.backgroundColor = SFColor(0, 183, 239);
        
    } else {
        _loginBtn.userInteractionEnabled = NO;
        _loginBtn.backgroundColor = SFColor(234, 234, 234);
    }
    //    SFLog(@"pwd%@", textFiled.text);
}

@end
