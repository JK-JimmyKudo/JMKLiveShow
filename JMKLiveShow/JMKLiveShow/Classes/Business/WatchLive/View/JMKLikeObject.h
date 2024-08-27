//
//  JMKLikeObject.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKLikeObject : UIButton
/// 初始化
/// - Parameters:
///   - obj: 对象
///   - webinarInfoData: 房间详情
- (void)requestObject:(NSObject *)obj webinarInfoData:(VHWebinarInfoData *)webinarInfoData;

@end

NS_ASSUME_NONNULL_END
