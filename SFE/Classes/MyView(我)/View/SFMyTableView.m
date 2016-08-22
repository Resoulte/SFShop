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
//        self.bounces = NO;
        self.backgroundColor = SFMainColor;

    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *loginDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
    if (loginDic.count) {
        return 6;
    } else
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
//    cell.message = self.tableMessage[indexPath.row];
    
    if (indexPath.row == 3) {
        UIImageView *nextImage = [cell valueForKey:@"rightImage"];
        nextImage.hidden = YES;
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


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    NSDictionary *loginDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
    if (loginDic.count) {
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SFScreen.width, 100)];
        footView.backgroundColor = SFMainColor;
        UIButton *existBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        existBtn.frame = CGRectMake(50, 42, SFScreen.width-100, 45);
        [existBtn setImage:[UIImage imageNamed:@"我的界面退出登录按钮"] forState:UIControlStateNormal];
        [existBtn addTarget:self action:@selector(existBtnMethod) forControlEvents:UIControlEventTouchUpInside];
        
        [footView addSubview:existBtn];
        return footView;
    }
    
    
    return nil;
}

- (void)existBtnMethod {
    if (_existBtnBlock) {
        _existBtnBlock();
    }
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
