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


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    
    JMKLoginViewController *JMKLogin = [[JMKLoginViewController alloc]init];
    
    JMKNavigationController *JMKNavi = [[JMKNavigationController alloc]initWithRootViewController:JMKLogin];
    
    self.window.rootViewController = JMKNavi;
    
    [self.window makeKeyWindow];
    
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
