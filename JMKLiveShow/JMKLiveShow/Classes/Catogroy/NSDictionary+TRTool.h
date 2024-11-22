//
//  NSDictionary+TRTool.h
//  mobileCMS
//
//  Created by 赵言 on 2019/12/25.
//  Copyright © 2019 赵言. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TRTool)

/// 读取Plist文件内的数据
/// @param fileName 文件名称
+ (NSDictionary *)readPlistFileWithFileName:(NSString *)fileName;

- (nullable id)by_ObjectForKey:(NSString *)key;

- (nullable NSString *)convertToJsonData;

/// 带有空格的json类型字符串
- (nullable NSString *)convertToJsonDataWithTheBlankSpace;

/// 字典转字符串（用于控制台输出）
- (NSString *)jsonStringPrettyWithoutEscapingSlashes;
@end

NS_ASSUME_NONNULL_END
