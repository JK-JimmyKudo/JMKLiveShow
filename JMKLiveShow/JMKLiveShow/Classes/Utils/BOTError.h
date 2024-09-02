//
//  BOTError.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BOTErrorType) {
    BOTErrorNilValue        = 3001,    // 数据丢失/参数为空
    BOTErrorJSONInvalid     = 3002,    // json model 解析失败
    BOTErrorRequestFail     = 3003,    // 请求失败
};

extern NSString *const BOTErrorDomain;

@interface BOTError : NSError
/// 参数为空
/// @param message 错误信息
+ (instancetype)botErrorNilValueWithMessage:(NSString *)message;

/// 数据解析失败
/// @param message 错误信息
+ (instancetype)botErrorJSONInvalidWithMessage:(NSString *)message;

/// 网络请求失败
/// @param message 错误信息
+ (instancetype)botErrorRequestFailWithMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
