//
//  JMKFileDownloadViewController.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/26.
//

#import "JMKBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol JMKileDownloadDelegate <NSObject>

/// 更新文件下载列表
- (void)uploadFileDownLoadWithModel:(VHFileDownLoadUploadModel *)model;

@end


@interface JMKFileDownloadViewController : JMKBaseViewController<JXCategoryListContentViewDelegate>

/// 代理对象
@property (nonatomic, weak) id <JMKileDownloadDelegate> delegate;

/// 获取文件列表
/// - Parameters:
///   - webinar_id: 活动id
///   - file_download_menu_id: 文件下载id
- (void)getFileDownloadListWithWebinarId:(NSString *)webinar_id file_download_menu_id:(NSString *)file_download_menu_id;

@end

NS_ASSUME_NONNULL_END
