//
//  SFEffectCollectionViewCell.m
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFEffectCollectionViewCell.h"

@interface SFEffectCollectionViewCell ()

/**标题*/
@property (strong, nonatomic)   UILabel *iconTitle;
/**图标*/
@property (strong, nonatomic)   UIImageView *iconImage;

@end

@implementation SFEffectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.iconTitle];

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 20, 30, 20));
    }];
    [_iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImage.mas_bottom);
        make.bottom.left.right.equalTo(weakSelf);
    }];

}


#pragma mark - setter and getter
- (void)setEffectItem:(SFClassEffectItem *)effectItem {

//    _effectItem = effectItem;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:effectItem.ImgView]];
    self.iconTitle.text = effectItem.GoodsTypeName;
}

- (UILabel *)iconTitle{
    if (!_iconTitle) {
        _iconTitle = [[UILabel alloc]init];
        _iconTitle.textAlignment = NSTextAlignmentCenter;
        _iconTitle.font = [UIFont systemFontOfSize:12.0];
        _iconTitle.textColor = [UIColor blackColor];
    }
    return _iconTitle;
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}
@end
