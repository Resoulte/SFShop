//
//  SFBrandDealCell.m
//  SFE
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBrandDealCell.h"


@interface SFBrandDealCell ()

/**品牌展示图片*/
@property (strong, nonatomic) UIImageView *brandImage;

@end


@implementation SFBrandDealCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.brandImage];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.brandImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}

#pragma mark - setter and getter 
- (UIImageView *)brandImage {

    if (!_brandImage) {
        _brandImage = [[UIImageView alloc] init];
    }
    return _brandImage;
}

- (void)setBrandItem:(SFBrandDealItem *)brandItem {
    _brandItem = brandItem;
    [self.brandImage sd_setImageWithURL:[NSURL URLWithString:brandItem.ImgView]];
}
@end
