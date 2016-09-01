//
//  SFRightBuyViewController.m
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRightBuyViewController.h"
#import "SFAddressView.h"
#import "SFRightTableView.h"

@interface SFRightBuyViewController ()

/**地址view*/
@property (strong, nonatomic) SFAddressView *addressView;
/**支付view*/
@property (strong, nonatomic) SFRightTableView *rightTableView;
/**支付btn*/
@property (strong, nonatomic) UIButton *payButton;


@end

@implementation SFRightBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.addressView];
    [self.view addSubview:self.rightTableView];
    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.addressView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
    
    [self.view addSubview:self.payButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter and getter
- (SFAddressView *)addressView {

    if (!_addressView) {
        _addressView = [[SFAddressView alloc] initWithFrame:CGRectMake(0, 80, SFScreen.width, 80)];
    }
    return _addressView;
}

- (SFRightTableView *)rightTableView {

    if (!_rightTableView) {
        _rightTableView = [[SFRightTableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        self.rightTableView.orderArray = self.rightBuyItem.GoodsList;
    }
    
    return _rightTableView;
}

- (UIButton *)payButton {

    if (!_payButton) {
        _payButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _payButton.backgroundColor = [UIColor orangeColor];
        [_payButton setTitle:@"立即支付" forState:(UIControlStateNormal)];
        _payButton.frame = CGRectMake(SFScreen.width-100, SFScreen.height-50, 90, 40);
        
        [_payButton addTarget:self action:@selector(gopayMethod) forControlEvents:UIControlEventTouchUpInside];

    }
    return _payButton;
}

- (void)gopayMethod {

    
}

@end
