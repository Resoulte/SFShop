//
//  SFGoodsListCell.m
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFGoodsListCell.h"

@interface SFGoodsListCell ()

/**国旗*/
@property (strong, nonatomic) UIImageView *countryImage;
/**图片*/
@property (strong, nonatomic) UIImageView *iconImage;
/**标题*/
@property (strong, nonatomic) UILabel *titleLabe;
/**价格*/
@property (strong, nonatomic) UILabel *priceLable;

@end

@implementation SFGoodsListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.countryImage];
        [self addSubview:self.titleLabe];
        [self addSubview:self.priceLable];
    }
    return self;
}

- (void)setListItem:(SFGoodListItem *)listItem {
    _listItem = listItem;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:listItem.ImgView]];
    [self.countryImage sd_setImageWithURL:[NSURL URLWithString:listItem.CountryImg]];
    self.titleLabe.text = listItem.Title;
    self.priceLable.text = [NSString stringWithFormat:@"%@ %@", listItem.Price, listItem.DomesticPrice];
     
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.height.mas_equalTo(180);
    }];
    
    
    [self.countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.equalTo(weakSelf.iconImage.mas_left).offset(8);
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(8);
    }];
    
    [self.titleLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImage.mas_bottom).offset(10);
        make.left.offset(11);
        make.right.offset(-11);
    }];
    
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabe.mas_bottom).offset(13);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(13);
        make.left.right.equalTo(weakSelf);
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

- (UILabel *)priceLable {
    
    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
        _priceLable.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLable;
}

@end
