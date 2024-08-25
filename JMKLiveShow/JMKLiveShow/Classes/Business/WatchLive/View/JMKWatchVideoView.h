//
//  JMKWatchVideoView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKWatchVideoView : UIView
/// 初始化
/// - Parameter webinarId: 活动id
/// - Parameter recordId: 指定回放id
/// - Parameter type: 活动状态
- (instancetype)initWithWebinarId:(NSString *)webinarId type:(VHMovieActiveState)type;
@end

NS_ASSUME_NONNULL_END
