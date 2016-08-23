//
//  SFDealTableView.h
//  SFE
//
//  Created by ma c on 16/8/22.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFDealTableView : UITableView

/**是否是新品团购*/
@property (assign, nonatomic) BOOL isNewsDeal;
/**存放新品团购数据模型*/
@property (strong, nonatomic) NSArray *newsArray;
/**存放品牌团购数据模型*/
@property (strong, nonatomic) NSArray *brandArray;

/**新品团购点击跳转（根据GoodsID）*/
@property (copy, nonatomic) void(^newTableSelectedBlock)(NSString *GoodsID);

@end
