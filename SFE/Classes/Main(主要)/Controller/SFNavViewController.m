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


@end
