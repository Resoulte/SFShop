//
//  SFNextViewController.m
//  SFE
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 shifei. All rights reserved.
//



#import "SFNextViewController.h"
#import "SFNextView.h"
#import <AFNetworking.h>

@interface SFNextViewController ()

/**下一步view*/
@property (strong, nonatomic) SFNextView *nextView;

@end

@implementation SFNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SFMainColor;
    
    self.title = @"验证手机号";
    
    [self.view addSubview:self.nextView];
    [self constraints];
    
    SFLog(@"用户名和密码：%@", _userMessageDict);
    
//    [self codeRequestHttp];
}
// 验证码网络请求
- (void)codeRequestHttp {

    //URL:http:@"//123.57.141.249:8080/beautalk/appMember/createCode.do“
    //    传入数据:(post请求)
    //    手机号:MemberId 返回参数:Map<String,Object>
    //    成功标识:result
    //
    // 发出网络请求
    NSDictionary *params = @{
                             @"MemberId" : _userMessageDict[@"userName"]
                             };
    
    [SFHttpTools postWithPath:@"appMember/createCode.do" params:params success:^(id json) {
        SFLog(@"%@", json);
        //        if ([json[@"result"] isEqualToString:@"success"]) {
                    [self.nextView GCDTime];
        //        } if ([json[@"result"] isEqualToString:@"TelephoneExistError"]) {
        //            NSLog(@"电话号码已被注册");
        //        } else {
        //            SFLog(@"手机号错误");
        //        }
    } failure:^(NSError *error) {
        SFLog(@"%@", error);
    }];

}

// 注册网络请求
- (void)registerRequestHttp:(NSString *)codeString {

//URL:@"http://123.57.141.249:8080/beautalk/appMember/appRegistraZon.do”
//    传入数据:
//    手机号:LoginName
//    密码 :Lpassword
//    验证码:Code
//    手机号:Telephone
//    返回参数:Map<String,Object>
//    结果:Result【"success" or "error"】
//    示例:{Result:"success"}

    NSDictionary *params = @{
                             @"LoginName" : _userMessageDict[@"userName"],
                             @"Lpassword" : _userMessageDict[@"password"],
                             @"Code" : codeString,
                             @"Telephone" : _userMessageDict[@"userName"]
                             };
    [SFHttpTools getWithPath:@"appMember/appRegistration.do" params:params success:^(id json) {
        SFLog(@"%@", json);
    } failure:^(NSError *error) {
        SFLog(@"%@", error);
    }];
}


- (void)constraints {
    
    self.edgesForExtendedLayout = 0;
    [self.nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
    }];
}

#pragma mark - setter and getter 
- (SFNextView *)nextView {

    if (!_nextView) {
        _nextView = [[SFNextView alloc] init];
//        _nextView.backgroundColor = [UIColor redColor];
        _nextView.phoneNumber = _userMessageDict[@"userName"];
        
        __weak typeof(self) weakSelf = self;
        _nextView.repeatTimeBtnBlock = ^() {
            [weakSelf codeRequestHttp];
        };
        
        _nextView.registerMethodBlock = ^(NSString *codeString) {
            [weakSelf registerRequestHttp:codeString];
        };
    }
    return _nextView;
}
@end
