//
//  SFMyTableViewCell.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyTableViewCell.h"

@interface SFMyTableViewCell ()



@end


@implementation SFMyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftImage];
        [self.contentView addSubview:self.rightImage];
        [self.contentView addSubview:self.leftLable];
        [self.contentView addSubview:self.lineView];
    }
    
    return self;
}

- (void)layoutSubviews {

    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImage.mas_right).offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(140, 15));
    }];
    
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(self.leftImage.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}


#pragma mark - getter and setter 
- (UIImageView *)leftImage {
    
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] init];
    }
    return _leftImage;
}

- (UIImageView *)rightImage {
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下一步"]];
        
    }
    return _rightImage;
}

- (UILabel *)leftLable {
    if (!_leftLable) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.font = [UIFont systemFontOfSize:15.0];
        _leftLable.textColor = [UIColor blackColor];
    }
    return _leftLable;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SFMainColor;
    }
    return _lineView;
}

//- (void)setMessage:(SFMyMessage *)message {
//
//    self.message = message;
//    
//    self.leftImage.image = [UIImage imageNamed:message.image];
//    self.leftLable.text = message.title;
//    
//    
//}
//
//- (void)setSourceDic:(NSDictionary *)sourceDic {
//
//    self.leftLable.text = sourceDic[@"title"];
//    self.leftImage.image = [UIImage imageNamed:sourceDic[@"image"]];
//}
@end
