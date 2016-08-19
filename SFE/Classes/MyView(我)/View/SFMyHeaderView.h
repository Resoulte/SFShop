//
//  SFMyHeaderView.h
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^registerBlock)();

@interface SFMyHeaderView : UIView

/**注册block*/
@property (copy, nonatomic) registerBlock registerBlock;
@end
