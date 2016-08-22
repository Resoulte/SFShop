//
//  SFMyTableView.h
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMyTableView : UITableView

/**退出登录block*/
@property (copy, nonatomic)  void(^existBtnBlock)();

@end
