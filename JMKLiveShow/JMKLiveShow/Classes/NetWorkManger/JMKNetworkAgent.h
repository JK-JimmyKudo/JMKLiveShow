//
//  JMKNetworkAgent.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const BOTNetworkingDidChangeNotification;

@interface JMKNetworkAgent : NSObject

+ (JMKNetworkAgent *)sharedNetAgent;

@property (nonatomic, assign) BOOL reachable;
@property (nonatomic, assign) BOOL isWiFi;

/**
 配置全局的网络参数
 */
+  (void)configNetworkEnvironment;

+ (void)configSharkCenter;

@end

NS_ASSUME_NONNULL_END
