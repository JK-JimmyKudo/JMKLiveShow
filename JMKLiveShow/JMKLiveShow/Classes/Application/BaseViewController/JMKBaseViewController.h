//
//  JMKBaseViewController.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKBaseViewController : UIViewController

///是否隐藏导航栏 默认 NO 不隐藏
@property (nonatomic, assign) BOOL vh_NavIsHidden;
/// 点击返回
- (void)clickLeftBarItem;
/// 前台
- (void)appWillEnterForeground;
/// 后台
- (void)appDidEnterBackground;

@end

NS_ASSUME_NONNULL_END
