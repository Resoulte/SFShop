//
//  SFBuyShopCell.h
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBuyShopItem.h"

@interface SFBuyShopCell : UITableViewCell

/**商品模型*/
@property (strong, nonatomic) SFBuyShopItem *shopItem;

/**是否选中*/
@property (strong, nonatomic)   UIButton *isSelectBtn;
/**增加商品个数*/
@property (strong, nonatomic)   UIButton *addButton;
/**减少商品个数*/
@property (strong, nonatomic)   UIButton *cutButton;

@end
