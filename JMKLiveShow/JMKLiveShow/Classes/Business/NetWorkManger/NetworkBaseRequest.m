//
//  NetworkBaseRequest.m
//
//  Created by MMM on 2021/9/15.
//

#import "NetworkBaseRequest.h"
#import "AFNetworking/AFURLSessionManager.h"
#import "YYModel.h"
#import "NetworkManager.h"
#import "NSDictionary+TRTool.h"
//#import "AccountManager.h"

@implementation NetworkBaseRequest

#pragma mark - override

/// 请求的BaseURL
- (NSString *)baseUrl {
    
    NSString *kBaseUrl = @"https://gate-qa.op.laikang.com";
    return kBaseUrl;
}

/// 请求方法
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

/// 请求超时间隔，默认是15S
- (NSTimeInterval)requestTimeoutInterval {
    return 15.0;
}

/// 请求序列化器类型。默认是 HTTP
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeHTTP;
}
///// 响应序列化器类型。默认是 JSON
- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}

/// 请求参数
- (nullable id)requestArgument {
    id arg = [self yy_modelToJSONObject];
    return arg ?: @{};
}

/// HTTP请求Header
- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
    
//    NSMutableDictionary *requestSerializers = [NSMutableDictionary dictionary];
//
//        requestSerializers[@"Content-Type"] = @"application/json";
//
////        requestSerializers[@"User-Agent"] = userAgent;
//
//        requestSerializers[@"platform"] = @"iOSApp";
//
//        requestSerializers[@"version"] = [NSString stringWithFormat:@"V-%@", kAppVersion];
    
    
    NSMutableDictionary<NSString *, NSString *> *headerDic = [[NSMutableDictionary alloc] init];
//    headerDic[@"Content-Type"] = @"application/json";
//    headerDic[@"App-Version"] = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
//    headerDic[@"Device-Platform"] = @"iOS";
    
    NSDictionary *tokenDic = [NSDictionary dictionary];
//    XALoginModel *model = [XALoginModel sharedInstance];
//    if (model.token.length) {
//        tokenDic =  @{@"mode":@"user",@"token":model.token,@"mobile":model.mobile,@"uniqueId":model.uuid,@"authorization":[NSString stringWithFormat:@"Bearer %@",model.token]};
//    } else {
//        tokenDic = @{@"mode":@"user"};
//    }
   
    [headerDic addEntriesFromDictionary:tokenDic];
    
    
//    if (AccountManager.shared.accessToken) {
//        headerDic[@"Access-Token"] = AccountManager.shared.accessToken;
//    }

    return headerDic;
}

/// 请求序列化类型
//- (YTKRequestSerializerType)requestSerializerType {
//    return YTKRequestSerializerTypeJSON;
//}

/// 响应序列化类型
//- (YTKResponseSerializerType)responseSerializerType {
//    return YTKResponseSerializerTypeJSON;
//}

/// 需要忽略的属性名数组
+ (NSArray *)ignoreRequestModelPropertyNameArray {
    return nil;
}

#pragma mark - yymodel

/// 屏蔽 NetworkBaseRequest 及父类属性
+ (NSArray *)modelPropertyBlacklist {
    static NSMutableArray *propertyNames = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        propertyNames = [[NSMutableArray alloc] init];
        Class cls = [NetworkBaseRequest class];
        while (cls != nil) {
            unsigned int propertyCount = 0;
            objc_property_t *propertys = class_copyPropertyList(cls, &propertyCount);
            for (int i = 0; i < propertyCount; i++) {
                objc_property_t property = propertys[i];
                const char *propertyName = property_getName(property);
                [propertyNames addObject:[NSString stringWithUTF8String:propertyName]];
            }
            free(propertys);
            
            cls = class_getSuperclass(cls);
            if ([cls isEqual:NSObject.class]) {
                break;
            }
        }
    });
    
    if (![self ignoreRequestModelPropertyNameArray]) {
        return propertyNames;
    } else {
        NSArray *ignoreModelPropertyNameArray = [propertyNames arrayByAddingObjectsFromArray:[self ignoreRequestModelPropertyNameArray]];
        return ignoreModelPropertyNameArray;
    }
}

#pragma mark - public

- (void)startRequest {
    
    ///获取缓存
//    [[NetworkManager shared]startCacheRequest:self];
    
    [[NetworkManager shared] startRequest:self];
}

- (void)startRequestWithSuccess:(SuccessHandler _Nullable)success failure:(FailureHandler _Nullable)failure {
    self.success = success;
    self.failure = failure;
    [self startRequest];
}

- (void)stopRequest {
    [[NetworkManager shared] stopRequest:self];
}

- (__kindof NetworkBaseRequest *)retryRequest {
    NetworkBaseRequest *request = [self yy_modelCopy];
    [request startRequestWithSuccess:self.success failure:self.failure];
    return request;
}

- (void)setUploadConfigWithKey:(NSString *)key
                      fileData:(NSData *)fileData
                      fileName:(NSString *)fileName
                  fileMIMEType:(NSString *)fileMIMEType {
    self.constructingBodyBlock = ^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData
                                    name:key
                                fileName:fileName
                                mimeType:fileMIMEType];
    };
}

- (void)setUploadConfigWithKey:(NSString *)key
                      filePath:(NSString *)filePath
                      fileName:(NSString *)fileName
                  fileMIMEType:(NSString *)fileMIMEType {
    self.constructingBodyBlock = ^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePath] 
                                   name:key
                               fileName:fileName
                               mimeType:fileMIMEType
                                  error:nil];
    };
}

#pragma mark - private

- (NSString *)description {
    NSURLRequest *request = self.currentRequest;
    
    return [NSString stringWithFormat:@"<%@: %p>\n%@ %@\n%@\nBody:\n%@",
            NSStringFromClass([self class]),
            self,
            request.HTTPMethod,
            request.URL,
            [request.allHTTPHeaderFields jsonStringPrettyWithoutEscapingSlashes],
            [self.requestArgument jsonStringPrettyWithoutEscapingSlashes]];
}

@end
