//
//  JMKNetworkConfig.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "JMKURLFilter.h"

@implementation JMKURLFilter

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    NSLog(@"request.baseUrl --- %@",request.baseUrl);

//    if ([request.baseUrl isEqualToString:BOT_REQUEST_HOST_CHAT]) {
//        return originUrl;
//    }
//    
//    if ([request.baseUrl isEqualToString:@"http://81.70.60.27:28082"]) {
//        
//        return [NSString stringWithFormat:@"%@%@", @"http://81.70.60.27:28082",originUrl];
//    }
//    if ([request isKindOfClass:[BOTJSAPIRequestT class]]) {
//        return originUrl;
//    }
//    if ([request isKindOfClass:[BOTVersionCheckRequest class]]) {
//        return originUrl;
//    }
//    if ([request isKindOfClass:[BOTH5VersionCheckRequest class]]) {
//        return originUrl;
//    }
//    
    
    NSString *filterUrl = [NSString stringWithFormat:@"%@", originUrl];
    
    NSLog(@"filterUrl --- %@",filterUrl);
    
    return filterUrl;
}
@end
