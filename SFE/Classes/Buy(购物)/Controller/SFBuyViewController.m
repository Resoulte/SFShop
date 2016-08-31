//
//  SFBuyViewController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBuyViewController.h"
#import "SFLoginViewController.h"
#import "SFBuyCarListView.h"
#import "SFBuyShopItem.h"
#import "SFPriceView.h"

@interface SFBuyViewController ()

/**商品展示的TableView*/
@property (strong, nonatomic) SFBuyCarListView *buyCarListView;
/**底部结算的view*/
@property (strong, nonatomic) SFPriceView *priceView;
/**商品列表数组*/
@property (strong, nonatomic) NSArray *goodListArray;
@end

@implementation SFBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.buyCarListView];
    [self.view addSubview:self.priceView];
    
    SFLog(@"%@", self.priceView);
    
    [_priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@55);
        make.bottom.equalTo(self.view.mas_bottom).offset(-46);
    }];

    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self buyRequestHttp];
    
}

/*
 URL:h"p://123.57.141.249:8080/beautalk/appShopCart/appCartGoodsList.do 
 传入数据:
 会员登录名 :MemberId 返回参数:List<Map<String,Object>>
 
 商品对应购物车记录标记:UUID 商品ID:GoodsId 商品缩略图:ImgView 商品标题:GoodsTitle 商品数量:GoodsCount 国旗图标:Country 价格:Price

 */
- (void)buyRequestHttp {
    
     NSDictionary *userDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
    
    if (userDict.count == 0) {
        // 没有登录，跳转到登录界面
        [SVProgressHUD showWithStatus:@"请先登录..."];
        SFLoginViewController *login = [[SFLoginViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
        [SVProgressHUD dismiss];
        
    } else {
   
        NSDictionary *params = @{
                                 @"MemberId" : userDict[@"MemberId"]
                                 };
        [self getWithPath:@"appShopCart/appCartGoodsList.do" params:params success:^(id json) {
            
//            self.goodListArray = [NSMutableArray array];
            self.goodListArray = [NSArray yy_modelArrayWithClass:[SFBuyShopItem class] json:json];
            
            self.buyCarListView.dataArray = self.goodListArray;
            
            [self figureMoney];
            
            [self.buyCarListView reloadData];
            
            //            SFLog(@"%@", json);
//            [json writeToFile:@"/Users/mac/Desktop/json.plist" atomically:YES];
            
        } failure:^(NSError *error) {
            
        }];
    }
}

#pragma mark - getter and getter 
- (SFBuyCarListView *)buyCarListView {
    if (!_buyCarListView) {
        _buyCarListView = [[SFBuyCarListView alloc] initWithFrame:CGRectMake(0, 30, SFScreen.width, SFScreen.height) style:UITableViewStylePlain];
        
        __weak typeof(self) weakSelf = self;
        _buyCarListView.changeDataBlock = ^ {
            [weakSelf figureMoney];
        };
    }
    return _buyCarListView;
    
}

- (SFPriceView *)priceView {
    if (!_priceView) {
        _priceView = [[SFPriceView alloc] init];
    }
    
    return _priceView;

}

/**计算价钱*/
- (void)figureMoney {
    
    CGFloat priceMoney = 0.0;
    for (SFBuyShopItem *shopItem in self.goodListArray) {
        if (shopItem.isSelected) {
            priceMoney += shopItem.GoodsCount * shopItem.Price;
        }
    }
    
    // 要是可变的
    [self priceAttributedText:priceMoney];
    // 改变购物车的数据
    [self changeBuyCarData];
}

- (void)priceAttributedText:(CGFloat)money{
    
    //当前价格(需要手动添加人民币符号)
    NSString *nowPrice = @"合计：";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:nowPrice attributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:12.0]}];
    
    //过去价格
    NSString *oldString = [NSString stringWithFormat:@"¥%.2lf",money];
    NSMutableAttributedString *oldPrice = [[NSMutableAttributedString alloc]initWithString:oldString attributes:@{NSForegroundColorAttributeName:SFColor(230, 46, 37),NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0]
                                                                                                                  }];
    [string insertAttributedString:oldPrice atIndex:string.length];
    _priceView.priceLabel.attributedText = string;
}


/*
 URL:h"p://123.57.141.249:8080/beautalk/appShopCart/appUpdateCart.do 
 传入数据:
 拼装字符串标记:updateCartMsg 格式:购物记录UUID,商品数量#购物记录UUID,商品数量#......
 返回参数:Map<String,Object> 
 结果:Result【"success" or "error"】
 */

/**改变购物车的数据*/
- (void)changeBuyCarData {
    
    NSString *buyCarData;
    NSMutableArray *buyCarDataArray = [NSMutableArray array];
    for (SFBuyShopItem *shopItem in _goodListArray) {
        buyCarData = [NSString stringWithFormat:@"%@,%ld", shopItem.UUID, shopItem.GoodsCount];
        [buyCarDataArray addObject:buyCarData];
    }
    
    buyCarData = [buyCarDataArray componentsJoinedByString:@"#"];
    
    [self getWithPath:@"appShopCart/appUpdateCart.do" params:@{@"updateCartMsg" : buyCarData} success:^(id json) {
       
        SFLog(@"%@", json);
    } failure:^(NSError *error) {
        
    }];
    
}
@end
