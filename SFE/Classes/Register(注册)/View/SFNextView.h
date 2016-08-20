//
//  SFNextView.h
//  SFE
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^repeatTimeBtnBlock)();
typedef void(^registerMethodBlock)(NSString *codeText);

@interface SFNextView : UIView
/**记录手机号*/
@property (copy, nonatomic) NSString *phoneNumber;


/**重新获得验证码*/
@property (copy, nonatomic) repeatTimeBtnBlock repeatTimeBtnBlock;
/**注册按钮的回调方法*/
@property (copy, nonatomic) registerMethodBlock registerMethodBlock;

/**
 *  设置倒计时方法开启
 */
- (void)GCDTime;

@end
