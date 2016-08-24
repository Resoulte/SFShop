//
//  SFDetailTitleView.h
//  SFE
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFDetailTitleItem.h"

@interface SFDetailTitleView : UIView

/**存储title的model*/
@property (strong, nonatomic) SFDetailTitleItem *titleItem;
/**返回高度的block*/
@property (copy, nonatomic) void(^returnHeightBlock)(CGFloat height);


@end
