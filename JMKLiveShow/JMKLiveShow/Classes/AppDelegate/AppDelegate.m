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
#import "CrashInstallation.h"
#import "KSCrashInstallationEmail.h"
#import "KSCrashInstallation+Alert.h"
#import "KSCrash/KSCrashInstallationQuincyHockey.h"
#import "KSCrashInstallation.h"
#import "KSCrash/KSCrashInstallation.h"
#import "KSCrash/KSCrashInstallationStandard.h"
#import "IQKeyboardManager.h"


@interface AppDelegate ()
@property (nonatomic, assign) CFTimeInterval launchTime;

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
    
    //cash 检测
    [[CrashInstallation share]uploadCrashLog:^(NSError * _Nonnull error) {
            
        VHLog(@"cash 检测 -- %@",error);
    }];
    
    self.launchTime = CFAbsoluteTimeGetCurrent();
    [self someMethodWhereYouNeedToCheckElapsedTime];
    
    
    [self installCrashHandler];
    return YES;
}

- (void)someMethodWhereYouNeedToCheckElapsedTime {
    CFTimeInterval currentTime = CFAbsoluteTimeGetCurrent();
    CFTimeInterval elapsedTime = currentTime - self.launchTime;
    NSLog(@"程序运行时间: %f秒", elapsedTime);
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
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnable:YES];
    // 是否显示键盘提示工具栏
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    // 键盘弹出时，点击背景，键盘收回
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    // 下一步
    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysShow;
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


- (void) installCrashHandler
{
    // This can be useful when debugging on the simulator.
    // Normally, there's no way to see console messages in the simulator,
    // except when running in the debugger, which disables the crash handler.
    // This feature redirects KSCrash console messages to a log file instead.
//    [[KSCrash sharedInstance] redirectConsoleLogsToDefaultFile];
    
    
    // Create an installation (choose one)
//    KSCrashInstallation* installation = [self makeStandardInstallation];
    self.crashInstallation = [self makeEmailInstallation];
//    self.crashInstallation = [self makeHockeyInstallation];
//    self.crashInstallation = [self makeQuincyInstallation];
//    self.crashInstallation = [self makeVictoryInstallation];
    
    
    // Install the crash handler. This should be done as early as possible.
    // This will record any crashes that occur, but it doesn't automatically send them.
    [self.crashInstallation install];
    
    // You may also optionally configure some more advanced settings if you like.
    [self configureAdvancedSettings];
    
    // Crash reports will be sent by LoaderVC.
}

- (KSCrashInstallation*) makeEmailInstallation
{
    NSString* emailAddress = @"pw565731968@163.com";
    
    KSCrashInstallationEmail* email = [KSCrashInstallationEmail sharedInstance];
    email.recipients = @[emailAddress];
    email.subject = @"Crash Report";
    email.message = @"This is a crash report";
    email.filenameFmt = @"crash-report-%d.txt.gz";
    
    [email addConditionalAlertWithTitle:@"Crash Detected"
                                message:@"The app crashed last time it was launched. Send a crash report?"
                              yesAnswer:@"Sure!"
                               noAnswer:@"No thanks"];
    
    // Uncomment to send Apple style reports instead of JSON.
//    [email setReportStyle:KSCrashEmailReportStyleApple useDefaultFilenameFormat:YES];

    return email;
}

- (KSCrashInstallation*) makeHockeyInstallation
{
    NSString* hockeyAppIdentifier = @"PUT_YOUR_HOCKEY_APP_ID_HERE";
    
    KSCrashInstallationHockey* hockey = [KSCrashInstallationHockey sharedInstance];
    hockey.appIdentifier = hockeyAppIdentifier;
    hockey.userID = @"ABC123";
    hockey.contactEmail = @"nobody@nowhere.com";
    hockey.crashDescription = @"Something broke!";

    // Don't wait until reachable because the main VC won't show until the process completes.
    hockey.waitUntilReachable = NO;
    
    return hockey;
}

- (KSCrashInstallation*) makeQuincyInstallation
{
//    NSURL* quincyURL = [NSURL URLWithString:@"http://localhost:8888/quincy/crash_v200.php"];
    NSURL* quincyURL = [NSURL URLWithString:@"http://put.your.quincy.url.here"];
    
    KSCrashInstallationQuincy* quincy = [KSCrashInstallationQuincy sharedInstance];
    quincy.url = quincyURL;
    quincy.userID = @"ABC123";
    quincy.contactEmail = @"nobody@nowhere.com";
    quincy.crashDescription = @"Something broke!";
    
    // Don't wait until reachable because the main VC won't show until the process completes.
    quincy.waitUntilReachable = NO;
    
    return quincy;
}

- (KSCrashInstallation*) makeStandardInstallation
{
    NSURL* url = [NSURL URLWithString:@"http://put.your.url.here"];
    
    KSCrashInstallationStandard* standard = [KSCrashInstallationStandard sharedInstance];
    standard.url = url;
    
    return standard;
}

//- (KSCrashInstallationVictory*) makeVictoryInstallation
//{
////    NSURL* url = [NSURL URLWithString:@"https://victory-demo.appspot.com/api/v1/crash/0571f5f6-652d-413f-8043-0e9531e1b689"];
//    NSURL* url = [NSURL URLWithString:@"https://put.your.url.here/api/v1/crash/<application key>"];
//    
//    KSCrashInstallationVictory* victory = [KSCrashInstallationVictory sharedInstance];
//    victory.url = url;
//    victory.userName = [[UIDevice currentDevice] name];
//    victory.userEmail = @"nobody@nowhere.com";
//    
//    return victory;
//}


// ======================================================================
#pragma mark - Advanced Crash Handling (optional) -
// ======================================================================

static void advanced_crash_callback(const KSCrashReportWriter* writer)
{
    // You can add extra user data at crash time if you want.
    writer->addBooleanElement(writer, "some_bool_value", NO);
}

- (void) configureAdvancedSettings
{
    KSCrash* handler = [KSCrash sharedInstance];
    
    // Settings in KSCrash.h
    handler.deadlockWatchdogInterval = 8;
    handler.userInfo = @{@"someKey": @"someValue"};
    handler.onCrash = advanced_crash_callback;
    handler.searchQueueNames = YES;
    handler.searchQueueNames = YES;

    // Do not introspect class SensitiveInfo (see MainVC)
    // When added to the "do not introspect" list, the Objective-C introspector
    // will only record the class name, not its contents.
    handler.doNotIntrospectClasses = @[@"SensitiveInfo"];
}

@end
