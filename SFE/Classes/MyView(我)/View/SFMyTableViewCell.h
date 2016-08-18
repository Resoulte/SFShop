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

/**message模型*/
//@property (strong, nonatomic) SFMyMessage *message;

/**cell的资源*/
@property (strong, nonatomic) NSDictionary *sourceDic;

@end
