//
//  SFMyTableViewCell.h
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFMyMessage.h"

@interface SFMyTableViewCell : UITableViewCell

/**左边图片*/
@property (strong, nonatomic)  UIImageView *leftImage;
/**右边图片*/
@property (strong, nonatomic) UIImageView *rightImage;
/**左边文字*/
@property (strong, nonatomic) UILabel *leftLable;
/**分隔线*/
@property (strong, nonatomic) UIView *lineView;


/**message模型*/
//@property (strong, nonatomic) SFMyMessage *message;

/**cell的资源*/
//@property (strong, nonatomic) NSDictionary *sourceDic;

@end
