//
//  KNDownloadListModel.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KNDownloadListModel : NSObject
/// 文件名称
@property (nonatomic , copy) NSString              * file_name;
/// 文件大小
@property (nonatomic , copy) NSString              * file_size;
/// 文件类型
@property (nonatomic , copy) NSString              * file_ext;
/// 文件id
@property (nonatomic , copy) NSString              * file_id;
/// 文件类型
@property (nonatomic , copy) NSString              * file_type;
/// 文件简介
@property (nonatomic , copy) NSString              * file_desc;
/// 文件icon图片
@property (nonatomic , copy) NSString              * img_url;

@end

NS_ASSUME_NONNULL_END
