//
//  SFNextViewController.m
//  SFE
//
//  Created by ma c on 16/8/19.
//  Copyright © 2016年 shifei. All rights reserved.
//

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
        
    }
    return _nextView;
}
@end
