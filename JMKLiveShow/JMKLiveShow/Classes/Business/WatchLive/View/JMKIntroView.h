//
//  JMKIntroView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/26.
//

#import "JMKBaseView.h"

NS_ASSUME_NONNULL_BEGIN


@protocol JMKInavViewDelegate <NSObject>

/// 下麦
- (void)unApplyAction;

/// 退出互动
- (void)errorLeaveInav;

/// 被踢出
- (void)isKickout:(BOOL)isKickout;

/// 退出房间
- (void)leaveRoom;

@end

@interface JMKIntroView : JMKBaseView
/// 代理对象
@property (nonatomic, weak) id <JMKInavViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
