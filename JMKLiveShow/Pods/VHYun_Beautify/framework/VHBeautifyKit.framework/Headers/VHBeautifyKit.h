//
//  VHBeautifyKit.h
//  VHBeautifyKit
//
//  Created by LiGuoliang on 2021/12/8.
//

#import <Foundation/Foundation.h>
#import "IVHBeautifyModule.h"

@interface VHBeautifyKit : NSObject

/// 美颜开关
@property (nonatomic) BOOL enable;

/**
 1.
 /private/var/containers/Bundle/Application/3BA34442-F777-4A5E-88F1-E786B9E9BF7E/VHSDKDemo.app/ai_face_processor.bundle
 
 这个是默认app的资源路径，取自mainBundle之下,当path传递空字符串，用的是这套默认逻辑


 2.
 /private/var/containers/Bundle/Application/3BA34442-F777-4A5E-88F1-E786B9E9BF7E/VHSDKDemo.app/Frameworks/com_amway_content.framework/ai_face_processor.bundle

 Flutter会统一管理三方库，使用Frameworks做中间层
 这样客户使用的时候 path:@"Frameworks/com_amway_content.framework/" 即可
 */
/// 初始化美颜 (❗️请记得销毁)
+ (instancetype)beautifyManagerWithModuleClass:(Class<IVHBeautifyModule>)moduleClass faceBundlePath:(NSString *)faceBundlePath;

/// 销毁
+ (void)destroy;

/// 获取当前 module
- (id<IVHBeautifyModule>)currentModule;

/// 调整采集图像正方向(❗️RTC中必须使用)
/// 需要按照OpenGL采集方向设置，目前VH_RTC应使用3
/// @param orientation 画面方向:上0 左1 下2 右3
- (void)setCaptureImageOrientation:(NSUInteger)orientation;

/// 设置美颜效果
/// @param key 美颜效果控制项
/// @param value 美颜效果值
- (void)setEffectKey:(VHBEffectKey)key toValue:(id)value;

- (instancetype)init NS_UNAVAILABLE;

+ (NSString *)getSDKVersion;

@end
