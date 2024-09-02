//
//  AppDelegate.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/22.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "JMKNavigationController.h"
#import "JMKLoginViewController.h"
#import "JMKNetworkAgent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    JMKLoginViewController *JMKLogin = [[JMKLoginViewController alloc]init];
    JMKNavigationController *JMKNavi = [[JMKNavigationController alloc]initWithRootViewController:JMKLogin];
    self.window.rootViewController = JMKNavi;
    [self.window makeKeyWindow];

    [self keyboardManager];
    [self configIQKeyboardManager];
    // 配置网络环境
    [JMKNetworkAgent configNetworkEnvironment];
    return YES;
}



#pragma mark - 键盘管理

- (void)configIQKeyboardManager {
//    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
//    [IQKeyboardManager sharedManager].enable = NO;
//    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 70;
}


- (void)keyboardManager
{
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

#pragma mark - 屏幕旋转
- (void)setLaunchScreen:(BOOL)launchScreen {
    _launchScreen = launchScreen;
    [self application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:nil];
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (self.isLaunchScreen) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }

    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - 跳转返回通知
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    // 路由跳转回调
    if ([url.scheme isEqualToString:@"vhallsdk"] || [url.scheme isEqualToString:@"xxx.com"] || [url.scheme isEqualToString:@"yyy.xxx.com"]) {
        // 发送通知刷新订单状态
        [[NSNotificationCenter defaultCenter] postNotificationName:VH_GOODS_ORDERINFO object:self userInfo:nil];
        if (![JMKUITool isBlankString:url.resourceSpecifier]) {
            // 对url进行解码
//            [VHProgressHud showToast:[JMKUITool vh_URLDecodedString:url.resourceSpecifier]];
            // 复制url携带的参数
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:[JMKUITool vh_URLDecodedString:url.resourceSpecifier]];
        }
    }
    return YES;
}



#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
