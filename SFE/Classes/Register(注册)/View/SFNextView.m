//
//  SFNextView.m
//  SFE
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNextView.h"

@interface SFNextView ()

/**接收电话号码的lable*/
@property (strong, nonatomic) UILabel *tostLable;
/**背景view*/
@property (strong, nonatomic) UIView *backView;
/**输入验证码的textFiled*/
@property (strong, nonatomic) UITextField *codeTextFiled;
/**分隔lable*/
@property (strong, nonatomic) UILabel *lineLable;
/**计时button*/
@property (strong, nonatomic) UIButton *timeBtn;
/**注册Button*/
@property (strong, nonatomic) UIButton *registeBtn;
/**重新发送Button*/
@property (strong, nonatomic) UIButton *repeatBtn;

@end

@implementation SFNextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLable];
        [self addSubview:self.backView];
        [self addSubview:self.codeTextFiled];
        [self addSubview:self.timeBtn];
        [self addSubview:self.lineLable];
        [self addSubview:self.registeBtn];
        [self addSubview:self.repeatBtn];
    }
    return self;
}

- (void)layoutSubviews {
    __weak typeof(self) weakSelf = self;
    [self.tostLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(weakSelf);
        make.height.equalTo(@35);
        make.centerY.mas_equalTo(weakSelf.tostLable.mas_centerY);
    }];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(-1);
        make.right.offset(1);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.tostLable.mas_bottom);
    }];
    
    [self.codeTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backView.mas_left).offset(15);
        make.right.equalTo(weakSelf.backView.mas_right).offset(SFScreen.width - 200);
        make.top.bottom.equalTo(weakSelf.backView);
        
    }];
    
    [self.timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.top.right.equalTo(weakSelf.backView);
        
    }];
    
    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(1, 30));
        make.centerY.equalTo(weakSelf.backView.mas_centerY);
        make.right.equalTo(weakSelf.timeBtn.mas_left).offset(-1);
    }];
    
    [self.registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@35);
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(weakSelf.backView.mas_bottom).offset(15);
    }];
    
    [self.repeatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.registeBtn.mas_bottom).offset(22);
        make.size.mas_equalTo(CGSizeMake(18, 110));
        make.left.offset(16);
        make.right.offset(-16);
        
    }];
}

#pragma mark - setter and getter
- (UILabel *)tostLable {

    if (!_tostLable) {
        _tostLable = [[UILabel alloc] init];
        _tostLable.text = @"验证码已发送到+86";
        _tostLable.font = [UIFont systemFontOfSize:14];
        _tostLable.textColor = SFColor(82, 82, 82);
    }
    return _tostLable;
}

- (UIView *)backView {

    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.borderColor = SFColor(217, 217, 217).CGColor;
        _backView.layer.borderWidth = 1.0;
    }
    return _backView;
}

- (UITextField *)codeTextFiled {

    if (!_codeTextFiled) {
        _codeTextFiled = [[UITextField alloc] init];
        _codeTextFiled.placeholder = @"请输入验证码";
        _codeTextFiled.textColor = SFColor(201, 201, 201);
        _codeTextFiled.font = [UIFont systemFontOfSize:14];
    }
    return _codeTextFiled;
}

- (UILabel *)lineLable {

    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = SFColor(231, 231, 231);
    }
    return _lineLable;
}

- (UIButton *)timeBtn {

    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setTitle:@"60秒后重试" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:SFColor(150, 150, 150) forState:UIControlStateNormal];
        
    }
    return _timeBtn;
}

- (UIButton *)registeBtn {

    if (!_registeBtn) {
        _registeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registeBtn setTitleColor:SFColor(149, 149, 149) forState:UIControlStateNormal];
        [_registeBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registeBtn.backgroundColor = SFColor(234, 234, 234);
    }
    return _registeBtn;
}

- (UIButton *)repeatBtn {

    if (!_repeatBtn) {
        _repeatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_repeatBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        _repeatBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_repeatBtn setTitleColor:SFColor(210, 210, 210) forState:UIControlStateNormal];
    }
    return _repeatBtn;
}

@end
