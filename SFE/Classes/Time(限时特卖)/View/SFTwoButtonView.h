//
//  SFTwoButtonView.h
//  SFE
//
//  Created by ma c on 16/8/22.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFTwoButtonView : UIView

/**新品团购*/
@property (strong, nonatomic) UIButton *newsDeal;
/**品牌团购*/
@property (strong, nonatomic) UIButton *brandsDeal;


/**团购Block*/
@property (copy, nonatomic) void(^DealBlock)(UIButton *btn);

@end
