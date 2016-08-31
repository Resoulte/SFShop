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

@interface SFBuyViewController ()

/**商品展示的TableView*/
@property (strong, nonatomic) SFBuyCarListView *buyCarListView;
/**商品列表数组*/
@property (strong, nonatomic) NSArray *goodListArray;
@end

@implementation SFBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.buyCarListView];
    
    
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
    
    if (!userDict[@"MemberId"]) {
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
        
    }
    return _buyCarListView;
    
}

@end
