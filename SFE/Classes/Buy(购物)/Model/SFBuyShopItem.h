//
//  SFBuyShopItem.h
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFBuyShopItem : NSObject

/**商品名字*/
@property (copy, nonatomic) NSString *Abbreviation;
/**价格*/
@property (copy, nonatomic) NSString *Price;
/**商品图片*/
@property (copy, nonatomic) NSString *ImgView;
/**商品个数*/
@property (copy, nonatomic) NSString *GoodsCount;

// 自己添加的，用来判断是否选中该商品
/**判断是否选中该商品*/
@property (assign, nonatomic) BOOL isSelected;

@end
