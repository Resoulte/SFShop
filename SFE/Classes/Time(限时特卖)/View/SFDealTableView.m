//
//  SFDealTableView.m
//  SFE
//
//  Created by ma c on 16/8/22.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDealTableView.h"
#import "SFNewDealCell.h"
#import "SFBrandDealCell.h"

@interface SFDealTableView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SFDealTableView

#pragma mark - init method
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_isNewsDeal) {
        return self.newsArray.count;
    } else
        return self.brandArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isNewsDeal) {
        return 170;
    } else
        return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_isNewsDeal) {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_isNewsDeal) {
        if(_newTableSelectedBlock) {
            _newTableSelectedBlock([self.newsArray[indexPath.row] GoodsId]);
        }
    }
    
}

#pragma mark - setter and getter
- (void)setNewsArray:(NSArray *)newsArray {
    _newsArray = newsArray;
    [self reloadData];
}

- (void)setBrandArray:(NSArray *)brandArray {
    _brandArray = brandArray;
    [self reloadData];
}

@end
