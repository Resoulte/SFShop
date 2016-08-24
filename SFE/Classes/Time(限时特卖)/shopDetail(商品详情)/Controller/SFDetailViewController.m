//
//  SFDetailViewController.m
//  SFE
//
//  Created by ma c on 16/8/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDetailViewController.h"
#import "SFDetailTopImage.h"
#import "SFDetailTopImageItem.h"
#import "SFDetailTitleItem.h"
#import "SFDetailListItem.h"
#import "SFDetailTitleView.h"
#import "SFDetailBottomView.h"
#import "SFDetailContentView.h"
#import "SFBottomButtonView.h"


@interface SFDetailViewController ()

/**底层scrollview*/
@property (strong, nonatomic) UIScrollView *mainScrollView;
/**头部详情*/
@property (strong, nonatomic) SFDetailTopImage *topImage;
/**中间view*/
@property (strong, nonatomic) SFDetailTitleView *titleView;
/**详情view*/
@property (strong, nonatomic) SFDetailContentView *contentView;
/**底部多张图片展示view*/
@property (strong, nonatomic) SFDetailBottomView *bottomView;
/**底部button按钮view*/
@property (strong, nonatomic) SFBottomButtonView *buttonView;
/**scroll滚动范围*/
@property (assign, nonatomic) CGFloat scrollHeight;

@end

@implementation SFDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollHeight = 230;
    [self setupAllSubViews];
}

- (void)setupAllSubViews {

    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.topImage];
    [self.mainScrollView addSubview:self.titleView];
    [self.mainScrollView addSubview:self.contentView];
    
    __weak typeof(self) weakSelf = self;
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets = UIEdgeInsetsMake(0, 0, 45, 0);
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.topImage.mas_bottom).offset(-150);
        make.left.right.equalTo(weakSelf.view);
//        make.height.equalTo(@300);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
    }];
    
    [self.mainScrollView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.contentView.mas_bottom);
    }];
    
    [self.view addSubview:self.buttonView];
    
    [self requestHttpTop];
    [self requestHttpTitleView];
    [self requestHttpContentView];

}

#pragma mark - SFDetailTopImage网络请求
- (void)requestHttpTop {

    [self getWithPath:@"appGoods/findGoodsImgList.do" params:@{@"GoodsId" : self.GoodsID} success:^(id json) {
//        SFLog(@"requestHttpTop%@", json);
        NSArray *topImageArray = [NSArray yy_modelArrayWithClass:[SFDetailTopImageItem class] json:json];
        
        NSMutableArray *imagesArray  = [NSMutableArray array];
        for (SFDetailTopImageItem *imageItem in topImageArray) {
            if ([imageItem.ImgType isEqualToString:@"1"]) {
                [imagesArray addObject:imageItem.ImgView];
            }
        }
        _topImage.imageArray = imagesArray;
        _bottomView.iconArray = topImageArray;

    } failure:^(NSError *error) {
        
    }];
}

/*URL:h"p://123.57.141.249:8080/beautalk/appGoods/findGoodsDetail.do 
 传入参数:
 商品ID:GoodsId 返回数据:Map<String,Object>
 折扣价格: Price 原价: OriginalPrice
 
 活动剩余时间:AcZvityTime 购买人数: BuyCount 活动名称: AcZvityName 折扣: Discount
 简介: GoodsIntro
 评分: Score
 好评率: FavorableRate 格式:
 {" Price ":"100"," OriginalPrice ":"100"," AcZvityTime ":"剩余10小时10分钟"," BuyCount ":" 78665"....}*/
#pragma mark -SFDetailTitleView网络请求
- (void)requestHttpTitleView {
    
    [self getWithPath:@"appGoods/findGoodsDetail.do" params:@{@"GoodsId" : self.GoodsID} success:^(id json) {
        SFLog(@"requestHttpTitleView%@", json);
        SFDetailTitleItem *titleItem = [SFDetailTitleItem yy_modelWithJSON:json];
        self.titleView.titleItem = titleItem;
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - SFDetailContentView网络请求
- (void)requestHttpContentView {
    
    [self getWithPath:@"appGoods/findGoodsDetailList.do?" params:@{@"GoodsId" : self.GoodsID} success:^(id json) {
//        SFLog(@"requestHttpContentView%@", json);
        NSArray *contentArray = [NSArray yy_modelArrayWithClass:[SFDetailListItem class] json:json];
        self.contentView.contentItemArray = contentArray;
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - setter and getter
- (UIScrollView *)mainScrollView {

    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.contentSize = CGSizeMake(0, 1000);
//        SFLog(@"mainScrollView%@", _mainScrollView);
    }
    return _mainScrollView;
}

- (SFDetailTopImage *)topImage {

    if (!_topImage) {
        _topImage = [[SFDetailTopImage alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, 380)];
    }
    return _topImage;
}

- (SFDetailTitleView *)titleView {

    if (!_titleView) {
        _titleView = [[SFDetailTitleView alloc] init];
        
        __weak typeof(self) weakSelf = self;
        _titleView.returnHeightBlock = ^(CGFloat height) {
        
            [weakSelf.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(height));
            }];
            
            weakSelf.scrollHeight += height;
        };
    }
    return _titleView;
}

- (SFDetailContentView *)contentView {

    if (!_contentView) {
        _contentView = [[SFDetailContentView alloc] init];
        
        __weak typeof(self) weakSelf = self;
        _contentView.returnContentHeightBlock = ^(CGFloat height) {
            [weakSelf.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(height));
            }];
            weakSelf.scrollHeight += height;
        };
    }
    return _contentView;
}

- (SFDetailBottomView *)bottomView {

    if (!_bottomView) {
        _bottomView = [[SFDetailBottomView alloc] init];
        
        __weak typeof(self) weakSelf = self;
        _bottomView.returnBottomHeightBlock = ^(CGFloat height) {
        [weakSelf.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(height));
        }];
            weakSelf.scrollHeight += height;
        };
    }
    return _bottomView;
}

- (void)setScrollHeight:(CGFloat)scrollHeight {
    _scrollHeight = scrollHeight;
    self.mainScrollView.contentSize = CGSizeMake(0, scrollHeight);
}

- (SFBottomButtonView *)buttonView {

    if (!_buttonView) {
        _buttonView  = [[SFBottomButtonView alloc] initWithFrame:CGRectMake(0, SFScreen.height-45, SFScreen.width, 45)];
    }
    return _buttonView;
}
@end
