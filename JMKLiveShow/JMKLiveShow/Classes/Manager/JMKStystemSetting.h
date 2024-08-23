//
//  JMKStystemSetting.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define DEMO_Setting [JMKStystemSetting sharedSetting]

@interface JMKStystemSetting : NSObject

+ (JMKStystemSetting *)sharedSetting;

/// AppKey
@property (nonatomic, copy) NSString *appKey;
/// App SecretKey
@property (nonatomic, copy) NSString *appSecretKey;
/// host
@property (nonatomic, copy) NSString *host;
/// apihost
@property (nonatomic, copy) NSString *apihost;
/// webhost
@property (nonatomic, copy) NSString *webhost;
/// webView
@property (nonatomic, copy) NSString *webView;
/// rsaPrivateKey
@property (nonatomic, copy) NSString *rsaPrivateKey;
/// 发直播活动ID
@property (nonatomic, copy) NSString *activityID;
/// 账号
@property (nonatomic, copy) NSString *account;
/// 密码
@property (nonatomic, copy) NSString *password;
/// 三方登录账号
@property (nonatomic, copy) NSString *third_Id;
/// 三方登录密码
@property (nonatomic, copy) NSString *third_nickName;
/// 三方登录头像
@property (nonatomic, copy) NSString *third_avatar;

@end

NS_ASSUME_NONNULL_END
