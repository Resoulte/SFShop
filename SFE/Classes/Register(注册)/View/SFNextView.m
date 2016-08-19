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
        [self GCDTime];
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
        make.size.mas_equalTo(CGSizeMake(130, 18));
        make.top.equalTo(weakSelf.registeBtn.mas_bottom).offset(22);
        make.centerX.equalTo(weakSelf.mas_centerX);
        
    }];
}

#pragma mark - setter and getter
- (UILabel *)tostLable {

    if (!_tostLable) {
        _tostLable = [[UILabel alloc] init];
        _tostLable.font = [UIFont systemFontOfSize:14];
        _tostLable.attributedText = [self makeAtributesTostLable];
//        _tostLable.text = @"验证码已发送到 +86";
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
        [_codeTextFiled addTarget:self action:@selector(changValue:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return _codeTextFiled;
}

- (void)changValue:(UITextField *)textFiled {
    
    if (textFiled.text.length == 6) {
        _registeBtn.userInteractionEnabled = YES;
        _registeBtn.backgroundColor = SFColor(0, 183, 239);
    } else {
        _registeBtn.userInteractionEnabled = NO;
        _registeBtn.backgroundColor = SFColor(234, 234, 234);
    }
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
        [_timeBtn setTitleColor:SFColor(150, 150, 150) forState:UIControlStateNormal];
//        [_timeBtn setTitle:@"60秒后重试" forState:UIControlStateNormal];
        [_timeBtn addTarget:self action:@selector(GCDTime) forControlEvents:UIControlEventTouchUpInside];
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
        [_repeatBtn addTarget:self action:@selector(GCDTime) forControlEvents:UIControlEventTouchUpInside];
    }
    return _repeatBtn;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {

    _phoneNumber = phoneNumber;
    _tostLable.attributedText = [self makeAtributesTostLable];
}

#pragma mark - tostLable富文本
- (NSMutableAttributedString *)makeAtributesTostLable {
    
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"验证码已发送到" attributes:@{NSForegroundColorAttributeName : SFColor(150, 150, 150)}];
    
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" +86%@", _phoneNumber] attributes:@{NSForegroundColorAttributeName : SFColor(0, 189, 240)}];
    
    [string1 insertAttributedString:string2 atIndex:string1.length];
    
    return string1;
}

#pragma mark - timeBtn富文本
- (NSMutableAttributedString *)makeAttributesTimeButton:(NSInteger)time {

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%zd", time] attributes:@{NSForegroundColorAttributeName : SFColor(0, 189, 240)}];
    
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"秒后重试" attributes:@{NSForegroundColorAttributeName : SFColor(149, 149, 149)}];
    
    [string insertAttributedString:string1 atIndex:string.length];
    
    return string;
}

- (void)GCDTime {
    
    __block NSInteger time = 5;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
       
        if (time < 1) {
            
            dispatch_source_cancel(timer);
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"重新发送" attributes:@{NSForegroundColorAttributeName : SFColor(0, 189, 240)}];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _timeBtn.userInteractionEnabled = YES;
                _repeatBtn.userInteractionEnabled = YES;
                [_repeatBtn setTitleColor:SFColor(0, 189, 240) forState:UIControlStateNormal];
                [_timeBtn setAttributedTitle:string forState:UIControlStateNormal];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                _timeBtn.userInteractionEnabled = NO;
                _repeatBtn.userInteractionEnabled = NO;
                [_timeBtn setAttributedTitle:[self makeAttributesTimeButton:time] forState:UIControlStateNormal];
            });
        
            time --;
        }
    });
    dispatch_resume(timer);
}

@end
