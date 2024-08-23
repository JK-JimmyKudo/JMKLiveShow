//
//  JMKWarmUpStartView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ClickStartBtn)(void);


@interface JMKWarmUpStartView : UIView

@property (nonatomic, copy) ClickStartBtn clickStartBtn;

/// 显示
- (void)show;

/// 隐藏
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
