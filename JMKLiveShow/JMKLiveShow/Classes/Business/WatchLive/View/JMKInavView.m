//
//  JMKInavView.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/26.
//

#import "JMKInavView.h"

@implementation JMKInavView

- (void)dealloc
{
    VHLog(@"%s释放", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String]);
}

#pragma mark - 初始化
- (instancetype)init
{
    if ([super init]) {
        self.backgroundColor = [UIColor redColor];
        // 添加控件
//        [self addViews];
//
//        // 初始化UI
//        [self masonryUI];
    }

    return self;
}

@end
