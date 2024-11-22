//
//  CrashReportFilter.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/8.
//

#import "CrashReportFilter.h"
#import "KSJSONCodecObjC.h"
#import <KSCrash/KSHTTPMultipartPostBody.h>



@implementation CrashReportFilter
+ (CrashReportFilter*)sink {
    return [[CrashReportFilter alloc]init] ;
}
- (CrashReportFilter*)defaultCrashReportFilterSet{
    return self;
}
//KSCrashReportFilter协议
- (void)filterReports:(NSArray *)reports onCompletion:(KSCrashReportFilterCompletion)onCompletion {
    VHLog(@"reports -- %@",reports);
    NSError *error;
    for (id object in reports) {
        NSData *jsonData = [KSJSONCodec encode:object options:KSJSONEncodeOptionSorted error:&error];
        KSHTTPMultipartPostBody *body = [[KSHTTPMultipartPostBody alloc] init];
        [body appendData:jsonData name:@"formFile" contentType:@"application/json" filename:@"reports.json"];
        VHLog(@"body -- %@",body);
        
        
        
//        [[Network share] uploadCrashByData:[body data] contengType:body.contentType completion:^(NSError * _Nullable error) {
//            kscrash_callCompletion(onCompletion, reports, error == nil, error);
//        }];
    }
    
    
    
}

@end
