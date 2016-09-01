//
//  SFBrandCollectionViewCell.m
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBrandCollectionViewCell.h"

@interface SFBrandCollectionViewCell ()

/**商品图片*/
@property (strong, nonatomic) UIImageView *iconImage;

@end

@implementation SFBrandCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.iconImage];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}


#pragma mark - setter and getter
- (void)setBrandItem:(SFClassBrandItem *)brandItem {
//    _brandItem = brandItem;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:brandItem.ImgView]];
}

- (UIImageView *)iconImageView{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}

@end
