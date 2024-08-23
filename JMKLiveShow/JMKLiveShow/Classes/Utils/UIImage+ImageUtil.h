//
//  UIImage+ImageUtil.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ImageUtil)
// 颜色转换成UIImage类型.
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
