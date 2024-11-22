//
//  BOTError.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "JMKHomeRequest.h"
@interface JMKHomeRequest ()

@property (nonatomic, copy) NSString *businessType;
@property (nonatomic, copy) NSString *orderNo;

@end
@implementation JMKHomeRequest

- (instancetype)initWithInfo:(NSDictionary *)info {
    if (self = [super init]) {
        [self.requestParamter setValuesForKeysWithDictionary:info];
    }
    return self;
}
- (instancetype)initWithBusinessType:(NSString *)businessType {
    if (self = [super init]) {
        self.businessType = businessType;
    }
    return self;
}

- (instancetype)initWithOrderNumber:(NSString *)orderNumber {
    if (self = [super init]) {
        self.orderNo = orderNumber;
    }
    return self;
}

//{
//  "portalId": 4,
//  "portalType": 2,
//  "userId": 0,
//  "deviceType": 2
//}m

//- (NSString *)requestUrl {
////    if (self.orderNo) {
////        return [NSString stringWithFormat:@"/as-business/v1/travel-certificate/order/info/proclaimed/%@/%@", self.orderNo, self.resource];
////    }
//    return [NSString stringWithFormat:@"/ycxsx-product/banner/getBanner"];
//}

- (NSString *)requestUrl {

    return [NSString stringWithFormat:@"/cdp-test/kind/kind/getKindByType/frametype"];
}

@end
