//
//  SFDetailTopImage.m
//  SFE
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDetailTopImage.h"

@interface SFDetailTopImage ()

/**商品轮播图片*/
@property (strong, nonatomic) SDCycleScrollView *cycleScrollView;
/**多少人购买*/
@property (strong, nonatomic) UILabel *buyCount;

@end

@implementation SFDetailTopImage


#pragma mark - 初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cycleScrollView];
        [self addSubview:self.buyCount];
        [self setupContrains];
    }
    return self;
}

- (void)setupContrains {

    __weak typeof(self) weakSelf = self;
    [weakSelf.buyCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(11);
        make.size.mas_equalTo(CGSizeMake(90, 22));
        make.bottom.equalTo(weakSelf.cycleScrollView.mas_bottom).offset(-30);
    }];
}
#pragma mark - setter and getter
- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    _cycleScrollView.imageURLStringsGroup = imageArray;
}

- (void)setBuyNum:(NSString *)buyNum {
    _buyNum = buyNum;
    _buyCount.text = buyNum;
}

- (SDCycleScrollView *)cycleScrollView {

    if (!_cycleScrollView) {
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SFScreen.width, 230) delegate:nil placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        _cycleScrollView.pageControlAliment =SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    }
    return _cycleScrollView;
}

- (UILabel *)buyCount {
    
    if (!_buyCount) {
        _buyCount = [[UILabel alloc] init];
        _buyCount.layer.cornerRadius = 11.0;
        _buyCount.layer.masksToBounds = YES;
        _buyCount.textAlignment = NSTextAlignmentCenter;
        _buyCount.font = [UIFont systemFontOfSize:11.0];
        _buyCount.textColor = [UIColor whiteColor];
        _buyCount.backgroundColor = SFColor(255, 76, 33);
        _buyCount.text = @"1000人已购买";
    }
    return _buyCount;
}
@end
