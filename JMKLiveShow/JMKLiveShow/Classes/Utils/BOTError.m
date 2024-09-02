//
//  BOTError.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "BOTError.h"
NSString* const BOTErrorDomain = @"com.botbrain.error";
@implementation BOTError

+ (instancetype)botErrorNilValueWithMessage:(NSString *)message {
    return [self botErrorWithCode:BOTErrorNilValue message:message];
}

+ (instancetype)botErrorJSONInvalidWithMessage:(NSString *)message {
    return [self botErrorWithCode:BOTErrorJSONInvalid message:message];
}

+ (instancetype)botErrorRequestFailWithMessage:(NSString *)message {
    return [self botErrorWithCode:BOTErrorRequestFail message:message];
}

+ (instancetype)botErrorWithCode:(BOTErrorType)code message:(NSString *)message {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:message forKey:NSLocalizedDescriptionKey];
    return [BOTError errorWithDomain:BOTErrorDomain code:code userInfo:dic.copy];
}
@end
