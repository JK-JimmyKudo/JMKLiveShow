//
//  ZXBNetworkBaseRequest.h
//  JMKLiveShow
//
//  Created by llj on 2024/11/5.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXBNetworkBaseRequest : YTKBaseRequest
@property (nonatomic,assign)NSNumber * portalId;
@property (nonatomic,assign)NSNumber *portalType;
@property (nonatomic,assign)NSNumber *userId;
@property (nonatomic,assign)NSNumber *deviceType;
@property (nonatomic,strong) NSDictionary *requestDic;

@end

NS_ASSUME_NONNULL_END
