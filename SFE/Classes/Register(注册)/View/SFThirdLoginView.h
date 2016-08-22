//
//  SFThirdLoginView.h
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^qqLoginBlock)();
typedef void(^wechatLoginBlock)();
typedef void(^weiboLoginBlock)();

@interface SFThirdLoginView : UIView

/**qq登录*/
@property (copy, nonatomic) qqLoginBlock qqLoginBlock;
/**微信登录*/
@property (copy, nonatomic) wechatLoginBlock wechatLoginBlock;
/**微博登录*/
@property (copy, nonatomic) weiboLoginBlock weiboLoginBlock ;

@end
