//
//  SFBuyShopItem.h
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFBuyShopItem : NSObject

/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;
/**商品缩略图*/
@property (copy, nonatomic) NSString *ImgView;
/**商品标题*/
@property (copy, nonatomic) NSString *GoodsTitle;
/**商品数量*/
@property (assign, nonatomic) NSInteger GoodsCount;
/**价格*/
@property (assign, nonatomic) CGFloat Price;
/**商品标记*/
@property (copy, nonatomic) NSString *UUID;
/**商品重量*/
@property (assign, nonatomic) CGFloat Weight;

// 自己添加的，用来判断是否选中该商品
/**判断是否选中该商品*/
@property (assign, nonatomic) BOOL isSelected;

@end
