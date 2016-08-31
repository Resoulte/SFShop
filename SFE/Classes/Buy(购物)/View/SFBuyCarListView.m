//
//  SFBuyCarListView.m
//  SFE
//
//  Created by ma c on 16/8/31.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBuyCarListView.h"
#import "SFBuyShopCell.h"

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
    
    return cell;
    
}

#pragma mark - setter and getter
- (void)setDataArray:(NSArray *)dataArray {

    _dataArray = dataArray;
}



@end
