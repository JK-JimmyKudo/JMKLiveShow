//
//  AppDelegate.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/22.
//

#import <UIKit/UIKit.h>
#import <KSCrash/KSCrashInstallation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

/// 是否是横屏
@property (nonatomic, assign, getter = isLaunchScreen) BOOL launchScreen;
@property (strong, nonatomic) KSCrashInstallation* crashInstallation;
@end

