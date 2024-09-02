//
//  JMKBaseModel.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "JMKBaseModel.h"

@implementation JMKBaseModel
- (BOOL)requestSuccess {
    return [self.code isEqual:@(200)];
}

//- (NSString *)description {
//    return [self yy_modelDescription];
//}

//-(NSString *)description{
//    return  [self mj_JSONObject];
//}
@end
