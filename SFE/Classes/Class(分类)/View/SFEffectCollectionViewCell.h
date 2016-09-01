//
//  SFEffectCollectionViewCell.h
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFClassEffectItem.h"

@interface SFEffectCollectionViewCell : UICollectionViewCell

/**功效模型*/
@property (strong, nonatomic) SFClassEffectItem *effectItem;

@end
