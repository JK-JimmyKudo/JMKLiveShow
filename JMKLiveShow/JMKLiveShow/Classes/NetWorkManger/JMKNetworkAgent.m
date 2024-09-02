//
//  JMKNetworkAgent.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "JMKNetworkAgent.h"
#import "JMKURLFilter.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <AFNetworking/AFSecurityPolicy.h>

NSString * const BOTNetworkingDidChangeNotification = @"BOTNetworkingDidChangeNotification";


@implementation JMKNetworkAgent

+ (JMKNetworkAgent *)sharedNetAgent {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+  (void)configNetworkEnvironment {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    JMKURLFilter *filter = [[JMKURLFilter alloc] init];
    [config addUrlFilter:filter];
//https://yi-chuangxin.com/api/v2/ycxsx-product/banner/getBanner
    config.baseUrl = @"https://yi-chuangxin.com";
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [self networkChange];
    }];
}

+ (void)configSharkCenter {
//    [TMFSharkCenterConfiguration setLogLevels:1];
//    
//    TMFSharkCenterConfiguration *masterConfiguration = [TMFSharkCenterConfiguration masterConfiguration];
//    masterConfiguration.productID = TMF_PID;
//    masterConfiguration.HTTPURL = TMF_GW_HTTP_URL;
//    
//    masterConfiguration.productKey = TMF_APP_KEY;
//    masterConfiguration.RSAPublicKey = TMF_GW_RKEY;
//    masterConfiguration.SM2PublicKey = TMF_GW_SKEY;
//    
//    masterConfiguration.customerID = TMF_CUSTOM_ID;
//    /** 初始化 Shark Center，如果是首次初始化，则会联网向服务端请求 GUID **/
//    [[TMFSharkCenter masterCenter] initialize];
//    NSLog(@"TMF_APP_KEY = %@", TMF_APP_KEY);
//    NSLog(@"GUID: %@", [TMFSharkCenter masterCenter].GUID);
    
}

+ (void)networkChange {
    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    NSLog(@"网络发生变化 %@", AFStringFromNetworkReachabilityStatus(status));
//    NSLog(@"网络可用:%d - 是否WiFi:%d", [BOTNetworkAgent sharedNetAgent].reachable, [BOTNetworkAgent sharedNetAgent].isWiFi);
    [[NSNotificationCenter defaultCenter] postNotificationName:BOTNetworkingDidChangeNotification object:nil];
}

- (BOOL)isWiFi {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

- (BOOL)reachable {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end
