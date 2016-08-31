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
    flow.minimumLineSpacing = 5;
    flow.minimumInteritemSpacing = 5;
    flow.sectionInset =UIEdgeInsetsMake(0, 10, 10, 10);
    NSInteger itemW = (SFScreen.width-10 * 3) / 2;
    flow.itemSize = CGSizeMake(itemW, 255);
 

    

    
    UICollectionView *listView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30, SFScreen.width, SFScreen.height) collectionViewLayout:flow];
    listView.backgroundColor = [UIColor whiteColor];
    listView.dataSource = self;
    [self.view addSubview:listView];
    
    [listView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

//    return self.searchList.count;
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    SFGoodsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    cell.listItem = self.searchList[indexPath.row];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
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
