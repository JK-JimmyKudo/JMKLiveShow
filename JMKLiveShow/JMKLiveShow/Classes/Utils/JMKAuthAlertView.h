//
//  JMKAuthAlertView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <UIKit/UIKit.h>
#import "JMKInavAlertView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol JMKAuthAlertViewDelegate <NSObject>
/// 填写的回调
/// - Parameter verifyValue: 验证权限的值
- (void)changeTextWithVerifyValue:(NSString *)verifyValue;

@end

@interface JMKAuthAlertView : JMKInavAlertView
/// 代理
@property (nonatomic, weak) id <JMKAuthAlertViewDelegate> delegate;

/// 显示弹窗
/// - Parameter type: 密码/白名单
- (void)showAuthWithType:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
