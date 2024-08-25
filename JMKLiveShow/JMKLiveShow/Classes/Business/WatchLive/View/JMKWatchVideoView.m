//
//  JMKWatchVideoView.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/25.
//

#import "JMKWatchVideoView.h"

@implementation JMKWatchVideoView

#pragma mark - 初始化
- (instancetype)initWithWebinarId:(NSString *)webinarId type:(VHMovieActiveState)type
{
    if ([super init]) {
        self.backgroundColor  = [UIColor orangeColor];
//        self.webinarId = webinarId;
//        self.type = type;
//
//        // 显隐控件
//        [self controlsWithIsHidden:type == VHMovieActiveStateLive ? YES : NO];
//
//        // 添加控件
//        [self addViews];
//
//        // 初始化UI
//        [self masonryUI];
//
//        // 设置进度条监听
//        [self.slider addTarget:self action:@selector(slideTouchBegin:) forControlEvents:UIControlEventTouchDown];
//        [self.slider addTarget:self action:@selector(slideTouchEnd:) forControlEvents:UIControlEventTouchUpOutside];
//        [self.slider addTarget:self action:@selector(slideTouchEnd:) forControlEvents:UIControlEventTouchUpInside];
//        [self.slider addTarget:self action:@selector(slideTouchEnd:) forControlEvents:UIControlEventTouchCancel];
//        [self.slider addTarget:self action:@selector(slideValueChanged:) forControlEvents:UIControlEventValueChanged];
//
//        // 监听电话
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInterruption:) name:AVAudioSessionInterruptionNotification object:nil];
//
//        // 开始播放
//        [self startPlay];
//        
//        // 绑定自动化标识
//        [self initKIF];

    }

    return self;
}


@end
