//
//  SFBottomButtonView.h
//  SFE
//
//  Created by ma c on 16/8/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFBottomButtonView : UIView

/**加入购物车的block*/
@property (copy, nonatomic) void(^addBuyShopBlock)();

@end
