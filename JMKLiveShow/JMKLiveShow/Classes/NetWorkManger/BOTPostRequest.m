//
//  BOTPostRequest.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "BOTPostRequest.h"

@implementation BOTPostRequest
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
@end
