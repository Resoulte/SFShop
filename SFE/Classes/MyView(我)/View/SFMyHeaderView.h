//
//  SFMyHeaderView.h
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^registerBlock)();
typedef void(^loginBlock)();

@interface SFMyHeaderView : UIView

/**注册block*/
@property (copy, nonatomic) registerBlock registerBlock;
/**登录Block*/
@property (copy, nonatomic) loginBlock loginBlock;

// 刷新头部视图
- (void)reloadHeaderView;

@end
