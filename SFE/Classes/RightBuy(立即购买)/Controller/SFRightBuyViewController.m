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
#import "Order.h"
#import <AlipaySDK/AlipaySDK.h>
#import "DataSigner.h"



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
        _addressView = [[SFAddressView alloc] initWithFrame:CGRectMake(0, 64, SFScreen.width, 80)];
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

/**去支付宝支付*/
- (void)gopayMethod {
    
    NSString *appID = @"2088811244629885";
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMtWTF/ZNrWvKTVBnKQnamD1GgTvGjm7gLxgWe9pGos/rLYZXQnAuNkQRPgnITwtCOclWMYHvTyufYWoCQgl6mYmL4UEccFwk7ehf8c+pJ3Tm0XTS6//ohcR/B8qD+jiQOxpU33A+UoplCRohlZv5Z2S+0xt/I5QLi0Nb8J0xY3AgMBAAECgYBONJmMr9MlrO2hzonq1e+WwPAXU/Emx4GPRF3px59du/HCj9r3E7qgisdYw6Nz0U8dBd0F++BLngbNiHtafoTGCO6bKJY6Wdiv7zbhC1YuOKAvFbPRKj6pDShZ0lGbIubE6fBtZ5u6nSwh6tr28Y7TLkfX04cYlHFq7u779EBIgQJBAOGg/rRROUwrpf9bMV8z7KMOFlE7EXtg/o0tinJYBd+lvtfAkdpgzQ5JOxfywmfcI33U+RXyFoMLSTuBtfDTb6cCQQDdcwJB/FfBb5HTrOMqshUXsEukT+SWs2vS6TKAlvyd2XGwJ/fP9mdyxtinTNJRpGM0uI+gF6EHfj6blbViMHbxAkA4Pbk/mT9/DSJDlKep43eI7WoCtYaWCodpCYEJH4fXR6laflXc6WQzu21PeuOan/T42K1+GuohoB6RBrQjY5DhAkEAwppmyYXvuFVLWTD9EHAeiQqr7mEnCCf0AQxdDROiOzTy61K0O1TV489KZPrleEl1xMbLsGwTXnpamm8dToQ4gQJBANjWYtsLAxbxgNF9zAKj+B38r0AInsxbY6TV77iejVGhL9wbnJtN5QHQ6yXTlvS6Cb5hmPDcbsM0rSrCyXpD38o=";
    //partner和seller获取失败,提示
    if ([appID length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少appId或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order* order = [Order new];
    
    // NOTE: app_id设置
    order.app_id = appID;
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 参数编码格式
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type设置
    order.sign_type = @"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [BizContent new];
    order.biz_content.body = @"支付宝信息描述";
    order.biz_content.subject = @"支付宝支付信息标题";
    order.biz_content.out_trade_no = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = self.rightBuyItem.GoodsPrice; //商品价格
    
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderInfo];
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"SFE";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
        
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

@end
