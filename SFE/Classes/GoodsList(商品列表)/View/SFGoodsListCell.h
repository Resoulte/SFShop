//
//  SFGoodsListCell.h
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFGoodListItem.h"

@interface SFGoodsListCell : UICollectionViewCell
/**list的model*/
@property (strong, nonatomic) SFGoodListItem *listItem;

@end
