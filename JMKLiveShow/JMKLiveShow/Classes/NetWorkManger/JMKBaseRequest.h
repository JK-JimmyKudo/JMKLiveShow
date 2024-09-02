//
//  JMKBaseRequest.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BOTRequestCompleted)(id responseObject, NSError *error);

@interface JMKBaseRequest : YTKBaseRequest

@property (nonatomic, strong, readonly) NSMutableDictionary *requestParamter;
/// 发起网络请求
/// @param complete 回调
- (void)requestWithComplete:(BOTRequestCompleted)complete;

/// 发起网路请求
/// @param modelClass 目标 Model Class
/// @param complete 回调
- (void)requestWithModelClass:(Class)modelClass complete:(BOTRequestCompleted)complete;

/// 是否需要添加公共参数，默认 NO
- (BOOL)needAppendCommonParamters;
/// 取消一个网络请求
- (void)cancelCurrentRequest;
/// 取消全部网络请求
+ (void)cancelAllRequest;

@end

NS_ASSUME_NONNULL_END
