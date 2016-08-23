//
//  SFNewDealCell.m
//  SFE
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNewDealCell.h"
#import <UIImageView+WebCache.h>

@interface SFNewDealCell ()

// 新品团购
/**国旗*/
@property (strong, nonatomic) UIImageView *countryImage;
/**图片*/
@property (strong, nonatomic) UIImageView *iconImage;
/**标题*/
@property (strong, nonatomic) UILabel *titleLabe;
/**内容*/
@property (strong, nonatomic) UILabel *contentLable;
/**价格*/
@property (strong, nonatomic) UILabel *priceLable;
/**购物车*/
@property (strong, nonatomic) UIButton *buybutton;

@end

@implementation SFNewDealCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.countryImage];
        [self.contentView addSubview:self.titleLabe];
        [self.contentView addSubview:self.contentLable];
        [self.contentView addSubview:self.buybutton];
        [self.contentView addSubview:self.priceLable];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(142, 142));
        make.left.offset(5);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [self.countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.equalTo(weakSelf.iconImage.mas_left).offset(8);
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(8);
    }];
    
    [self.titleLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.height.equalTo(@15);
    }];
    
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabe.mas_bottom).offset(7);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.height.equalTo(@60);
    }];
    
    [self.buybutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(37, 37));
        make.right.equalTo(weakSelf.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
    }];
    
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.right.equalTo(weakSelf.buybutton.mas_left).offset(-20);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-23);
    }];
    

    
}

#pragma mark - setter and getter
- (UIImageView *)countryImage {
    
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
    }
    return _countryImage;
}

- (UIImageView *)iconImage {
    
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}

- (UILabel *)titleLabe {
    
    if (!_titleLabe) {
        _titleLabe = [[UILabel alloc] init];
    }
    return _titleLabe;
}

- (UILabel *)contentLable {
    
    if (!_contentLable) {
        _contentLable = [[UILabel alloc] init];
    }
    return _contentLable;
}

- (UILabel *)priceLable {
    
    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
    }
    return _priceLable;
}

- (UIButton *)buybutton {
    
    if (!_buybutton) {
        _buybutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buybutton setImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:UIControlStateNormal];
    }
    return _buybutton;
}

- (void)setNewsDealItem:(SFNewDealItem *)newsDealItem {
    _newsDealItem =newsDealItem;
    
    self.titleLabe.text = newsDealItem.Title;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:newsDealItem.ImgView] ];
    [self.countryImage sd_setImageWithURL:[NSURL URLWithString:newsDealItem.CountryImg]];
    self.contentLable.text = newsDealItem.GoodsIntro;
    NSString *price = [NSString stringWithFormat:@"¥%@ %@", newsDealItem.DomesticPrice, newsDealItem.Price];
    self.priceLable.text = price;
}
@end
