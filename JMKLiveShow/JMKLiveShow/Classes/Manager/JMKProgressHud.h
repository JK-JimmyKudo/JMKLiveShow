//
//  JMKProgressHud.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <Foundation/Foundation.h>
//#import <MBProgressHUD/MBProgressHUD.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface JMKProgressHud : NSObject
+ (void)showToast:(NSString *)text;
+ (void)showToast:(NSString *)text offsetY:(CGFloat)offsetY;
+ (void)showToast:(NSString *)text inView:(UIView *)view offsetY:(CGFloat)offsetY;


+ (MBProgressHUD *)showLoading:(NSString *)text;
+ (MBProgressHUD *)showLoading;
+ (void)hideLoading;

+ (MBProgressHUD *)showLoading:(NSString *)text inView:(UIView *)view;
+ (void)hideLoadingInView:(UIView *)view;

+ (MBProgressHUD *)showBackgroundFullLoading;
@end

NS_ASSUME_NONNULL_END
