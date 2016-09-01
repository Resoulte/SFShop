//
//  SFBrandCollectionViewCell.h
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFClassBrandItem.h"


@interface SFBrandCollectionViewCell : UICollectionViewCell

/**品牌模型*/
@property (strong, nonatomic) SFClassBrandItem *brandItem;

@end
