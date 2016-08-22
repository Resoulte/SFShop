//
//  SFInputView.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFInputView.h"

@interface SFInputView () <UITextFieldDelegate>

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
/**北京框*/
@property (strong, nonatomic) UILabel *backLable;
/**分隔线*/
@property (strong, nonatomic) UILabel *lineLable;

@end

@implementation SFInputView

// 不要忘哦
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLable];
        [self addSubview:self.backLable];
        [self addSubview:self.phoneFiled];
        [self addSubview:self.pwdFiled];
        [self addSubview:self.lineLable];
        [self addSubview:self.nextBtn];
        [self addSubview:self.goBtn];
    }
    return self;
}

- (void)layoutSubviews {

    __weak typeof(self) weakSelf = self;
    [self.tostLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.top.right.equalTo(weakSelf);
        make.height.mas_equalTo(@35);
    }];
    
    [self.backLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@89);
        make.left.offset(-1);
        make.right.offset(1);
        make.top.equalTo(weakSelf.tostLable.mas_bottom);
    }];

    [self.phoneFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.right.left.equalTo(weakSelf).offset(15);
        make.top.equalTo(weakSelf.backLable.mas_top);
    }];
    
    [self.pwdFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.right.left.offset(15);
        make.top.equalTo(weakSelf.phoneFiled.mas_bottom).offset(1);
    }];
    
    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.right.equalTo(weakSelf.backLable.mas_right).offset(-15);
        make.left.equalTo(weakSelf.backLable.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.backLable.mas_centerY);
    }];

    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(weakSelf.pwdFiled.mas_bottom).offset(16);
        make.height.equalTo(@35);
    }];
    
    [self.goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 17));
        make.right.offset(-15);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(23);
        
    }];
    
}

#pragma mark - setter and getter
- (UILabel *)tostLable {

    if (!_tostLable) {
        _tostLable = [[UILabel alloc] init];
        _tostLable.text = @"请输入手机号码注册新用户";
//        _tostLable.textAlignment = NSTextAlignmentLeft;
        _tostLable.font = [UIFont systemFontOfSize:14.0];
        _tostLable.textColor = SFColor(82, 82, 82);
    }
    return _tostLable;
}

- (UITextField *)phoneFiled {

    if (!_phoneFiled) {
        _phoneFiled = [[UITextField alloc] init];
        _phoneFiled.placeholder = @"请输入手机号码";
        _phoneFiled.textColor = SFColor(201, 201, 201);
        _phoneFiled.delegate = self;
        
        [_phoneFiled addTarget:self action:@selector(phoneChangeValue:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return _phoneFiled;
}


- (UITextField *)pwdFiled {

    if (!_pwdFiled) {
        _pwdFiled = [[UITextField alloc] init];
        _pwdFiled.placeholder = @"设置账号密码";
        _pwdFiled.textColor = SFColor(201, 201, 201);
        
        // UIControlEventAllEditingEvents谨记
        [_pwdFiled addTarget:self action:@selector(pwdChangeValue:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return _pwdFiled;
}

- (UIButton *)nextBtn {

    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextBtn.backgroundColor = SFColor(234, 234, 234);
        [_nextBtn setTitleColor:SFColor(150, 150, 150) forState:UIControlStateNormal];
        // 设置圆角
        _nextBtn.layer.cornerRadius = 5;
        _nextBtn.contentMode = UIViewContentModeScaleAspectFit;
        
        // 跳转到下一步界面
        [_nextBtn addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

- (UIButton *)goBtn {

    if (!_goBtn) {
        _goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goBtn setTitle:@"去登录" forState:UIControlStateNormal];
        [_goBtn setTitleColor:SFColor(0, 184, 240) forState:UIControlStateNormal];
        
    }
    return _goBtn;
}

- (UILabel *)backLable {

    if (!_backLable) {
        _backLable = [[UILabel alloc] init];
        _backLable.backgroundColor = [UIColor whiteColor];
        _backLable.layer.borderWidth = 1;
        _backLable.layer.borderColor = SFColor(188, 188, 188).CGColor;
    }
    return _backLable;
}

-(UILabel *)lineLable {

    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = SFColor(188, 188, 188);
    }
    return _lineLable;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
//    SFLog(@"%zd", range);
    // 不能用length
    if (textField == _phoneFiled && range.location == 11) {
        return NO;
    }
    return YES;
}

#pragma mark - phoneFiled监听的方法
- (void)phoneChangeValue:(UITextField *)textFiled {
    
        if (textFiled.text.length == 11 && _pwdFiled.text.length > 5) {
            _nextBtn.userInteractionEnabled = YES;
            _nextBtn.backgroundColor = SFColor(0, 183, 239);
            
        } else {
            _nextBtn.userInteractionEnabled = NO;
            _nextBtn.backgroundColor = SFColor(234, 234, 234);
        }
//        SFLog(@"phone%@", textFiled.text);
}

#pragma mark - pwdChange的监听方法
- (void)pwdChangeValue:(UITextField *)textFiled {
    
    if (textFiled.text.length > 5  && _phoneFiled.text.length == 11) {
        _nextBtn.userInteractionEnabled = YES;
        _nextBtn.backgroundColor = SFColor(0, 183, 239);
        
    } else {
        _nextBtn.userInteractionEnabled = NO;
        _nextBtn.backgroundColor = SFColor(234, 234, 234);
    }
//    SFLog(@"pwd%@", textFiled.text);
}

#pragma mark - 跳转到下一步
- (void)pushNextViewController {
    
    if (_nextButttonBlock) {
    
        _nextButttonBlock(@{@"userName" : _phoneFiled.text, @"password" : _pwdFiled.text});
    }
}
@end
