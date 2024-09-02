//
//  JMKBaseRequest.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "JMKBaseRequest.h"
#import "JMKBaseModel.h"
#import "BOTError.h"

@interface JMKBaseRequest ()

@property (nonatomic, strong) NSMutableDictionary *requestParamter;

@end

@implementation JMKBaseRequest


#pragma mark - override
/// 请求序列化类型
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeHTTP;
}
/// 响应序列化类型
- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 30;
}


- (id)requestArgument {
    /// 是否需要添加公共参数，默认 NO
    if ([self needAppendCommonParamters]) {
        [self.requestParamter addEntriesFromDictionary:[self commonParamters]];
    }
    return [self.requestParamter copy];
}


/// 需要忽略的属性名数组
+ (NSArray *)ignoreRequestModelPropertyNameArray {
    return nil;
}


//- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
//    NSMutableDictionary<NSString *, NSString *> *headerDic = [[NSMutableDictionary alloc] init];
//    headerDic[@"App-Version"] = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
//    headerDic[@"Device-Platform"] = @"iOS";
////    if (AccountManager.shared.accessToken) {
////        headerDic[@"Access-Token"] = AccountManager.shared.accessToken;
////    }
//
//    return headerDic;
//}
/// HTTP请求Header
- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *tmpDic = [[super requestHeaderFieldValueDictionary] mutableCopy];
    if (!tmpDic) {
        tmpDic = @{}.mutableCopy;
    }
    NSDictionary *infoDictionary=[[NSBundle mainBundle]infoDictionary];
    NSString *version=[infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [tmpDic setValue:version forKey:@"version"];
    [tmpDic setValue:@"ios" forKey:@"os"];
    [tmpDic setValue:@"ios" forKey:@"plt"];
//    NSString *guid = [TMFSharkCenter masterCenter].GUID;
//    [tmpDic setValue:guid forKey:@"guid"];
//    NSString *uid = [BOTUserManager defaultManager].uid;
//    [tmpDic setValue:uid forKey:@"uid"];
//    NSString *token = [BOTUserManager defaultManager].token;
//    [tmpDic setValue:token forKey:@"access-token"];
    return [tmpDic copy];
}

/// 公共参数
- (NSDictionary *)commonParamters {
    NSMutableDictionary *tmpDic = [NSMutableDictionary dictionary];
    NSDictionary *infoDictionary=[[NSBundle mainBundle]infoDictionary];
    NSString *version=[infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [tmpDic setValue:version forKey:@"version"];
    [tmpDic setValue:@"ios" forKey:@"os"];
    [tmpDic setValue:@"ios" forKey:@"plt"];
//    NSString *guid = [TMFSharkCenter masterCenter].GUID;
//    [tmpDic setValue:guid forKey:@"guid"];
//    NSString *uid = [BOTUserManager defaultManager].uid;
//    [tmpDic setValue:uid forKey:@"uid"];
    return tmpDic.copy;
}




/// 发起网络请求
/// @param complete 回调
- (void)requestWithComplete:(BOTRequestCompleted)complete {
    [self requestWithModelClass:nil complete:complete];
}
/// 发起网路请求
/// @param modelClass 目标 Model Class
/// @param complete 回调
- (void)requestWithModelClass:(Class)modelClass complete:(BOTRequestCompleted)complete {
    
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        [self safeCallBackWithModelClass:modelClass response:request.responseObject complete:complete];
    
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {

        [self safeCallBackWithError:request.error complete:complete];
    }];
}

/// 取消一个网络请求
- (void)cancelCurrentRequest {
    [[YTKNetworkAgent sharedAgent] cancelRequest:self];
}

/// 取消全部网络请求
+ (void)cancelAllRequest {
    [[YTKNetworkAgent sharedAgent] cancelAllRequests];
}

/// 是否需要添加公共参数，默认 NO
- (BOOL)needAppendCommonParamters {
    return NO;
}


#pragma mark - private

- (void)safeCallBackWithModelClass:(Class)modelClass response:(id)response complete:(BOTRequestCompleted)complete {

//    if(![self isKindOfClass: [BOTLoginStatusRequest class]]){
        NSLog(@"[Request class]---- %@ currentRequestUrl --- %@  requestArgument --- %@  \n response:%@", [self class], [self currentRequest].URL, [[self requestArgument] mj_JSONString], [response mj_JSONString]);
//        NSDictionary *content = [BOTGlobalTools SM4DecryptWithString:response];
//        
//        DSLog(@"content ---  %@",content);
//        DSLog(@"responseHeaders ---  %@",self.responseHeaders);
//
//    }

    if (complete) {
        if ([response isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *tmpRes = [NSMutableDictionary dictionaryWithDictionary:response];
            NSNumber *code = [tmpRes valueForKey:@"code"];
            if ([code isKindOfClass:[NSNumber class]]) {
                NSString *msg = [[self codeToStringDic] objectForKey:code];
                if (msg) {
                    [tmpRes setValue:msg forKey:@"msg"];
                    response = tmpRes.copy;
                }
            }
        }
        // 把原始 JSON 数据转为 Model
        if (modelClass) {
//            JMKBaseModel *model = [modelClass yy_modelWithJSON:response];
            JMKBaseModel *model = [modelClass mj_objectWithKeyValues:response];
            
            if ([model requestSuccess]) {
                complete(model, nil);
                complete = nil;
                return;
            }
            
            [self configErrorMsgWithModel:model];
            if (model.message) {
                // 处理 msg 显示
                BOTError *error = [BOTError botErrorRequestFailWithMessage:model.message];
                complete(model, error);
                complete = nil;
                return;
            }
            BOTError *error = [BOTError botErrorJSONInvalidWithMessage:@"数据返回失败，请稍后再试"];
            complete(nil, error);
            complete = nil;
            return;
        }
        // 回调原始数据
        complete(response, nil);
        complete = nil;
        return;
    }
    NSString *message = [NSString stringWithFormat:@"%@ complete block is nil", NSStringFromClass([self class])];

}

- (void)safeCallBackWithError:(NSError *)error complete:(BOTRequestCompleted)complete {

    if (complete) {
        if (error.code == -1009) {
            NSMutableDictionary *info = error.userInfo.mutableCopy;
            [info setValue:@"网络异常，请稍后再试" forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:error.domain code:error.code userInfo:info];
        }
        complete(nil, error);
        complete = nil;
        return;
    }
    NSString *message = [NSString stringWithFormat:@"%@ complete block is nil", NSStringFromClass([self class])];
  
}

- (void)configErrorMsgWithModel:(JMKBaseModel *)model {
    
    
    
    NSInteger code = model.code.integerValue;
    switch (code) {
        case 500:
            model.message = @"服务器异常，请稍后再试";
            break;
        case 6111:
            model.message = @"用户权限不足";
            break;
        case 21140:
            model.message = @"新增失败，已存在该常用联系人";
            break;
        case 21113:
        case 21114:
        case 21115:
        case 21116:
            model.message = @"实名认证未通过";
            break;
        default:
            break;
    }
}

#pragma mark - getter

- (NSMutableDictionary *)requestParamter {
    if (!_requestParamter) {
        _requestParamter = [NSMutableDictionary dictionary];
    }
    return _requestParamter;
}

- (BOOL)statusCodeValidator {
    if (self.responseObject) {
        JMKBaseModel *model = [JMKBaseModel mj_objectWithKeyValues:self.responseObject];
        // 需要退出登录
        if ([self needLogoutWithCode:model.code]) {
            // 退出登录
//            [[BOTUserManager defaultManager] logoutSuccess];
            return NO;
        }
        if ([model.code isEqual:@606] || [model.code isEqual:@607]) {
            // 需要刷新 token
#if DEBUG
            dispatch_async(dispatch_get_main_queue(), ^{
//                [QMUITips showWithText:@"Token 已失效"];
            });
#endif
//            [[BOTUserManager defaultManager] needRefreshTokenNow];
            return NO;
        }
    }
    return [super statusCodeValidator];
}


/*
 606 token 过期
 607 token 不匹配
 608 refresh token 过期
 609 refresh token 不匹配
 610 token 失效，异地登录
 */
- (BOOL)needLogoutWithCode:(NSNumber *)code {
    NSArray *codeArray = @[@608, @609, @610];
    return [codeArray containsObject:code];
}

- (NSDictionary *)codeToStringDic {
    return @{
        @11000 : @"日志不合法",
        @11101 : @"电话号格式不规范",
        @11102 : @"电话号码已注册",
        @11103 : @"验证码发送超限，请明天再试",
        @11104 : @"对于同一IP，每天发送短信验证码10次以上后，需要通过验证码验证",
        @11105 : @"验证码无效",
        @11106 : @"发送频繁，请重新发送",
        @11107 : @"验证错误太多，请重新发送",
        @11108 : @"验证码错误",
        @11109 : @"密码错误",
        @11111 : @"用户不存在",
        @11112 : @"验证码发送失败",
        @11113 : @"实名认证异常",
        @11114 : @"姓名和身份证号码不一致",
        @11115 : @"身份证号码不正确",
        @11116 : @"姓名不正确",
        @11117 : @"证书库服务异常",
        @11118 : @"证书库中没有该身份证记录",
        @11119 : @"账户被阻止",
        @11120 : @"密码登录失败10次以上",
        @11121 : @"帐户/密码错误，您可以重试{0}次",
        @11122 : @"密码登录错误两次后，每次登录都需要通过验证码，然后单击登录按钮",
        @11123 : @"人脸核体异常",
        @11124 : @"电话未注册",
        @11125 : @"今日错误已达上限请明天再试",
        @11126 : @"微信授权失败",
        @11127 : @"QQ授权失败",
        @11128 : @"未能获得微信用户信息",
        @11129 : @"未能获得QQ用户信息",
        @11130 : @"面部照片核验失败",
        @11131 : @"目前微信绑定，无需多次绑定",
        @11132 : @"目前微信已绑定其他账号",
        @11133 : @"目前微信绑定，无需多次绑定",
        @11134 : @"目前微信已绑定其他账号",
        @11135 : @"身份验证失败",
        @11136 : @"未通过验证",
        @11137 : @"手机未绑定",
        @11138 : @"证件号码每天只能验证五次",
        @11139 : @"用户需要身份验证",
        @11140 : @"收藏夹已存在",
        @11141 : @"验证通过，无需再次验证",
        @21000 : @"日志不合法",
        @21101 : @"电话号格式不规范",
        @21102 : @"电话号码已注册",
        @21103 : @"验证码发送超限，请明天再试",
        @21104 : @"对于同一IP，每天发送短信验证码10次以上后，需要通过验证码验证",
        @21105 : @"验证码无效",
        @21106 : @"发送频繁，请重新发送",
        @21107 : @"验证错误太多，请重新发送",
        @21108 : @"验证码错误",
        @21109 : @"密码错误",
        @21111 : @"用户不存在",
        @21112 : @"验证码发送失败",
        @21113 : @"实名认证异常",
        @21114 : @"姓名和身份证号码不一致",
        @21115 : @"身份证号码不正确",
        @21116 : @"姓名不正确",
        @21117 : @"证书库服务异常",
        @21118 : @"证书库中没有该身份证记录",
        @21119 : @"账户被阻止",
        @21120 : @"密码登录失败10次以上",
        @21121 : @"帐户/密码错误，您可以重试{0}次",
        @21122 : @"密码登录错误两次后，每次登录都需要通过验证码，然后单击登录按钮",
        @21123 : @"人脸核体异常",
        @21124 : @"电话未注册",
        @21125 : @"今日错误已达上限请明天再试",
        @21126 : @"微信授权失败",
        @21127 : @"QQ授权失败",
        @21128 : @"未能获得微信用户信息",
        @21129 : @"未能获得QQ用户信息",
        @21130 : @"面部照片核验失败",
        @21131 : @"目前微信绑定，无需多次绑定",
        @21132 : @"目前微信已绑定其他账号",
        @21133 : @"目前微信绑定，无需多次绑定",
        @21134 : @"目前微信已绑定其他账号",
        @21135 : @"身份验证失败",
        @21136 : @"未通过验证",
        @21137 : @"手机未绑定",
        @21138 : @"证件号码每天只能验证五次",
        @21139 : @"用户需要身份验证",
        @21140 : @"收藏夹已存在",
        @21141 : @"验证通过，无需再次验证",
        @21169 : @"新密码不能与当前密码一致",
    };
}



@end
