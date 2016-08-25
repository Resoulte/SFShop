//
//  SFGoodsListViewController.m
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFGoodsListViewController.h"
#import "SFGoodListNavButton.h"

@interface SFGoodsListViewController ()

/**四个导航按钮*/
@property (strong, nonatomic) SFGoodListNavButton *navButtonView;

@end

@implementation SFGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.navButtonView];
}

- (SFGoodListNavButton *)navButtonView {

    if (!_navButtonView) {
        _navButtonView = [[SFGoodListNavButton alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, 30)];
//        _navButtonView.backgroundColor = [UIColor redColor];
    }
    
    return _navButtonView;
}


@end
