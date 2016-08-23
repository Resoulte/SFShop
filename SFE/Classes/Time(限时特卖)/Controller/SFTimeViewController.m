//
//  SFTimeViewController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTimeViewController.h"
#import "SFTwoButtonView.h"
#import "SFDealTableView.h"
#import "SFNewDealItem.h"
#import "SFBrandDealItem.h"
#import "SFNewDealCell.h"
#import "SFBrandDealCell.h"

//#import "SFUIScroolView.h"
#import <SDCycleScrollView.h>

@interface SFTimeViewController () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

/**整个页面的scrollView*/
@property (strong, nonatomic) UIScrollView *mainScrollView;
/**轮播图的scrollView*/
@property (strong, nonatomic)  SDCycleScrollView *cycleScrollView;
/**切换view*/
@property (strong, nonatomic) SFTwoButtonView *twoBtnView;
/**新品团购tableView*/
@property (strong, nonatomic) UITableView *newsTableView;
/**品牌团购tableView*/
@property (strong, nonatomic) UITableView *brandTableView;
/**存放新品团购数据模型*/
@property (strong, nonatomic) NSArray *newsArray;
/**存放品牌团购数据模型*/
@property (strong, nonatomic) NSArray *brandArray;

@end

@implementation SFTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;
    // 设置所有的子view
    [self setupAllChildView];
    
}

- (void)setupAllChildView {
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.cycleScrollView];
    [self.mainScrollView addSubview:self.newsTableView];
    [self.mainScrollView addSubview:self.brandTableView];
    [self.mainScrollView addSubview:self.twoBtnView];
    
    
    [self requestHttpHeadImage];
    [self requestHttpNewsDeal];
    [self requestHttpBrandDeal];
    
    
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView.contentOffset.y > 230) {
        CGRect rect = _twoBtnView.frame;
        rect.origin.y = scrollView.contentOffset.y;
        _twoBtnView.frame = rect;
    } else {
        CGRect rect = _twoBtnView.frame;
        rect.origin.y = 230;
        _twoBtnView.frame = rect;
    }
}
/*
 URL:h"p://123.57.141.249:8080/beautalk/appHome/appHome.do 返回数据:List<Map<String,Object>>
 跳转类型 : RelatedType 无需应用此字段,统一跳转至广告页(含轮播广告位及商品列 表)
 关联ID(活动ID) : RelatedId
 图片地址 : ImgView
 是否有中间页:IfMiddlePage 格式:
 [{"RelatedId":"3","ImgView":"h"p://192.168.0.102:8080/beautalk/testImg/ 0.png","RelatedType":"2"},{"RelatedId":"1","ImgView":"h"p://192.168.0.102:8080/beautalk/ testImg/1.png","RelatedType":"1"}]

 */

// 轮播图网络请求
- (void)requestHttpHeadImage {
    
    [self getWithPath:@"appHome/appHome.do" params:nil success:^(id json) {
//        SFLog(@"%@", json);
        NSMutableArray *imageArray = [NSMutableArray array];
        for (NSDictionary *dict in json) {
            [imageArray addObject:dict[@"ImgView"]];
        }
        _cycleScrollView.imageURLStringsGroup = imageArray;
    } failure:^(NSError *error) {
        
    }];
}

/*URL:h"p://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do 返回数据:List<Map<String,Object>>
 商品ID : GoodsId
 国家名称 : CountryName
 国旗图片 : CountryImg
 缩略图 :ImgView
 购买数量 : BuyCount
 折扣 :Discount
 商品名称:Title 外币价格:ForeignPrice 人民币价格:Price
 其他价格 :OtherPrice 活动时间(距离结束时间) :RestTime
 */
// 请求新品团购数据
- (void)requestHttpNewsDeal {

    [self getWithPath:@"/appActivity/appHomeGoodsList.do" params:nil success:^(id json) {
//        SFLog(@"json%@", json);
        self.newsArray = [NSArray yy_modelArrayWithClass:[SFNewDealItem class] json:json];
        [self.newsTableView reloadData];
        
        CGRect newRect = self.newsTableView.frame;
        newRect.size.height = self.newsArray.count * 170;
        self.newsTableView.frame = newRect;
        
        self.mainScrollView.contentSize = CGSizeMake(0, self.newsArray.count * 170 + 280);
        
        SFLog(@"item%@", self.newsArray);
    } failure:^(NSError *error) {
        
    }];
}

/*
 URL:h"p://123.57.141.249:8080/beautalk/appActivity/appActivityList.do 返回数据:List<Map<String,Object>>
 活动ID : AcZvityId
 图片地址 : ImgView 是否有中间页:IfMiddlePage 品牌LOGO图片地址 : LogoImg
 品牌名称 : ShopTitle
 活动简介 :Content 活动时间(距离结束时间) :AcZvityDate
 格式:
 [{"AcZvityId":0,"ImgView":"h"p://123.57.141.249:8080/beautalk/testImg/act2.png","LogoImg ":"h"p://123.57.141.249:8080/beautalk/testImg/ act2.png","ShopTitle":"SWEETSHOP","AcZvityDate":"240","Content":"全场7折起"}]
 */

// 请求品牌团购数据
- (void)requestHttpBrandDeal {

    [self getWithPath:@"appActivity/appActivityList.do" params:nil success:^(id json) {
        SFLog(@"brand%@", json);
        self.brandArray = [NSArray yy_modelArrayWithClass:[SFBrandDealItem class] json:json];
        
        CGRect brandRect = _brandTableView.frame;
        brandRect.size.height = _brandArray.count * 200;
        _brandTableView.frame = brandRect;
        if (self.twoBtnView.brandsDeal.selected) {
            _mainScrollView.contentSize = CGSizeMake(0, _brandArray.count * 200 + 280);
        }
        
        [self.brandTableView reloadData];
    
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == _newsTableView) {
        return self.newsArray.count;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _newsTableView) {
        SFNewDealCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[SFNewDealCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        cell.newsDealItem = self.newsArray[indexPath.row];
        return cell;
    } else {
         SFBrandDealCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[SFBrandDealCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        
        cell.brandItem = self.brandArray[indexPath.row];
        
        return cell;

    }
    
}

#pragma mark - setter and getter
- (UIScrollView *)mainScrollView {
    
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, SFScreen.height - 64 - 49)];
        _mainScrollView.contentSize = CGSizeMake(0, 1980);
        _mainScrollView.delegate = self;
        
    }
    return _mainScrollView;
}

- (SDCycleScrollView *)cycleScrollView {

    if (!_cycleScrollView) {
        
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SFScreen.width, 230) delegate:nil placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        _cycleScrollView.pageControlAliment =SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色

    }
    return _cycleScrollView;
}

- (SFTwoButtonView *)twoBtnView {

    if (!_twoBtnView) {
        _twoBtnView = [[SFTwoButtonView alloc] initWithFrame:CGRectMake(0, 230, SFScreen.width, 50)];
        _twoBtnView.backgroundColor = [UIColor whiteColor];
        
        __weak typeof(self) weakSelf = self;
        _twoBtnView.DealBlock = ^ (UIButton *btn) {
            [weakSelf changeTableViewFrame:btn];
        };
        
    }
    return _twoBtnView;
}

- (void)changeTableViewFrame:(UIButton *)btn {

    if (btn == _twoBtnView.newsDeal) {
        btn.selected = YES;
        _twoBtnView.brandsDeal.selected = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect newRect = _newsTableView.frame;
            newRect.origin.x = 0;
            _newsTableView.frame = newRect;
            
            CGRect brandRect = _brandTableView.frame;
            brandRect.origin.x = SFScreen.width;
            _brandTableView.frame = brandRect;
        }];

        
    } else if (btn == _twoBtnView.brandsDeal) {
        btn.selected = YES;
        _twoBtnView.newsDeal.selected = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect brandRect = _brandTableView.frame;
            brandRect.origin.x = 0;
            _brandTableView.frame = brandRect;
            
            CGRect newRect = _newsTableView.frame;
            newRect.origin.x = -SFScreen.width;
            _newsTableView.frame = newRect;
        }];
    
    }
}


- (UITableView *)newsTableView {

    if (!_newsTableView) {
        _newsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 280, SFScreen.width, 1700) style:UITableViewStylePlain];
        _newsTableView.delegate = self;
        _newsTableView.dataSource = self;
        _newsTableView.bounces = NO;
        
        
    }
    return _newsTableView;
}

- (UITableView *)brandTableView {

    if (!_brandTableView) {
        _brandTableView = [[UITableView alloc] initWithFrame:CGRectMake(SFScreen.width, 280, SFScreen.width, 1700) style:UITableViewStylePlain];
        _brandTableView.delegate = self;
        _brandTableView.dataSource = self;
        _brandTableView.bounces = NO;
        
    }
    return _brandTableView;
}

@end
