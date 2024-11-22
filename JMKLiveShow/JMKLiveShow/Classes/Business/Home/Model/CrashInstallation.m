//
//  CrashInstallation.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/8.
//

#import "CrashInstallation.h"
#import <KSCrash/KSCrashInstallation+Private.h>
@implementation CrashInstallation

+(CrashInstallation *)share {
    static CrashInstallation *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[CrashInstallation alloc] init];
    });
    return shareManager;
}


- (id)init {
    self = [super initWithRequiredProperties:@[]];
    return self;
}

- (id<KSCrashReportFilter>)sink {
    return [[CrashReportFilter alloc]init];
}


- (void)uploadCrashLog:(nullable CrashBlock)completion {
    CrashInstallation *installation = [CrashInstallation share];
    [installation install];
    // 上传成功删除本地日志
    [KSCrash sharedInstance].deleteBehaviorAfterSendAll = KSCDeleteOnSucess;
    // 自定义user json数据
    [KSCrash sharedInstance].userInfo = @{
        @"MachineId": @"8179C19D-5ADC-4C9F-A768-99999999",
        @"PackageId": @"包名",
        @"PatchVersionCode": @(1),
        @"Type": @"iOS",
        @"VersionCode": @"版本号"
    };
    
    NSArray*reportIDs = [[KSCrash sharedInstance]reportIDs];

    VHLog(@"reportIDs -- %@",reportIDs);
    
   NSDictionary* cashInfo = [[KSCrash sharedInstance] reportWithID: 0];
    
    VHLog(@"cashInfo -- %@",cashInfo);
    
    
    
    VHLog(@"[KSCrash sharedInstance].userInfo -- %@",[KSCrash sharedInstance].userInfo);
    
    [installation sendAllReportsWithCompletion:^(NSArray *filteredReports, BOOL completed, NSError *error) {
        
        
        VHLog(@"filteredReports -- %@",filteredReports);
        VHLog(@"completed -- %d",completed);

        
        if (completion) {
            completion(error);
        }
    }];
}

@end
