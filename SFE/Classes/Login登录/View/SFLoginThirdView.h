//
//  SFLoginThirdView.h
//  SFE
//
//  Created by ma c on 16/8/21.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFLoginThirdView : UIView

/**qqblock*/
@property (copy, nonatomic) void(^qqLoginBlock)();
/**微信block*/
@property (copy, nonatomic) void(^wechatBlock)();
/**微博block*/
@property (copy, nonatomic) void(^weiboBlock)();
@end
