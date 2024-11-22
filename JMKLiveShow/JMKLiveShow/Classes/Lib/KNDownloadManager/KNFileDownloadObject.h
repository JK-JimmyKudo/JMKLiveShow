//
//  KNDownloadManager.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/6.
//

#import <Foundation/Foundation.h>
#import "KNDownloadListModel.h"
NS_ASSUME_NONNULL_BEGIN


//@class HWDownloadModel;

typedef NS_ENUM(NSInteger, KNDownloadState) {
    KNDownloadStateDefault = 0,  // 默认
    KNDownloadStateDownloading,  // 正在下载
    KNDownloadStateWaiting,      // 等待
    KNDownloadStatePaused,       // 暂停
    KNDownloadStateFinish,       // 完成
    KNDownloadStateError,        // 错误
};



@protocol KNFileDownloadObjectDelegate <NSObject>

/// 更新文件下载列表
- (void)uploadFileDownLoadWithModel:(KNDownloadListModel *)model;

@end


@interface KNFileDownloadObject : NSObject


@property (nonatomic, weak) id <KNFileDownloadObjectDelegate> delegate; ///<代理


// 初始化下载单例，若之前程序杀死时有正在下的任务，会自动恢复下载
+ (instancetype)shareManager;

// 开始下载
- (void)startDownloadTask:(KNDownloadListModel *)model;

// 暂停下载
- (void)pauseDownloadTask:(KNDownloadListModel *)model;

// 删除下载任务及本地缓存
- (void)deleteTaskAndCache:(KNDownloadListModel *)model;


/// 获取控制台/观看端 自定义菜单绑定文件列表
/// - Parameters:
///   - webinarId: 活动id
///   - menu_id: 文件列表菜单id
///   - complete: 完成回调
- (void)getFileDownLoadWithWebinarId:(NSString *)webinarId menu_id:(NSString *)menu_id complete:(void (^)(NSDictionary * config, NSArray <KNDownloadListModel *> *file_download_list, NSError *error))complete;

/// 观看端 获取文件下载地址
/// - Parameters:
///   - webinarId: 活动id
///   - menu_id: 文件列表菜单id
///   - file_id: 文件id
///   - complete: 完成回调
- (void)getCheckDownloadWithWebinarId:(NSString *)webinarId menu_id:(NSString *)menu_id file_id:(NSString *)file_id  complete:(void (^)(NSString * download_url, NSError *error))complete;




@end

NS_ASSUME_NONNULL_END
