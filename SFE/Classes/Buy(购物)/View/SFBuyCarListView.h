//
//  SFBuyCarListView.h
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBuyShopItem.h"

@interface SFBuyCarListView : UITableView

/**接收购物车请求到的数据*/
@property (strong, nonatomic) NSMutableArray *dataArray;

/**修改控制器中的数据*/
@property (copy, nonatomic) void(^changeDataBlock)();

@end
