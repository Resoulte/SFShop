//
//  SFBaseViewController.m
//  SFE
//
//  Created by ma c on 16/8/20.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBaseViewController.h"
#import "SFHttpTools.h"
#import <SVProgressHUD.h>
#import "UIView+Toast.h"

@interface SFBaseViewController ()

@end

@implementation SFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SFMainColor;
    
}

- (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailedBlock)failure {
    
    [SVProgressHUD show];
    
    [SFHttpTools getWithPath:path params:params success:^(id json) {
        [SVProgressHUD dismiss];
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [self showTostInView:@"请检查网络设置"];
        if (failure) {
            failure(error);
        }
    }];
}

- (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailedBlock)failure {
    
    [SVProgressHUD show];
    [SFHttpTools postWithPath:path params:params success:^(id json) {
        [SVProgressHUD dismiss];
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [self showTostInView:@"请检查网络设置"];
        if (failure) {
            failure(error);
        }
    }];
}

- (void)showTostInView:(NSString *)tost {

    [self.view makeToast:tost duration:1.5 position:@"center"];
}

@end
