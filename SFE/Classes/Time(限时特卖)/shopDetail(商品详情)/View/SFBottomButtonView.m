//
//  SFBottomButtonView.m
//  SFE
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBottomButtonView.h"

@interface SFBottomButtonView ()

/**购物车按钮*/
@property (strong, nonatomic) UIButton *shopCarBtn;
/**加入购物车按钮*/
@property (strong, nonatomic) UIButton *addShopBtn;
/**立即购买按钮*/
@property (strong, nonatomic) UIButton *buyNowBtn;
/**背景图片*/
@property (strong, nonatomic) UIImageView *backImage;

@end

@implementation SFBottomButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImage];
        [self addSubview:self.shopCarBtn];
        [self addSubview:self.addShopBtn];
        [self addSubview:self.buyNowBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof (self) weakSelf = self;
    [_backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_shopCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(26, 26));
        make.left.equalTo(weakSelf.mas_left).offset(13);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_addShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@70);
        make.left.equalTo(weakSelf.shopCarBtn.mas_right).offset(35);
        make.right.equalTo(weakSelf.buyNowBtn.mas_left).offset(30);
    }];
    
    [_buyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@70);
        make.width.equalTo(weakSelf.addShopBtn.mas_width);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
    }];

}


#pragma mark - setter and getter
- (UIButton *)shopCarBtn {

    if (!_shopCarBtn) {
        _shopCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shopCarBtn setImage:[UIImage imageNamed:@"详情界面购物车按钮"] forState:(UIControlStateNormal)];
    }
    return _shopCarBtn;
}

- (UIButton *)addShopBtn {

    if (!_addShopBtn) {
        _addShopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addShopBtn setImage:[UIImage imageNamed:@"详情界面加入购物车按钮"] forState:(UIControlStateNormal)];
        
        [_addShopBtn addTarget:self action:@selector(addShopCar) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addShopBtn;
}

- (UIButton *)buyNowBtn {

    if (!_buyNowBtn) {
        _buyNowBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_buyNowBtn setImage: [UIImage imageNamed:@"详情界面立即购买按钮"] forState:(UIControlStateNormal)];
    }
    return _buyNowBtn;
}

- (UIImageView *)backImage {
    
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_back"]];
    }
    return _backImage;
}

- (void)addShopCar {
    
    if (_addBuyShopBlock) {
        _addBuyShopBlock();
    }
}
@end
