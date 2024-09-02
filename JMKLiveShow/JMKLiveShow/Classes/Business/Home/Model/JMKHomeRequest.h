//
//  BOTError.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "JMKBaseRequest.h"
#import "BOTPostRequest.h"
NS_ASSUME_NONNULL_BEGIN

@interface JMKHomeRequest : BOTPostRequest
- (instancetype)initWithInfo:(NSDictionary *)info;

// 业务类型:1,护照/2,旅行证/3,公证/4,认证/5,婚姻登记/6,签证/7,海外养老金资格认证/8,APEC商务旅行卡/9,认证查验
- (instancetype)initWithBusinessType:(NSString *)businessType;

/// 根据订单号获取订单详情，重新发起时
/// @param orderNumber 订单号
- (instancetype)initWithOrderNumber:(NSString *)orderNumber;

@end

NS_ASSUME_NONNULL_END
