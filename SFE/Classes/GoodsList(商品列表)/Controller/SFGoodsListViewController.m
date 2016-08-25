//
//  SFGoodsListViewController.m
//  SFE
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFGoodsListViewController.h"
#import "SFGoodListNavButton.h"
#import "SFGoodsListCell.h"

@interface SFGoodsListViewController () <UICollectionViewDataSource>

/**四个导航按钮*/
@property (strong, nonatomic) SFGoodListNavButton *navButtonView;

@end

static NSString *ID = @"cell";
@implementation SFGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;
    [self setupAllViews];
}

- (void)setupAllViews {
    [self.view addSubview:self.navButtonView];

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = 10;
    flow.minimumInteritemSpacing = 10;
    flow.sectionInset =UIEdgeInsetsMake(5, 0, 5, 5);
    flow.itemSize = CGSizeMake((SFScreen.width-5) / 2, 255);
    
    UICollectionView *listView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30, SFScreen.width, SFScreen.height) collectionViewLayout:flow];
    listView.backgroundColor = [UIColor whiteColor];
    listView.dataSource = self;
    [self.view addSubview:listView];
    
    [listView registerClass:[SFGoodsListCell class] forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.searchList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SFGoodsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.listItem = self.searchList[indexPath.row];
    
    return cell;
}

- (SFGoodListNavButton *)navButtonView {

    if (!_navButtonView) {
        _navButtonView = [[SFGoodListNavButton alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, 30)];
//        _navButtonView.backgroundColor = [UIColor redColor];
    }
    
    return _navButtonView;
}

- (void)setSearchList:(NSArray *)searchList {
    _searchList = searchList;
}

@end
