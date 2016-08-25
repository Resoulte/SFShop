//
//  SFDetailContentView.m
//  SFE
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDetailContentView.h"
#import "SFDetailListItem.h"

@implementation SFDetailContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setContentItemArray:(NSArray *)contentItemArray {
    
    _contentItemArray = contentItemArray;
    CGFloat textHeight = 0;
    for (SFDetailListItem *item in contentItemArray) {
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(15, textHeight, 60, 12)];
        titleLable.font = [UIFont systemFontOfSize:12];
        titleLable.text = [NSString stringWithFormat:@"%@:", item.Title];
        [self addSubview:titleLable];
        
        CGFloat height = [item.Value boundingRectWithSize:CGSizeMake(SFScreen.width - 190, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(75, textHeight, SFScreen.width-190, height)];
        contentLable.font = [UIFont systemFontOfSize:12];
        contentLable.text = item.Value;
        contentLable.numberOfLines = 0;
        [self addSubview:contentLable];
        
        textHeight = textHeight + height + 15;
        
    }
    
    if (_returnContentHeightBlock) {
        _returnContentHeightBlock(textHeight);
    }
    
}

@end
