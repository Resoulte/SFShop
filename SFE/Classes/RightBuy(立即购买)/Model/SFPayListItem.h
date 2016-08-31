//
//  SFPayListItem.h
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFPayListItem : NSObject

/**支付方式*/
@property (copy, nonatomic) NSString *Distribution;
/**支付名字*/
@property (copy, nonatomic) NSString *DistributionName;

@end
