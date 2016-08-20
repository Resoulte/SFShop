//
//  SFBaseViewController.h
//  SFE
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^HttpSuccessBlock)(id json);
typedef void(^HttpFailedBlock)(NSError *error);

@interface SFBaseViewController : UIViewController


- (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailedBlock)failure;

- (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailedBlock)failure;

- (void)showTostInView:(NSString *)tost;
@end
