//
//  JMKWatchLiveBottomView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JMKWatchLiveBottomViewDelegate <NSObject>

/// 发送消息
/// - Parameter text: 消息内容哦
- (void)sendText:(NSString *)text;

/// 点击礼物回调
- (void)clickGift;

/// 点击申请互动连麦
- (void)clickInav;

/// 是否开启了回放章节
- (void)watchRecordChapterIsOpen:(BOOL)isOpen;

@end


@interface JMKWatchLiveBottomView : JMKBaseView
/// 代理对象
@property (nonatomic, weak) id <JMKWatchLiveBottomViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
