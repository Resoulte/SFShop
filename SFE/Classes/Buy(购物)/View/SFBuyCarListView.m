//
//  SFBuyCarListView.m
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBuyCarListView.h"
#import "SFBuyShopCell.h"
#import "SFBuyShopItem.h"

@interface  SFBuyCarListView () <UITableViewDelegate, UITableViewDataSource>



@end

@implementation SFBuyCarListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.rowHeight = 70;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    SFBuyShopCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SFBuyShopCell alloc] initWithStyle:UITableViewCellStyleDefault     reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.shopItem = self.dataArray[indexPath.row];
    
    cell.tag = 1000 + indexPath.row;
    SFLog(@"%ld", cell.tag);
    
    [cell.addButton addTarget:self action:@selector(addButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [cell.cutButton addTarget:self action:@selector(cutButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [cell.isSelectBtn addTarget:self action:@selector(selectBtnMethod:) forControlEvents:UIControlEventTouchUpInside];

    
    return cell;
    
}


/**实现删除功能*/
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *del = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        SFBuyShopItem *shopItem = self.dataArray[indexPath.row];
        shopItem.GoodsCount = 0;
        [self changeDataMethod];
        
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    
    return @[del];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES;
}
#pragma mark - 点击事件 
- (void)addButtonMethod:(UIButton *)addBtn {
    
    
//    UIView *cell = [addBtn superview];
    // 因为我加到了cell的contentView上面
    UIView *cell = [[addBtn superview] superview];
    SFBuyShopItem *shopItem = self.dataArray[cell.tag - 1000];
    [shopItem setGoodsCount:shopItem.GoodsCount + 1];
    
    [self changeDataMethod];

    
}

- (void)cutButtonMethod:(UIButton *)cutBtn {
    
    UIView *cell = [[cutBtn superview] superview];
    SFBuyShopItem *shopItem = self.dataArray[cell.tag - 1000];

    if (shopItem.GoodsCount > 1) {
        [shopItem setGoodsCount:shopItem.GoodsCount - 1];
    }
    [self changeDataMethod];
    
}

- (void)selectBtnMethod:(UIButton *)selectBtn {
    UIView *cell = [[selectBtn superview] superview];
    SFLog(@"%@", cell);
    SFBuyShopItem *shopItem = self.dataArray[cell.tag - 1000];
    if (selectBtn.selected) {
        selectBtn.selected = NO;
        [shopItem setIsSelected:NO];
    } else {
        selectBtn.selected = YES;
        [shopItem setIsSelected:YES];
    }
    
    // 修改controller中的数据
    [self changeDataMethod];
}

- (void)changeDataMethod {
    
    [self reloadData];
    if (_changeDataBlock) {
        _changeDataBlock();
    }
    
}

#pragma mark - setter and getter
- (void)setDataArray:(NSMutableArray *)dataArray {

    _dataArray = dataArray;
    
    for (SFBuyShopItem *shopItem in self.dataArray) {
        [shopItem setIsSelected:YES];
    }
    
    [self reloadData];
}



@end
