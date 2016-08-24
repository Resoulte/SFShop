//
//  SFDetailBottomView.h
//  SFE
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFDetailBottomView : UIView

/**接收图片数据数组*/
@property (strong, nonatomic) NSArray *iconArray;
/**返回底部图片的高度height*/
@property (copy, nonatomic) void(^returnBottomHeightBlock)(CGFloat height);

@end
