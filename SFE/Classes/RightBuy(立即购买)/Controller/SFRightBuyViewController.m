//
//  SFRightBuyViewController.m
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRightBuyViewController.h"
#import "SFAddressView.h"

@interface SFRightBuyViewController ()

/**地址view*/
@property (strong, nonatomic) SFAddressView *addressView;

@end

@implementation SFRightBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.addressView];
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

@end
