//
//  SFMyTableView.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyTableView.h"
#import "SFMyTableViewCell.h"
#import "SFMyMessage.h"

#define SFNumber 4

@interface SFMyTableView ()  <UITableViewDelegate, UITableViewDataSource>

/**table信息*/
@property (strong, nonatomic) NSArray *tableMessage;


@end

@implementation SFMyTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {

    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;

    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return SFNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SFMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SFMyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    SFMyMessage *message = self.tableMessage[indexPath.row];
    cell.leftImage.image = [UIImage imageNamed:message.image];
    cell.leftLable.text = message.title;
    
    if (indexPath.row == 3) {
        cell.rightImage.hidden = YES;
        [self addPhoneLable:cell];
    }
    
    return cell;
}

- (void)addPhoneLable:(UITableViewCell *)cell {
    
    UILabel *phoneLable = [[UILabel alloc] init];
    phoneLable.textColor = SFColor(125, 124, 131);
    phoneLable.text = @"400-100-1111";
    [cell addSubview:phoneLable];
    
    [self setupConstrain:phoneLable cell:cell];
}

- (void)setupConstrain:(UILabel *)phoneLable cell:(UITableViewCell *)cell {
    [phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(110, 15));
        make.right.equalTo(cell.mas_right).offset(-15);
        make.centerY.equalTo(cell.mas_centerY);
    }];
    
}

#pragma mark - setter and getter
- (NSArray *)tableMessage {
    
    if (!_tableMessage) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"SFMyMessageTablePlist.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *sourceArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [sourceArray addObject:[SFMyMessage messageWithDict:dict]];
        }
        _tableMessage = sourceArray;
    }
    
    return _tableMessage;
}



@end
