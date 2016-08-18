//
//  SFMyMessage.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyMessage.h"

@implementation SFMyMessage

+ (instancetype)messageWithDict:(NSDictionary *)dict {

    SFMyMessage *message = [[SFMyMessage alloc] init];
    [message setValuesForKeysWithDictionary:dict];
    return message;
}

@end
