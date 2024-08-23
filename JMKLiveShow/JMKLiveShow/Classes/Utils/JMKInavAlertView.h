//
//  JMKInavAlertView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKInavAlertView : UIView

/// 容器
@property (nonatomic, strong) UIView *contentView;

/// 是否显示中
@property (nonatomic, assign) BOOL isShow;

/// 初始化
- (instancetype)initWithFrame:(CGRect)frame;

/// 显示
- (void)show;

/// 隐藏
- (void)disMissContentView;
@end

NS_ASSUME_NONNULL_END
