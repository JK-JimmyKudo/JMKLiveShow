//
//  ZXBNetworkBaseRequest.m
//  JMKLiveShow
//
//  Created by llj on 2024/11/5.
//

#import "ZXBNetworkBaseRequest.h"
#import "YYModel.h"

@implementation ZXBNetworkBaseRequest
/// Base URL，因为一个应用程序中的网络请求的 BaseURL 几乎都是相同的。
- (NSString *)baseUrl {
//    return @"";
//    NSString *baseUrl = @"https://yi-chuangxin.com";
    NSString *baseUrl = @"https://gate-qa.op.laikang.com";

    return baseUrl;
}

/// 请求的 URL 路径
- (NSString *)requestUrl {
//    return [NSString stringWithFormat:@"/ycxsx-product/banner/getBanner"];
//    return  [NSString stringWithFormat:@"/cdp-test/kind/kind/getKindByType/frametype"];
    return [NSString stringWithFormat:@"%@%@",@"/cdp",@"/xjContent/list"];
}

/// 网络请求的超时间隔。默认 60 秒
- (NSTimeInterval)requestTimeoutInterval {
    return 60;
}

/// HTTP 请求方法。默认是 GET
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

/// 请求序列化器类型。默认是 HTTP
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeHTTP;
}

/// 响应序列化器类型。默认是 JSON
- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}

/// 请求参数对象，会根据配置的请求序列化器进行编码。
- (id)requestArgument {
    id arg = self.requestDic;
    return arg ?: @{};
//    return nil;
}

/// 是否允许蜂窝网络。默认 YES
- (BOOL)allowsCellularAccess {
    return YES;
}

/// 是否使用 CDN。默认 NO
- (BOOL)useCDN {
    return NO;
}

/// CDN URL。根据 useCDN 决定是否使用。
- (NSString *)cdnUrl {
    return @"";
}

//- (id)requestArgument {
//     return @{
//             @"uid": _uid,
//             };
// }
@end
