//
//  SFRegisterViewController.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRegisterViewController.h"
#import "SFNextViewController.h"
#import "SFInputView.h"
#import "SFThirdLoginView.h"
#import <UMSocial.h>



@interface SFRegisterViewController ()

/**注册输入view*/
@property (strong, nonatomic) SFInputView *inputView;
/**第三方view*/
@property (strong, nonatomic) SFThirdLoginView *thirdLoginView;

@end

@implementation SFRegisterViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    self.view.backgroundColor = SFMainColor;
    self.edgesForExtendedLayout = 0;
    
    [self setupAllChildView];
    
   }

- (void)setupAllChildView {
    
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.thirdLoginView];
    
    [self setupAllConstrains];
}

- (void)setupAllConstrains {

    __weak typeof(self) weakSelf = self;
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@230);
        make.top.left.right.equalTo(weakSelf.view);
    }];
    
    [self.thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@85);
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.inputView.mas_bottom);
    }];
}
#pragma mark - setter and getter
- (UIView *)inputView {

    if (!_inputView) {
        _inputView = [[SFInputView alloc] init];
//        _inputView.backgroundColor = [UIColor redColor];
        
        // 下一步跳转
        __weak typeof(self) weakSelf = self;
        _inputView.nextButttonBlock = ^(NSDictionary *dict) {
            
            SFNextViewController *next = [[SFNextViewController alloc] init];
            next.userMessageDict = dict;
            [weakSelf.navigationController pushViewController:next animated:YES];
        };
        
        
    }
    return _inputView;
}

- (SFThirdLoginView *)thirdLoginView {

    if (!_thirdLoginView) {
        _thirdLoginView = [[SFThirdLoginView alloc] init];
//        _thirdLoginView.backgroundColor = [UIColor redColor];
        
        // 第三方登录
        __weak typeof(self) weakSelf = self;
//        [self weiboLogin];
//        [self weichatLogin];
        
        _thirdLoginView.qqLoginBlock = ^() {
            [weakSelf qqLogin];
        };

        // 微信
        _thirdLoginView.wechatLoginBlock = ^() {
            [weakSelf weichatLogin];
        };
        
        // 微博
        _thirdLoginView.weiboLoginBlock = ^() {
        
            [weakSelf weiboLogin];
        };
        
        }
    return _thirdLoginView;
}

- (void)qqLogin {
    
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            //          获取微博用户名、uid、token等
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                //            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                
            }});

}

- (void)weichatLogin {
    
    __weak typeof(self) weakSelf = self;
    _thirdLoginView.wechatLoginBlock = ^() {
        
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
        
        snsPlatform.loginClickHandler(weakSelf,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                //            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            }
            
        });

    
    };
    
    
}

- (void)weiboLogin {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];

    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            //            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}
@end
