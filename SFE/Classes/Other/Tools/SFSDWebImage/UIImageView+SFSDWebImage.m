//
//  UIImageView+SFSDWebImage.m
//  SFSDWebImage
//
//  Created by ma c on 16/8/4.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "UIImageView+SFSDWebImage.h"


@implementation UIImageView (SFSDWebImage)

- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)imageName {
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)imageName success:(DownImageSuccessBlock)success failed:(DownImageFailedBlock)failed progress:(DownImageProgressBlock)progress {

    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        progress(receivedSize * 1.0 / expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        if (error) {
            failed(error);
        } else {
            self.image = image;
            success(image);
        }
        
    }];
}
@end
