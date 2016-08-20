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
        
    }
    return _thirdLoginView;
}
@end
