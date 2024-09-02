//
//  JMKBaseModel.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKBaseModel : NSObject
/// 请求返回状态值 code=0 则请求成功
@property (nonatomic, copy) NSNumber *code;
/// 错误信息提示语
@property (nonatomic, copy) NSString *message;

/// 请求是否成功
- (BOOL)requestSuccess;

@end

NS_ASSUME_NONNULL_END
