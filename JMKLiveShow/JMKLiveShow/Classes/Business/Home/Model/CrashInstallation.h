//
//  CrashInstallation.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/8.
//

#import <Foundation/Foundation.h>
#import "CrashReportFilter.h"
#import <KSCrash/KSCrashInstallation.h>
NS_ASSUME_NONNULL_BEGIN
//新建CrashInstallation类继承KSCrashInstallation，
//重写父类方法 - (id<KSCrashReportFilter>)sink，
//该方法返回CrashReportFilter上报过滤器。

typedef void(^CrashBlock)(NSError *error);

@interface CrashInstallation : KSCrashInstallation

+(CrashInstallation *)share;

- (void)uploadCrashLog:(nullable CrashBlock)completion ;

@end

NS_ASSUME_NONNULL_END
