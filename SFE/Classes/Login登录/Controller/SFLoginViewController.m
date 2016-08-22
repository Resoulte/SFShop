//
//  SFLoginViewController.m
//  SFE
//
//  Created by ma c on 16/8/21.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLoginViewController.h"
#import "SFLoginInputView.h"
#import "SFLoginThirdView.h"

@interface SFLoginViewController ()

/**输入view*/
@property (strong, nonatomic) SFLoginInputView *inputView;

/**第三方登录*/
@property (strong, nonatomic) SFLoginThirdView *thirdView;

@end

@implementation SFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.thirdView];
    
    [self setupAllContrains];
}

- (void)setupAllContrains {

    self.edgesForExtendedLayout = 0;
    __weak typeof(self) weakSelf = self;
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@230);
    }];
    
    [self.thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@85);
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.inputView.mas_bottom);
    }];

}

// 登录网络请求
- (void)loginHttpRequest:(NSDictionary *)dict {
    //h"p://123.57.141.249:8080/beautalk/appMember/appLogin.do?LoginName=
    //17721025595&Lpassword=123123
//    登陆名:LoginName
//    密码 :Lpassword 优惠券ID:CouponsId 【可不填】
//    返回参数:Map<String,Object>
//    成功标识:result 【error为登陆失败;返回 数字 表示购物车中商品数量】
//    是否已领取优惠券标识:ReceiveMark 【0:未领取;1:已领取】
    [self getWithPath:@"appMember/appLogin.do" params:dict success:^(id json) {
        //用户不存在
        //密码错误
        //登陆成功
        SFLog(@"appLogin:%@", json);
        if ([json[@"ErrorMessage"] isEqualToString:@"登陆成功"]) {
            [[NSUserDefaults standardUserDefaults] setObject:json forKey:@"isLogin"];
            [self performSelector:@selector(popMyViewController) withObject:nil afterDelay:1.0];
        } else if ([json[@"ErrorMessage"] isEqualToString:@"密码错误"]) {
            [self showTostInView:@"密码错误"];
        } else if ([json[@"ErrorMessage"] isEqualToString:@"用户不存在"]) {
            [self showTostInView:@"用户不存在"];
        } else {
            [self showTostInView:@"登录失败"];
        }
    } failure:^(NSError *error) {
        SFLog(@"appLogin:%@", error);
        
    }];
}

- (void)popMyViewController {

    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - setter and getter 
- (UIView *)inputView {

    if (!_inputView) {
        _inputView = [[SFLoginInputView alloc] init];
//        _inputView.backgroundColor = [UIColor redColor];
        
        __weak typeof(self) weakSelf = self;
        _inputView.loginBlock = ^(NSDictionary *userMessage) {
            [weakSelf loginHttpRequest:userMessage];
        };
    }
    return _inputView;
}

- (SFLoginThirdView *)thirdView {

    if (!_thirdView) {
        _thirdView = [[SFLoginThirdView alloc] init];
//        _thirdView.backgroundColor = [UIColor whiteColor]; 
    }
    return _thirdView;
}
@end
