//
//  SFRegisterViewController.m
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFRegisterViewController.h"
#import "SFRegisterView.h"

@interface SFRegisterViewController ()

@end

@implementation SFRegisterViewController

- (void)loadView {

    self.view = [[SFRegisterView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SFMainColor;
    

}


@end
