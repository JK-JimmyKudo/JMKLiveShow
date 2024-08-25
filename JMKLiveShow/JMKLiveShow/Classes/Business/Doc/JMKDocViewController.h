//
//  JMKDocViewController.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/26.
//

#import "JMKBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JMKDocViewDelegate <NSObject>

/// 切换全屏
- (void)fullWithSelect:(BOOL)isSelect;

@end

@interface JMKDocViewController : JMKBaseViewController

@property (nonatomic, weak) id <JMKDocViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
