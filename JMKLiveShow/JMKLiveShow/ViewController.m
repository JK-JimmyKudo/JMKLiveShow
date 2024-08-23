//
//  ViewController.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "ViewController.h"
//#import "IQKeyboardManager.h"
//#import <IQKeyboardManager/IQKeyboardManager.h>
//
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self configIQKeyboardManager];
}
- (void)configIQKeyboardManager
{
    NSLog(@"configIQKeyboardManager");
    // 是都开启键盘工具
//    [[IQKeyboardManager sharedManager] setEnable:YES];
//    [[IQKeyboardManager sharedManager] setEnable:YES];
//    // 是否显示键盘提示工具栏
//    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
//    // 键盘弹出时，点击背景，键盘收回
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
//    // 下一步
//    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysShow;
}


@end
