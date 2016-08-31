//
//  SFRightBuyItem.m
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRightBuyItem.h"

@implementation SFRightBuyItem

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"GoodsList": @"SFGoodsListItem",
             @"PayList" : @"SFPayListItem"
             };
}

@end
