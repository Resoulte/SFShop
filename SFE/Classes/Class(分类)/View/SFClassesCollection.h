//
//  SFClassesCollection.h
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFClassesCollection : UICollectionView

/**功效*/
@property (strong, nonatomic)   NSArray *effectArray;
/** 经典 */
@property (strong, nonatomic)   NSArray *classicClassArray;
/** 推荐 */
@property (strong, nonatomic)   NSArray *recommendClassArray;


@end
