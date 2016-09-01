//
//  SFHeaderCollectionReusableView.m
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFHeaderCollectionReusableView.h"

@interface SFHeaderCollectionReusableView ()

/**标题*/
@property (strong, nonatomic)   UILabel *titleLabel;

@end

@implementation SFHeaderCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 15, 0, 0));
    }];
    
}


#pragma mark - setter and getter
- (void)setTitleLableText:(NSString *)titleLableText {
    _titleLableText = titleLableText;
    self.titleLabel.text = titleLableText;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:13.0];
        _titleLabel.textColor = [UIColor blackColor];
        
    }
    return _titleLabel;
}

@end
