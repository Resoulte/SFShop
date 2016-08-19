//
//  SFNextViewController.m
//  SFE
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 shifei. All rights reserved.
//

// URL：http://123.57.141.249:8080/beautalk/appMember/appRegistration.do
//返回参数：Map<String,Object>
//结果：Result 【"success"  or  "error"】
//示例：{Result："success"}


#import "SFNextViewController.h"
#import "SFNextView.h"

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
        
    }
    return _nextView;
}
@end
