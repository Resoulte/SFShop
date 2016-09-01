//
//  SFClassViewController.m
//  SFE
//
//  Created by ma c on 16/8/17.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFClassViewController.h"
#import "SFClassesCollection.h"
#import "SFClassEffectItem.h"
#import "SFClassBrandItem.h"

@interface SFClassViewController ()

/**collectionView*/
@property (strong, nonatomic) SFClassesCollection *classCollection;

@end

@implementation SFClassViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化页面
    [self initUI];
    
    // 分类的网络请求
    [self classRequestHttp];
}

/**初始化页面*/
- (void)initUI {

    [self.view addSubview:self.classCollection];
    __weak typeof(self) weakSelf = self;
    [self.classCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#warning 内存问题
/**分类的网络请求*/
- (void)classRequestHttp {

     //URL:h"p://123.57.141.249:8080/beautalk/appBrandareatype/findBrandareatype.do
    // 功效请求
    [self getWithPath:@"appBrandareatype/findBrandareatype.do" params:nil success:^(id json) {
//        [json writeToFile:@"/Users/mac/Desktop/json1.plist" atomically:YES];
//        SFLog(@"%@", json);
//
//        NSArray *dataArray = [NSArray yy_modelArrayWithClass:[SFClassEffectItem class] json:json];
        NSArray *dataArray = [SFClassEffectItem mj_objectArrayWithKeyValuesArray:json];
        _classCollection.effectArray = dataArray;
        SFLog(@"effectArray:%@", _classCollection.effectArray);
//        [_classCollection reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    // 经典品牌
    [self getWithPath:@"appBrandarea/asianBrand.do" params:nil success:^(id json) {
//        NSArray *dataArray = [NSArray yy_modelArrayWithClass:[SFClassBrandItem class] json:json];
        
        NSArray *dataArray = [SFClassBrandItem mj_objectArrayWithKeyValuesArray:json];
        _classCollection.classicClassArray = dataArray;
        SFLog(@"classicClassArray:%@", _classCollection.classicClassArray);
//        [_classCollection reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    // 推荐品牌
    [self getWithPath:@"appBrandareanew/findBrandareanew.do" params:nil success:^(id json) {
//         NSArray *dataArray = [NSArray yy_modelArrayWithClass:[SFClassBrandItem class] json:json];
        
        NSArray *dataArray = [SFClassBrandItem mj_objectArrayWithKeyValuesArray:json];
        _classCollection.recommendClassArray =  dataArray;
        SFLog(@"recommendClassArray:%@", _classCollection.recommendClassArray);
//        [_classCollection reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
}

#pragma mark - setter and getter
- (SFClassesCollection *)classCollection {

    if (!_classCollection) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 0;
        NSInteger itemWidth = 0;
        if (SFScreen.width > 400) {
            itemWidth = (itemWidth - 4) / 5;
        } else
            itemWidth = (itemWidth - 3) / 4;
        layout.itemSize = CGSizeMake(itemWidth, itemWidth);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0);
        layout.headerReferenceSize = CGSizeMake(0, 35);
        
        _classCollection = [[SFClassesCollection alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
        _classCollection.backgroundColor = SFMainColor;
    }
    return _classCollection;
}

@end
