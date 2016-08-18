//
//  SFTabBarController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTabBarController.h"
#import "SFTimeViewController.h"
#import "SFClassViewController.h"
#import "SFBuyViewController.h"
#import "SFMyViewController.h"
#import "UIImage+SFImage.h"
#import "SFNavViewController.h"

@implementation SFTabBarController


+ (void)initialize {

    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor colorWithRed:55  / 255.0 green:184 / 255.0 blue:237 / 255.0 alpha:1]};
    [[UITabBarItem appearance] setTitleTextAttributes:dict forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    
    // 限时抢购
    SFTimeViewController *time = [[SFTimeViewController alloc] init];
    [self viewController:time image:[UIImage imageNamed:@"菜单栏限时特卖按钮未选中状态"] selectedImage:[UIImage imageOriRenderImage:@"菜单栏限时特卖按钮选中状态"] title:@"限时特卖"];
    
    // 分类
    SFClassViewController *class = [[SFClassViewController alloc] init];
    [self viewController:class image:[UIImage imageNamed:@"菜单栏分类按钮未选中状态"] selectedImage:[UIImage imageOriRenderImage:@"菜单栏分类按钮选中状态"] title:@"分类"];
    
    // 购物车
    SFBuyViewController *buy = [[SFBuyViewController alloc] init];
    [self viewController:buy image:[UIImage imageNamed:@"菜单栏购物车按钮未选中状态"] selectedImage:[UIImage imageOriRenderImage:@"菜单栏购物车按钮选中状态"] title:@"购物车"];
    
    // 我的
    SFMyViewController *myView = [[SFMyViewController alloc] init];
    [self viewController:myView image:[UIImage imageNamed:@"菜单栏我的按钮未选中状态"] selectedImage:[UIImage imageOriRenderImage:@"菜单栏我的按钮选中状态"] title:@"我的"];
    
    
}


#pragma mark - 设置tabbarItem
- (void)viewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedIamge title:(NSString *)title {
    
    [viewController.tabBarItem setImage:image];
    [viewController.tabBarItem setSelectedImage:selectedIamge];
    viewController.tabBarItem.title = title;
    viewController.navigationItem.title = title;
    
    SFNavViewController *nav = [[SFNavViewController alloc] initWithRootViewController:viewController];
    
    
    [self addChildViewController:nav];
    
    
}

@end
