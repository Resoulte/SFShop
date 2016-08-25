//
//  SFGoodListItem.h
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFGoodListItem : NSObject

/**商品简述*/
@property (copy, nonatomic) NSString *Abbreviation;
/**商品标题*/
@property (copy, nonatomic) NSString *Title;
/**原价格*/
@property (copy, nonatomic) NSString *DomesticPrice;
/**当前价格*/
@property (copy, nonatomic) NSString *Price;
/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;
/**国旗地址*/
@property (copy, nonatomic) NSString *CountryImg;
/**商品图片地址*/
@property (copy, nonatomic) NSString *ImgView;


@end
