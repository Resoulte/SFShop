//
//  SFSearchViewController.m
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSearchViewController.h"
#import "SFGoodsListViewController.h"
#import "SFGoodListItem.h"

@interface SFSearchViewController () <UISearchBarDelegate>

@end

@implementation SFSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllSubviews];
}

- (void)setupAllSubviews {

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 0, SFScreen.width - 60, 30)];
    searchBar.placeholder = @"商品名 / 功效 / 品牌";
    searchBar.showsCancelButton = YES;
    searchBar.delegate = self;
    searchBar.returnKeyType = UIReturnKeySearch;
    self.navigationItem.titleView = searchBar;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
 URL:h"p://123.57.141.249:8080/beautalk/appSearch/searchList.do  传入数据:
 搜索关键字: search
 排序字段:OrderName 【热卖:host;价格:price;新品:Zme;好评:score】默认为 host
 排序类型:OrderType 【正序:ASC;倒序:DESC】
 注:OrderName为Zme是OrderType为ASC;其他为EDSC 返回参数:List<Map<String,Object>>
 商品ID : GoodsId
 国家名称 : CountryName
 国旗图片 : CountryImg
 缩略图 :ImgView
 购买数量 : BuyCount
 折扣 :Discount
 商品名称:Title 外币价格:ForeignPrice 人民币价格:Price
 其他价格 :OtherPrice 活动时间(距离结束时间) :RestTime
*/
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [self postWithPath:@"appSearch/searchList.do" params:@{@"search" : searchBar.text, @"OrderName" : @"host", @"OrderType" : @"ASC" } success:^(id json) {
        SFLog(@"searchBar%@",json);
        NSArray *goodListArray = [NSArray yy_modelArrayWithClass:[SFGoodListItem class] json:json];
        
        SFGoodsListViewController *goodList = [[SFGoodsListViewController alloc] init];
        goodList.searchList = goodListArray;
        goodList.title = searchBar.text;
        
        //解决页面跳转时闪烁问题，如果键盘存在的话，页面跳转的动画会出现两次的push，但nav的子视图中并没有出现多余的viewcontroller
        [searchBar resignFirstResponder];
        
        [self.navigationController pushViewController:goodList animated:YES];
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}

@end
