//
//  SFMyMessage.h
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFMyMessage : NSObject

/**图片*/
@property (copy, nonatomic) NSString * image;
/**文字*/
@property (copy, nonatomic) NSString * title;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

@end
