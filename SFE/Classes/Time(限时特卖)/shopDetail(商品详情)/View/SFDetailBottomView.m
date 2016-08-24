//
//  SFDetailBottomView.m
//  SFE
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDetailBottomView.h"
#import "SFDetailTopImageItem.h"


@implementation SFDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setIconArray:(NSArray *)iconArray {

    _iconArray = iconArray;
    CGFloat imageHeight = 0;
    for (SFDetailTopImageItem *item in iconArray) {
        if ([item.ImgType isEqualToString:@"1"]) {
            NSArray *resolotionArray = [item.Resolution componentsSeparatedByString:@"*"];
            CGFloat height = SFScreen.width / [resolotionArray[0] floatValue] * [resolotionArray[1] floatValue];
            UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, imageHeight, SFScreen.width, height)];
            [iconImage sd_setImageWithURL:[NSURL URLWithString:item.ImgView]];
            [self addSubview:iconImage];
            imageHeight += height;
        }
    }
    
    if (_returnBottomHeightBlock) {
        _returnBottomHeightBlock(imageHeight);
    }

}

@end
