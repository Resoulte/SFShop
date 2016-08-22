//
//  SFLoginInputView.h
//  SFE
//
//  Created by ma c on 16/8/21.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^loginBlock)(NSDictionary *userMessage);
@interface SFLoginInputView : UIView

/**登录Block*/
@property (copy, nonatomic) loginBlock loginBlock;

@end
