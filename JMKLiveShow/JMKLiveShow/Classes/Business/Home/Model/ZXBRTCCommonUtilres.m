//
//  ZXBRTCCommonUtilres.m
//  JMKLiveShow
//
//  Created by llj on 2024/11/5.
//

#import "ZXBRTCCommonUtilres.h"

@implementation ZXBRTCCommonUtilres

- (NSString *)requestUrl {
    
    
    return [NSString stringWithFormat:@"%@%@",@"/cdp-test",@"/xjContent/list"];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    id arg = self.requestDic;
    return arg ?: @{};
//    return nil;
}

@end
