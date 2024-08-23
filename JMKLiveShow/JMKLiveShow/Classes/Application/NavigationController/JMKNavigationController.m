//
//  JMKLoginViewController.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/22.
//

#import "JMKNavigationController.h"

@interface JMKNavigationController ()

@end

@implementation JMKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航禁止手势返回
    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma mark - 状态栏颜色
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

@end
