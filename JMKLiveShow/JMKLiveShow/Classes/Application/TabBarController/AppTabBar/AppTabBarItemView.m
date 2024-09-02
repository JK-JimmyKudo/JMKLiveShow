//
//  AppTabBarItemView.m
//
//  Created by linxj on 2022/11/9.
//

#import "AppTabBarItemView.h"

@interface AppTabBarItemView ()

@property (nonatomic, strong) BadgeView *badgeView;

@end


@implementation AppTabBarItemView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

/// 去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {
    
}

#pragma mark - 初始化UI

- (void)initUI {
    [self addSubview:self.badgeView];
    [self.badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(VHRateScale * 1);
        make.centerX.equalTo(self).offset(VHRateScale * 10);
    }];
}

#pragma mark - 懒加载

- (BadgeView *)badgeView {
    if (!_badgeView) {
        _badgeView = ({
            BadgeView *view = [[BadgeView alloc] init];
            view.height = VHRateScale * 16;
            view.numberFont = FONT(10);
            view;
        });
    }
    return _badgeView;
}

#pragma mark - 更新UI

- (void)updateUI {

}

#pragma mark - Setter

#pragma mark - Delegate

#pragma mark - 事件处理

@end
