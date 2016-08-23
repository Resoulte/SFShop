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

@interface SFDetailViewController ()

/**底层scrollview*/
@property (strong, nonatomic) UIScrollView *mainScrollView;
/**头部详情*/
@property (strong, nonatomic) SFDetailTopImage *topImage;

@end

@implementation SFDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupAllSubViews];
}

- (void)setupAllSubViews {

    [self.view addSubview:self.mainScrollView];
    
    __weak typeof(self) weakSelf = self;
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).width.insets = UIEdgeInsetsMake(0, 0, 45, 0);
    }];
    
    [self.mainScrollView addSubview:self.topImage];
    
    [self requestHttpTop];

}

#pragma mark - 头部网络请求
- (void)requestHttpTop {

    [self getWithPath:@"appGoods/findGoodsImgList.do" params:@{@"GoodsId" : self.GoodsID} success:^(id json) {
        SFLog(@"%@", json);
        NSArray *topImageArray = [NSArray yy_modelArrayWithClass:[SFDetailTopImageItem class] json:json];
        
        NSMutableArray *imagesArray  = [NSMutableArray array];
        for (SFDetailTopImageItem *imageItem in topImageArray) {
            if ([imageItem.ImgType isEqualToString:@"1"]) {
                [imagesArray addObject:imageItem.ImgView];
            }
        }
        _topImage.imageArray = imagesArray;

    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - setter and getter
- (UIScrollView *)mainScrollView {

    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.contentSize = CGSizeMake(0, 1000);
    }
    return _mainScrollView;
}

- (SFDetailTopImage *)topImage {

    if (!_topImage) {
        _topImage = [[SFDetailTopImage alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, 380)];
    }
    return _topImage;
}


@end
