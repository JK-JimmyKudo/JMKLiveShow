//
//  KNDownloadManager.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/6.
//

#import "KNFileDownloadObject.h"


@interface KNFileDownloadObject ()<NSURLSessionDelegate,NSURLSessionTaskDelegate>


@end


@implementation KNFileDownloadObject

// 初始化下载单例，若之前程序杀死时有正在下的任务，会自动恢复下载
+ (instancetype)shareManager{
    static KNFileDownloadObject *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

// 开始下载
- (void)startDownloadTask:(KNDownloadListModel *)model{
    [self downloadRequest];
}

// 暂停下载
- (void)pauseDownloadTask:(KNDownloadListModel *)model{
    
}


// 删除下载任务及本地缓存
- (void)deleteTaskAndCache:(KNDownloadListModel *)model{
    
}







/// 获取控制台/观看端 自定义菜单绑定文件列表
/// - Parameters:
///   - webinarId: 活动id
///   - menu_id: 文件列表菜单id
///   - complete: 完成回调
- (void)getFileDownLoadWithWebinarId:(NSString *)webinarId menu_id:(NSString *)menu_id complete:(void (^)(NSDictionary * config, NSArray <KNDownloadListModel *> *file_download_list, NSError *error))complete{
 
    
    
}

/// 观看端 获取文件下载地址
/// - Parameters:
///   - webinarId: 活动id
///   - menu_id: 文件列表菜单id
///   - file_id: 文件id
///   - complete: 完成回调
- (void)getCheckDownloadWithWebinarId:(NSString *)webinarId menu_id:(NSString *)menu_id file_id:(NSString *)file_id  complete:(void (^)(NSString * download_url, NSError *error))complete{
    
    
    
}



- (void)downloadRequest{
    //创建请求
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/cn/ipad-pro/how-to/2017/a0f629be_c30b_4333_942f_13a221fc44f3/films/dock/ipad-pro-dock-cn-20160907_1280x720h.mp4"]];
    
    //创建配置（决定要不要将数据和响应缓存在磁盘）
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //创建会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDownloadTask * downloadtask = [session downloadTaskWithRequest:request];
    [downloadtask resume];
}

//1. downloadTask下载过程中会执行
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    NSLog(@"下载中...");
    NSLog(@"写入数据大小%lld，总写入数据大小%lld，总期望数据大小%lld",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    //监听下载的进度
    // 更新当前下载大小
    NSUInteger tmpFileSize = (NSUInteger)totalBytesWritten;
    NSUInteger totalFileSize = (NSUInteger)totalBytesExpectedToWrite;
    
    CGFloat progress = 1.0 * tmpFileSize / totalFileSize;
    NSLog(@"progress ... %f",progress);

}
//2.downloadTask下载完成的时候会执行
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"下载完成");
       //该方法内部已经完成了边接收数据边写沙盒的操作，解决了内存飙升的问题
    //对数据进行使用，或者保存（默认存储到临时文件夹 tmp 中，需要剪切文件到 cache）
    
    //保存
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:filePath] error:nil];

    //使用
    NSData * data = [NSData dataWithContentsOfURL:location.filePathURL];
    UIImage * image = [UIImage imageWithData:data];
    UIImageWriteToSavedPhotosAlbum(image, nil,nil,nil);
}
//3.请求完成或者是失败的时候调用(Session层次的Task完成的事件)
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    NSLog(@"请求完成或者是失败");
}
@end
