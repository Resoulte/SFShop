//
//  SFInputView.h
//  SFE
//
//  Created by ma c on 16/8/18.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^nextButttonBlock)();

@interface SFInputView : UIView

/**下一步block*/
@property (copy, nonatomic) nextButttonBlock nextButttonBlock;

@end
