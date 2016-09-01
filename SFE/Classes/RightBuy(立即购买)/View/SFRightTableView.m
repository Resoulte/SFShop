//
//  SFRightTableView.m
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRightTableView.h"
#import "SFRightTableViewCell.h"


@interface SFRightTableView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SFRightTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.rowHeight = 95;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.orderArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *order = @"order";
    SFRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:order];
    if (!cell) {
        cell = [[SFRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:order];
    }
    
    cell.listItem = self.orderArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


- (void)setOrderArray:(NSArray *)orderArray {

    _orderArray = orderArray;
    
    [self reloadData];
}
@end
