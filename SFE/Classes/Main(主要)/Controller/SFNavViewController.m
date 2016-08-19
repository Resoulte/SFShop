//
//  SFNavViewController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNavViewController.h"

@interface SFNavViewController ()

@end

@implementation SFNavViewController

+ (void)initialize {

    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [navBar setTitleTextAttributes:dict];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriRenderImage:@"详情界面返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {

    [self popViewControllerAnimated:YES];
}
@end
