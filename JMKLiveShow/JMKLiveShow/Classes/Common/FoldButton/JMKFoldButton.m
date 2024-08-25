//
//  JMKFoldButton.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/25.
//

#import "JMKFoldButton.h"

@implementation JMKFoldButton

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
//        self.itemHeight = 40;
//
//        [self.foldButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.bottom.right.mas_equalTo(0);
//            make.height.mas_equalTo(30);
//        }];
//
//        [self.foldTable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.right.mas_equalTo(0);
//            make.height.mas_equalTo(0);
//        }];
    }

    return self;
}


@end
