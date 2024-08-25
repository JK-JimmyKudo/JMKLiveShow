//
//  JMKInfoMationM.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <Foundation/Foundation.h>
#import "VHLiveSDK/VHWebinarInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface JMKWebinarBaseInfo : NSObject

+ (void)getWebinarBaseInfoWithWebinarId:(NSString *)webinarId
                                success:(void (^)(VHWebinarBaseInfo *baseInfo))success
                                   fail:(void (^)(NSError *error))fail;
@end

NS_ASSUME_NONNULL_END
