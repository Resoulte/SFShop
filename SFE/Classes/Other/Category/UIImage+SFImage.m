//
//  UIImage+SFImage.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "UIImage+SFImage.h"

@implementation UIImage (SFImage)

+ (UIImage *)imageOriRenderImage:(NSString *)imageName {

    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
