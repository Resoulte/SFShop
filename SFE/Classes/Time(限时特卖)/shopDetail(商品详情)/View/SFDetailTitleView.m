//
//  SFDetailTitleView.m
//  SFE
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDetailTitleView.h"

@interface SFDetailTitleView ()


/**标题lable*/
@property (strong, nonatomic) UILabel *titleLable;
/**价格*/
@property (strong, nonatomic) UILabel *priceLable;
/**分隔线*/
@property (strong, nonatomic) UILabel *lineLable;
/**内容详情*/
@property (strong, nonatomic) UILabel *contentLable;
/**商家图标*/
@property (strong, nonatomic) UIImageView *shopImage;
/**商家名*/
@property (strong, nonatomic) UILabel *shopName;
/**国旗*/
@property (strong, nonatomic) UIImageView *countryImage;
/**国家名*/
@property (strong, nonatomic) UILabel *countryName;
/**跳转按钮*/
@property (strong, nonatomic) UIButton *nextBtn;
/**下一步箭头*/
@property (strong, nonatomic) UIImageView *nextImage;
/**去往商家北京按钮图标*/
@property (strong, nonatomic) UIView *backView;
/**图文详情*/
@property (strong, nonatomic) UILabel *tostLable;
/**详情下分隔线*/
@property (strong, nonatomic) UILabel *iconlineLable;



@end

@implementation SFDetailTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLable];
        [self addSubview:self.priceLable];
        [self addSubview:self.lineLable];
        [self addSubview:self.contentLable];
        [self addSubview:self.backView];
        [self addSubview:self.nextBtn];
        [self addSubview:self.shopImage];
        [self addSubview:self.shopName];
        [self addSubview:self.countryImage];
        [self addSubview:self.countryName];
        [self addSubview:self.nextImage];
        [self addSubview:self.tostLable];
        [self addSubview:self.iconlineLable];
        
        [self layoutAllSubviews];
    }
    return self;
}

- (void)layoutAllSubviews {
    
    __weak typeof(self) weakSelf = self;
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@40);
    }];
    
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLable.mas_bottom).offset(25);
        make.left.right.equalTo(weakSelf);
    }];

    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.priceLable.mas_bottom).offset(26);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@1);
    }];

    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(weakSelf.lineLable.mas_bottom).offset(20);
    }];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.top.equalTo(weakSelf.contentLable.mas_bottom).offset(18);
        make.height.equalTo(@100);
    }];

    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.backView).with.insets(UIEdgeInsetsMake(10, 0, 10, 0));
    }];

    [self.shopImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nextBtn.mas_left).offset(16);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerY.equalTo(weakSelf.nextBtn.mas_centerY);
    }];

    [self.shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.shopImage.mas_top).offset(5);
        make.left.equalTo(weakSelf.shopImage.mas_right).offset(16);
        make.height.equalTo(@12);
        make.right.equalTo(weakSelf.mas_right).offset(-120);
    }];
    
    [self.countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 13));
        make.left.equalTo(weakSelf.shopImage.mas_right).offset(15);
        make.bottom.equalTo(weakSelf.shopImage.mas_bottom).offset(-5);
    }];
    
    [self.countryName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.countryImage.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(70, 15));
//        make.top.equalTo(weakSelf.countryImage.mas_top);
        make.centerY.equalTo(weakSelf.countryImage.mas_centerY);
        
    }];

    [self.nextImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 15));
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.shopImage.mas_centerY);
    }];
    
    [self.tostLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 50));
        make.top.equalTo(weakSelf.backView.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(16);
    }];
    
    [self.iconlineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tostLable.mas_bottom).offset(-10);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@1);

    }];
    
}


#pragma mark - setter and getter
- (UILabel *)titleLable {

    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont boldSystemFontOfSize:15.0];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.numberOfLines = 0;
        _titleLable.textColor = SFColor(50, 50, 50);
    }
    return _titleLable;
}

- (UILabel *)priceLable {

    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
        _priceLable.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLable;
}

- (UILabel *)lineLable {

    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = SFColor(242, 242, 242);
    }
    return _lineLable;
}

- (UILabel *)contentLable {

    if (!_contentLable) {
        _contentLable = [[UILabel alloc] init];
        _contentLable.font = [UIFont systemFontOfSize:13.0];
        _contentLable.textColor = SFColor(100, 100, 100);
        _contentLable.numberOfLines = 0;
    }
    return _contentLable;
}

- (UILabel *)shopName {

    if (!_shopName) {
        _shopName = [[UILabel alloc] init];
        _shopName.font = [UIFont systemFontOfSize:12.0];
    }
    return _shopName;
}

- (UIImageView *)shopImage {

    if (!_shopImage) {
        _shopImage = [[UIImageView alloc] init];
    }
    return _shopImage;
}

- (UILabel *)countryName {

    if (!_countryName) {
        _countryName = [[UILabel alloc] init];
        _countryName.font = [UIFont systemFontOfSize:12.0];
    }
    return _countryName;
}

- (UIImageView *)countryImage {
    
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
    }
    return _countryImage;
}

- (UIButton *)nextBtn {

    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.backgroundColor = [UIColor whiteColor];
    }
    return _nextBtn;
}

- (UIImageView *)nextImage {
    
    if (!_nextImage) {
        _nextImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下一步"]];
    }
    return _nextImage;
}

- (UIView *)backView {

    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = SFMainColor;
    }
    return _backView;
}

- (UILabel *)tostLable {

    if (!_tostLable) {
        _tostLable = [[UILabel alloc] init];
        _tostLable.text = @"图文详情";
        _tostLable.font = [UIFont systemFontOfSize:14.0];
        
    }
    return _tostLable;
}

- (UILabel *)iconlineLable {

    if (!_iconlineLable) {
        _iconlineLable = [[UILabel alloc] init];
        _iconlineLable.backgroundColor = SFMainColor;
    }
    return _iconlineLable;
}

- (void)setTitleItem:(SFDetailTitleItem *)titleItem {

    _titleItem = titleItem;
    
    _titleLable.text = titleItem.Abbreviation;
    [_tostLable sizeToFit];
    CGFloat titleHeight = [titleItem.Abbreviation boundingRectWithSize:CGSizeMake(SFScreen.width - 60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:16.0]} context:nil].size.height;
    [self.titleLable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(titleHeight));
    }];
    
    _priceLable.text = [NSString stringWithFormat:@"%@ %@ (%@)折", titleItem.Price, titleItem.OriginalPrice, titleItem.Discount];
    
    _contentLable.text = titleItem.GoodsIntro;
    CGFloat contentHeight = [titleItem.GoodsIntro boundingRectWithSize:CGSizeMake(SFScreen.width- 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0]} context:nil].size.height;
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(contentHeight));
    }];
    
    [_shopImage sd_setImageWithURL:[NSURL URLWithString:titleItem.ShopImage]];
    _shopName.text = titleItem.BrandCNName;
//    _countryImage sd_setImageWithURL:[NSURL URLWithString:<#(nonnull NSString *)#>]
    _countryName.text = titleItem.CountryName;
    
    if (_returnHeightBlock) {
        _returnHeightBlock(260.0 + titleHeight + contentHeight);
    }
}
@end
