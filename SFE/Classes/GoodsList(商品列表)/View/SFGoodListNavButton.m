//
//  SFGoodListNavButton.m
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFGoodListNavButton.h"

@interface SFGoodListNavButton ()

/**热门*/
@property (strong, nonatomic)  UIButton *hostBtn;
/**价格*/
@property (strong, nonatomic) UIButton *priceBtn;
/**好评*/
@property (strong, nonatomic) UIButton *goodBtn;
/**新品*/
@property (strong, nonatomic) UIButton *newsBtn;
/**下划线*/
@property (strong, nonatomic) UILabel *lineLable;
/**之前选中的button*/
@property (strong, nonatomic) UIButton *beforeBtn;

@end

@implementation SFGoodListNavButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.hostBtn];
        [self addSubview:self.priceBtn];
        [self addSubview:self.goodBtn];
        [self addSubview:self.newsBtn];
        [self addSubview:self.lineLable];
        
        self.beforeBtn = self.hostBtn;
        
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    
    __weak typeof(self) weakSelf = self;
    [self.hostBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(weakSelf);
        make.width.equalTo(@(SFScreen.width / 4));
    }];
    
    [self.priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.width.equalTo(@(SFScreen.width / 4));
        make.left.equalTo(weakSelf.hostBtn.mas_right);
    }];
    
    [self.goodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.width.equalTo(@(SFScreen.width / 4));
        make.left.equalTo(weakSelf.priceBtn.mas_right);
    }];
    
    [self.newsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.width.equalTo(@(SFScreen.width / 4));
        make.left.equalTo(weakSelf.goodBtn.mas_right);
    }];
    
    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(40, 2));
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.centerX.equalTo(weakSelf.hostBtn.mas_centerX);
    }];
}

- (void)fourBtnMethod:(UIButton *)selectedBtn {
    selectedBtn.selected = YES;
    self.beforeBtn.selected = NO;
    self.beforeBtn = selectedBtn;
    
    __weak typeof(self) weakSelf = self;
    [self.lineLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(40, 2));
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.centerX.equalTo(selectedBtn.mas_centerX);

    }];
    
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
    
}

#pragma mark - setter and getter
- (UIButton *)hostBtn {

    if (!_hostBtn) {
        _hostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hostBtn setTitle:@"热门" forState:UIControlStateNormal];
        [_hostBtn setTitleColor:SFColor(173, 173, 173) forState:UIControlStateNormal];
        [_hostBtn setTitleColor:SFColor(51, 203, 243) forState:UIControlStateSelected];
        _hostBtn.selected = YES;
        [_hostBtn addTarget:self action:@selector(fourBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _hostBtn;
}

- (UIButton *)priceBtn {

    if (!_priceBtn) {
        _priceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        [_priceBtn setTitleColor:SFColor(173, 173, 173) forState:UIControlStateNormal];
        [_priceBtn setTitleColor:SFColor(51, 203, 243) forState:UIControlStateSelected];
        _priceBtn.selected = NO;
        [_priceBtn addTarget:self action:@selector(fourBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceBtn;
}

- (UIButton *)goodBtn {

    if (!_goodBtn) {
        _goodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goodBtn setTitle:@"好评" forState:UIControlStateNormal];
        [_goodBtn setTitleColor:SFColor(173, 173, 173) forState:UIControlStateNormal];
        [_goodBtn setTitleColor:SFColor(51, 203, 243) forState:UIControlStateSelected];
        _goodBtn.selected = NO;
        [_goodBtn addTarget:self action:@selector(fourBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goodBtn;
}

- (UIButton *)newsBtn {

    if (!_newsBtn) {
        _newsBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_newsBtn setTitle:@"新品" forState:UIControlStateNormal];
        [_newsBtn setTitleColor:SFColor(173, 173, 173) forState:UIControlStateNormal];
        [_newsBtn setTitleColor:SFColor(51, 203, 243) forState:UIControlStateSelected];
        _newsBtn.selected = NO;
        [_newsBtn addTarget:self action:@selector(fourBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _newsBtn;
}

- (UILabel *)lineLable {

    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = SFColor(0, 181, 239);
    }
    return _lineLable;
}
@end
