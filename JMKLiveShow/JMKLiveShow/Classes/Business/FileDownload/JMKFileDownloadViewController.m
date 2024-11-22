//
//  JMKFileDownloadViewController.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/26.
//

#import "JMKFileDownloadViewController.h"
#import "JMKFileDownloadCell.h"
#import "HWDownloadModel.h"
#import "HWDataBaseManager.h"
#import "HWHomeCell.h"
#import "HWCacheVC.h"
#import "KNFileDownloadObject.h"
@interface JMKFileDownloadViewController ()<UITableViewDelegate, UITableViewDataSource, VHFileDownloadObjectDelegate>
/// 列表
@property (nonatomic, strong) UITableView *tableView;
/// 数据源
@property (nonatomic, strong) NSMutableArray *dataSource;
/// 页码
@property (nonatomic, assign) NSInteger pageNum;
/// 活动id
@property (nonatomic, copy) NSString *webinar_id;
/// 文件下载列表id
@property (nonatomic, copy) NSString *file_download_menu_id;
/// 文件下载类
@property (nonatomic, strong) VHFileDownloadObject * fileDownload;

@end

@implementation JMKFileDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化布局
    [self setUpMasonry];
    // 获取网络数据
    [self getInfo];

    // 获取缓存
    [self getCacheData];
    
    [[KNFileDownloadObject shareManager]startDownloadTask:nil];
}

#pragma mark - 初始化布局
- (void)setUpMasonry
{
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)getInfo
{
    // 模拟网络数据
    NSArray *testData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testData.plist" ofType:nil]];

    // 转模型
    self.dataSource = [HWDownloadModel mj_objectArrayWithKeyValuesArray:testData];
    
}

- (void)getCacheData
{
    // 获取已缓存数据
    NSArray *cacheData = [[HWDataBaseManager shareManager] getAllCacheData];

    // 这里是把本地缓存数据更新到网络请求的数据中，实际开发还是尽可能避免这样在两个地方取数据再整合
    for (int i = 0; i < self.dataSource.count; i++) {
        HWDownloadModel *model = self.dataSource[i];
        for (HWDownloadModel *downloadModel in cacheData) {
            if ([model.url isEqualToString:downloadModel.url]) {
                self.dataSource[i] = downloadModel;
                break;
            }
        }
    }
    
    
    
    [_tableView reloadData];
}


#pragma mark - 文件列表
- (void)getFileDownloadListWithWebinarId:(NSString *)webinar_id file_download_menu_id:(NSString *)file_download_menu_id
{
//    self.webinar_id = webinar_id;
//    self.file_download_menu_id = file_download_menu_id;
//    
//    __weak __typeof(self)weakSelf = self;
//    [self.fileDownload getFileDownLoadWithWebinarId:webinar_id menu_id:file_download_menu_id complete:^(NSDictionary *config, NSArray<VHFileDownloadListModel *> *file_download_list, NSError *error) {
//        
//        [weakSelf.dataSource removeAllObjects];
//        
//        if (file_download_list) {
//            [weakSelf.dataSource addObjectsFromArray:file_download_list];
//            [weakSelf.tableView reloadData];
//        }
//        
//        if (error) {
//            [VHProgressHud showToast:[NSString stringWithFormat:@"%@",error.localizedDescription]];
//        }
//        
//        [weakSelf.tableView.mj_header endRefreshing];
//    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWHomeCell *cell = [HWHomeCell cellWithTableView:tableView];
    [cell updateViewWithModel:[self.dataSource objectAtIndexSafe: indexPath.row]];
//    cell.model = self.dataSource[indexPath.row];
    cell.model = [self.dataSource objectAtIndexSafe: indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[HWCacheVC alloc] init] animated:YES];
    
    VHFileDownloadListModel * fileDownloadListModel = self.dataSource[indexPath.row];
//
    [self.fileDownload getCheckDownloadWithWebinarId:self.webinar_id menu_id:self.file_download_menu_id file_id:fileDownloadListModel.file_id complete:^(NSString *download_url, NSError *error) {
        
        if (download_url) {
            NSURL * url = [NSURL URLWithString:download_url];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                VHLog(@"%@",success ? @"完成下载" : @"错误");
            }];
        }
        
        if (error) {
            [JMKProgressHud showToast:[NSString stringWithFormat:@"%@",error.localizedDescription]];
        }

    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  100;
}

#pragma mark - 更新文件下载列表
- (void)uploadFileDownLoadWithModel:(VHFileDownLoadUploadModel *)model {
    if ([self.delegate respondsToSelector:@selector(uploadFileDownLoadWithModel:)]) {
        [self.delegate uploadFileDownLoadWithModel:model];
    }
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 999, 999) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.estimatedRowHeight = 80;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        __weak __typeof(self) weakSelf = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf getFileDownloadListWithWebinarId:self.webinar_id file_download_menu_id:self.file_download_menu_id];
        }];
    }

    return _tableView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }

    return _dataSource;
}

- (VHFileDownloadObject *)fileDownload
{
    if (!_fileDownload) {
        _fileDownload = [VHFileDownloadObject new];
        _fileDownload.delegate = self;
    }
    
    return _fileDownload;
}

#pragma mark - 分页
- (UIView *)listView {
    return self.view;
}


@end
