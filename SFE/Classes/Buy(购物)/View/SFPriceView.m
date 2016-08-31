//
//  SFPriceView.m
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFPriceView.h"

@interface SFPriceView ()
/**全场包邮*/
@property (strong, nonatomic)   UILabel *allLabel;
/**支付btn*/
@property (strong, nonatomic)   UIButton *goPayButton;
@end

@implementation SFPriceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.priceLabel];
        [self addSubview:self.allLabel];
        [self addSubview:self.goPayButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof (self) weakSelf = self;
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(7);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.height.equalTo(@17);
        make.right.equalTo(weakSelf.goPayButton.mas_left).offset(-20);
    }];
    
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.priceLabel.mas_bottom).offset(7);
        make.size.mas_equalTo(CGSizeMake(62, 14));
        make.left.equalTo(weakSelf.mas_left).offset(60);
    }];
    
    [_goPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(110, 35));
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
    }];
}

#pragma mark - setter and getter
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 15)];
        _priceLabel.text = @"222";
        _priceLabel.textColor = [UIColor blackColor];
    }
    return _priceLabel;
}

- (UILabel *)allLabel{
    if (!_allLabel) {
        _allLabel = [[UILabel alloc]init];
        _allLabel.text = @"(全场包邮)";
        _allLabel.font = [UIFont systemFontOfSize:13.0];
        _allLabel.textColor = SFColor(87, 87, 87);
    }
    return _allLabel;
}

- (UIButton *)goPayButton{
    if (!_goPayButton) {
        _goPayButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_goPayButton setImage:[UIImage imageNamed:@"购物车界面去结算按钮"] forState:(UIControlStateNormal)];
        [_goPayButton addTarget:self action:@selector(goPayBtnMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _goPayButton;
}

- (void)goPayBtnMethod {

    
}


@end
