//
//  JMKWatchLiveViewController.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "JMKWatchLiveViewController.h"
#import "JMKWatchVideoView.h"
#import "JMKWatchLiveBottomView.h"
#import "JMKFoldButton.h"
@interface JMKWatchLiveViewController ()
// 控件
/// 分页控件
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
/// 分页详情
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
/// 分页数据
@property (nonatomic, strong) NSMutableArray *listContainerArray;
/// 菜单
@property (nonatomic, strong) JMKFoldButton *foldBtn;
/// 直播播放器
@property (nonatomic, strong) JMKWatchVideoView *watchVideoView;
///// 互动播放器
//@property (nonatomic, strong) VHInavView *inavView;
///// 聊天View
//@property (nonatomic, strong) VHChatView *chatView;
///// 文档
//@property (nonatomic, strong) VHDocViewController *docViewController;
///// 问答
//@property (nonatomic, strong) VHQAView *vhQAView;
///// 简介
//@property (nonatomic, strong) VHIntroView *introView;
///// 章节打点
//@property (nonatomic, strong) VHRecordChapter *recordChapterView;
///// 精彩时刻
//@property (nonatomic, strong) VHVideoPointView *videoPointView;
///// 精彩片段
//@property (nonatomic, strong) VHRecordListVC * recordListVC;
//
//@property (nonatomic, strong) NSArray<VHRecordListModel *> *recordList;
//
///// 文件下载
//@property (nonatomic, strong) VHFileDownloadVC *fileDownloadVC;
///// 底部工具
@property (nonatomic, strong) JMKWatchLiveBottomView *bottomView;
///// 礼物类
//@property (nonatomic, strong) VHallGiftObject *giftObject;
///// 礼物弹窗
//@property (nonatomic, strong) VHFashionStyleGiftListView *giftListView;
///// 问卷列表
//@property (nonatomic, strong) VHSurveyListView *surveyListView;
///// 公告
//@property (nonatomic, strong) VHAnnouncementView *announcementView;
///// 公告列表
//@property (nonatomic, strong) VHAnnouncementList *announcementList;
///// 推屏卡片
//@property (nonatomic, strong) VHPushScreenCardList *pushScreenCardList;
///// 申请互动连麦弹窗
//@property (nonatomic, strong) VHInavApplyAlertView *inavApplyAlertView;
///// 签到
//@property (nonatomic, strong) VHSignInAlertView *signInAlertView;
///// 抽奖
//@property (nonatomic, strong) VHLottery *vhLottery;
///// 快问快答
//@property (nonatomic, strong) VHExamObject *vhExam;
//
//// 赋值
///// 问答名称
//@property (nonatomic, copy) NSString *questionName;
///// 下载文件名称
//@property (nonatomic, copy) NSString *fileDownloadName;
//
//// 标识
///// 标识当前直播还是互动
@property (nonatomic, assign) BOOL isLive;
@property (nonatomic, assign) BOOL isOpenDoc;
@property (nonatomic, assign) BOOL isOpenQA;
@property (nonatomic, assign) BOOL isOpenRecordChapter;
@property (nonatomic, assign) BOOL isOpenVideoPoint;
@property (nonatomic, assign) BOOL isOpenFileDownload;
@property (nonatomic, assign) BOOL isHaveGoods;
@property (nonatomic, assign) BOOL isFull;
@property (nonatomic, assign) BOOL isDocFull;
@property (nonatomic, assign) BOOL isVideoFull;

@end

@implementation JMKWatchLiveViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 强制竖屏
    [self clickFullIsSelect:NO];
    // 设为YES则保持常亮，不自动锁屏，默认为NO会自动锁屏
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // 设为YES则保持常亮，不自动锁屏，默认为NO会自动锁屏
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setWithUI];
}

#pragma mark - 设置样式
- (void)setWithUI
{
    [self.watchVideoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo((Screen_Width < Screen_Height ? Screen_Width : Screen_Height) * 9 / 16);
    }];

    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.watchVideoView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];

    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(47 + SAFE_BOTTOM);
    }];

    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.categoryView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
    }];

    [self.foldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-47 - SAFE_BOTTOM - 15);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
}



#pragma mark 屏幕旋转
- (void)clickFullIsSelect:(BOOL)isSelect
{
    // 只有直播可以切换横竖屏
//    if (self.isLive) {
//        // 切换全屏 横竖屏刷新布局
//        [self screenChangeWithIsFull:isSelect];
//    }
}

#pragma mark - 屏幕旋转
- (void)screenChangeWithIsFull:(BOOL)isFull
{
    // 状态一致不需要在执行
//    if (self.isVideoFull == isFull) {
//        return;
//    }

//    // 记录状态
//    self.isVideoFull = isFull;
//
//    // 旋转
//    [self vcWithIsFull:isFull];
//
//    // 更多工具显示状态
//    [self foldBtnIsHidden];
//
//    // 调整播放器
//    if (isFull) {
//        [_watchVideoView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.right.bottom.mas_equalTo(0);
//        }];
//    } else {
//        [_watchVideoView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.right.mas_equalTo(0);
//            make.height.mas_equalTo((Screen_Width < Screen_Height ? Screen_Width : Screen_Height) * 9 / 16);
//        }];
//    }
}

#pragma mark - JXCategoryViewDelegate
#pragma mark 选中
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index
{
    NSString *title = self.listContainerArray[index];

    // 问卷操作
//    [self.bottomView participateInIsChat:![title isEqualToString:self.questionName]];
//    // 聊天 问卷操作
//    [self bottomWithHidden:([title isEqualToString:@"聊天"] || [title isEqualToString:self.questionName]) ? NO : YES];
//    // 更多工具显示状态
//    [self foldBtnIsHidden];
}

#pragma mark - JXCategoryListContainerViewDelegate
#pragma mark 返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.listContainerArray.count;
}

#pragma mark 根据下标 index 返回对应遵守并实现 `JXCategoryListContentViewDelegate` 协议的列表实例
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    NSString *title = self.listContainerArray[index];

//    if ([title isEqualToString:@"聊天"]) {
//        return self.chatView;
//    } else if ([title isEqualToString:@"文档"]) {
//        return self.docViewController;
//    } else if ([title isEqualToString:@"简介"]) {
//        return self.introView;
//    } else if ([title isEqualToString:self.questionName]) {
//        return self.vhQAView;
//    } else if ([title isEqualToString:@"章节"]) {
//        return self.recordChapterView;
//    } else if ([title isEqualToString:@"精彩时刻"]) {
//        return self.videoPointView;
//    } else if ([title isEqualToString:@"精彩片段"]) {
//        return self.recordListVC;
//    } else if ([title isEqualToString:self.fileDownloadName]) {
//        return self.fileDownloadVC;
//    }

    return nil;
}


#pragma mark - 懒加载
- (JXCategoryTitleView *)categoryView
{
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleView alloc] init];
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.delegate = self;
        _categoryView.titleColor = [UIColor colorWithHex:@"#222222"];
        _categoryView.titleSelectedColor = [UIColor colorWithHex:@"#666666"];
        _categoryView.averageCellSpacingEnabled = NO;
        _categoryView.selectedAnimationEnabled = NO;
        _categoryView.contentScrollViewClickTransitionAnimationEnabled = NO;
        _categoryView.titles = self.listContainerArray;
        _categoryView.listContainer = self.listContainerView;
        _categoryView.collectionView.accessibilityLabel = VHTests_Menus_View;
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorWidth = 20;
        lineView.indicatorHeight = 3;
        lineView.indicatorColor = JMKMainColor;
        lineView.indicatorCornerRadius = 0;
        _categoryView.indicators = @[lineView];
        [self.view addSubview:_categoryView];
    }

    return _categoryView;
}

- (JXCategoryListContainerView *)listContainerView
{
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_CollectionView delegate:self];
        _listContainerView.scrollView.scrollEnabled = NO;
        [self.view addSubview:_listContainerView];
    }

    return _listContainerView;
}

- (NSMutableArray *)listContainerArray
{
    if (!_listContainerArray) {
        _listContainerArray = [NSMutableArray arrayWithObjects:@"聊天", @"简介", nil];
    }

    return _listContainerArray;
}

- (JMKFoldButton *)foldBtn
{
    if (!_foldBtn) {
//        NSArray *arr = @[@"问卷", @"公告",@"推屏卡片"];
//        NSMutableArray *datas = [NSMutableArray arrayWithCapacity:arr.count];
//
//        for (NSString *title in arr) {
//            VHFoldButtonItem *item = [[VHFoldButtonItem alloc]init];
//            item.title = title;
//            [datas addObject:item];
//        }
//
        _foldBtn = [[JMKFoldButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//        _foldBtn.hidden = YES;
//        _foldBtn.foldButton.accessibilityLabel = VHTests_Fold_ClickBtn;
        [self.view addSubview:_foldBtn];
//
//        [_foldBtn configDatas:datas];
//
//        __weak __typeof(self) weakSelf = self;
//        [_foldBtn didSelectedWithHandler:^(VHFoldButtonItem *obj, NSInteger index) {
//            VHLog(@"%@", obj.title);
//
//            if ([obj.title isEqualToString:@"问卷"]) {
//                [weakSelf.view addSubview:weakSelf.surveyListView];
//                [weakSelf.surveyListView mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.edges.mas_equalTo(weakSelf.view);
//                }];
//                [weakSelf.surveyListView showSurveyIsShow:YES];
//            }
//
//            if ([obj.title isEqualToString:@"公告"]) {
//                [weakSelf.view addSubview:weakSelf.announcementList];
//                [weakSelf.announcementList mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.edges.mas_equalTo(weakSelf.view);
//                }];
//                [weakSelf.announcementList loadDataRoomId:weakSelf.watchVideoView.moviePlayer.webinarInfo.webinarInfoData.interact.room_id
//                                                   isShow:YES];
//            }
//            
//            if ([obj.title isEqualToString:@"推屏卡片"]) {
//                [weakSelf.view addSubview:weakSelf.pushScreenCardList];
//                [weakSelf.pushScreenCardList mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.edges.mas_equalTo(weakSelf.view);
//                }];
//                [weakSelf.pushScreenCardList loadDataWebinarId:weakSelf.webinar_id switch_id:weakSelf.watchVideoView.moviePlayer.webinarInfo.webinarInfoData.data_switch.switch_id isShow:YES];
//            }
//            
//        }];
    }

    return _foldBtn;
}
- (JMKWatchVideoView *)watchVideoView
{
    if (!_watchVideoView) {
        _watchVideoView = [[JMKWatchVideoView alloc] initWithWebinarId:self.webinar_id type:self.type];
//        _watchVideoView.delegate = self;
        [self.view addSubview:_watchVideoView];
    }
    return _watchVideoView;
}

- (JMKWatchLiveBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[JMKWatchLiveBottomView alloc] init];
//        _bottomView.delegate = self;
//        _bottomView.isLive = self.isLive;
        [self.view addSubview:_bottomView];
    }

    return _bottomView;
}

@end
