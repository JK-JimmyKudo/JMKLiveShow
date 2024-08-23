//
//  JMKInavAlertView.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "JMKInavAlertView.h"
@interface JMKInavAlertView ()

@end


@implementation JMKInavAlertView


- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.alpha = 0;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissContentView)];
        [self addGestureRecognizer:tap];
    }

    return self;
}

#pragma mark - 显示
- (void)show
{
    self.isShow = YES;
    
    self.alpha = 0;
    [UIView animateWithDuration:0.3
                     animations:^{
        self.alpha = 1;
    }
                     completion:^(BOOL finished) {
    }];
}

#pragma mark - 隐藏
- (void)disMissContentView
{
    self.isShow = NO;

    [UIView animateWithDuration:0.3
                     animations:^{
        self.alpha = 0;
    }
                     completion:^(BOOL finished) {
    }];
}

#pragma mark - 懒加载
- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 8;
    }

    return _contentView;
}

@end