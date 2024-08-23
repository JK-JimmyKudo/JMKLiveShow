//
//  JMKWarmUpViewController.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "JMKBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JMKWarmUpViewControllerDelegate <NSObject>

/// 直播开始
- (void)enterRoom;

@end

@interface JMKWarmUpViewController : JMKBaseViewController

/// 代理
@property (nonatomic, weak) id <JMKWarmUpViewControllerDelegate> delegate;

/// 基础信息
@property (nonatomic, copy) NSString *webinarId;
@end

NS_ASSUME_NONNULL_END
