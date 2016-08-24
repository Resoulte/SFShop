//
//  SFDetailContentView.h
//  SFE
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFDetailListItem.h"

@interface SFDetailContentView : UIView

/**存放model的数组*/
@property (strong, nonatomic) NSArray *contentItemArray;

/**返回高度height*/
@property (copy, nonatomic) void(^returnContentHeightBlock)(CGFloat height);
@end
