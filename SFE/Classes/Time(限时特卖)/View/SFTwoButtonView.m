//
//  SFTwoButtonView.m
//  SFE
//
//  Created by ma c on 16/8/22.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTwoButtonView.h"

@interface SFTwoButtonView ()


@end

@implementation SFTwoButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.newsDeal];
        [self addSubview:self.brandsDeal];
    }
    return self;
}

- (UIButton *)newsDeal {

    if (!_newsDeal) {
        _newsDeal = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _newsDeal.frame = CGRectMake(0, 0, SFScreen.width / 2, 50);
        
        [_newsDeal setTitle:@"新品团购" forState:UIControlStateNormal];
        
        [_newsDeal setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标"] forState:UIControlStateNormal];
        [_newsDeal setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标未选中"] forState:UIControlStateSelected];
        
        [_newsDeal setTitleColor:SFColor(255, 59, 0) forState:UIControlStateNormal];
        [_newsDeal setTitleColor:SFColor(0, 187, 239) forState:UIControlStateSelected];
        
        [_newsDeal addTarget:self action:@selector(changeTableFrame:) forControlEvents:UIControlEventTouchUpInside];
        
        _newsDeal.selected = YES;
    }
    return _newsDeal;
}

- (UIButton *)brandsDeal {

    if (!_brandsDeal) {
        _brandsDeal = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _brandsDeal.frame = CGRectMake(SFScreen.width / 2, 0, SFScreen.width / 2, 50);
        [_brandsDeal setTitle:@"品牌团购" forState:UIControlStateNormal];
        
        [_brandsDeal setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标选中"] forState:UIControlStateNormal];
        [_brandsDeal setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标"] forState:UIControlStateSelected];
        
        [_brandsDeal setTitleColor:SFColor(255, 59, 0) forState:UIControlStateNormal];
        [_brandsDeal setTitleColor:SFColor(0, 187, 239) forState:UIControlStateSelected];
        
        [_brandsDeal addTarget:self action:@selector(changeTableFrame:) forControlEvents:UIControlEventTouchUpInside];
        
//        _brandsDeal.selected = NO;
    }
    return _brandsDeal;
}

- (void)changeTableFrame:(UIButton *)btn {
    if (_DealBlock) {
        _DealBlock(btn);
    }
    
    
}
@end
