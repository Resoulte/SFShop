//
//  SFRightTableViewCell.h
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFGoodsListItem.h"

@interface SFRightTableViewCell : UITableViewCell

/**商品模型*/
@property (strong, nonatomic) SFGoodsListItem *listItem;

@end
