//
//  JMKHomeViewController.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "JMKHomeViewController.h"

//#import "VHAirPlayViewController.h"
#import "JMKAuthAlertView.h"
#import "HomeBannerModel.h"
//#import "VHCodeVC.h"
//
//#import "VHPublishVC.h"
//#import "VHWarmUpViewController.h"
//#import "VHWatchVC.h"
//#import "VHWebViewVC.h"
#import "JMKHomeRequest.h"
@interface JMKHomeViewController ()<TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>

//<VHallApiDelegate, VHWarmUpViewControllerDelegate, VHAuthAlertViewDelegate>

/// 退出登录
@property (weak, nonatomic) IBOutlet UIButton *outLoginBtn;
/// 头像
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
/// 昵称
@property (weak, nonatomic) IBOutlet UILabel *nickName;
/// 容器
@property (weak, nonatomic) IBOutlet UIView *contentView;
/// 活动id
@property (weak, nonatomic) IBOutlet UITextField *activityTF;
/// 点击扫码
@property (nonatomic, strong) UIButton *codeBtn;
/// 是否开启权限校验
@property (weak, nonatomic) IBOutlet UISwitch *authSwitch;
/// 进入按钮
@property (weak, nonatomic) IBOutlet UIButton *enterRoomBtn;
/// 观看权限弹窗
@property (nonatomic, strong) JMKAuthAlertView *authAlertView;
/// 观看权限类型
@property (nonatomic, copy) NSString *type;
/// 发起直播按钮
@property (weak, nonatomic) IBOutlet UIButton *livePublishBtn;
/// H5观看页
@property (weak, nonatomic) IBOutlet UIButton *h5Btn;


@property (nonatomic,strong) NSMutableArray *HomeBannerArr;

@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
//@property (nonatomic, strong) NSArray *datas;

@end

@implementation JMKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    
    
    self.type = @"";

    // 初始化
    [self initWithData];

    // 设置样式
    [self setWithUI];

    // 绑定自动化标识
    [self initKIF];
    [self requestDraft];
    
    
    
    [self addPagerView];
    [self addPageControl];
    
    
    
}


- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
//    pagerView.layer.borderWidth = 1;
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    // registerClass or registerNib
    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:pagerView];
    _pagerView = pagerView;
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    //pageControl.numberOfPages = _datas.count;
    pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
    pageControl.pageIndicatorSize = CGSizeMake(12, 6);
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
//    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
//    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
//    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
//    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [_pagerView addSubview:pageControl];
    _pageControl = pageControl;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _pagerView.frame = CGRectMake(10, NAVIGATION_BAR_H + 20, CGRectGetWidth(self.view.frame) - 20, 148);
    [JMKUITool clipView:_pagerView corner:UIRectCornerAllCorners anSize:CGSizeMake(10, 10)];
    _pageControl.frame = CGRectMake(0, CGRectGetHeight(_pagerView.frame) - 26, CGRectGetWidth(_pagerView.frame), 26);
}

- (void)loadData {
//    NSMutableArray *datas = [NSMutableArray array];
//    for (int i = 0; i < 7; ++i) {
//        if (i == 0) {
//            [datas addObject:[UIColor redColor]];
//            continue;
//        }
//        [datas addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0]];
//    }
//    _datas = [datas copy];

    //[_pagerView scrollToItemAtIndex:3 animate:YES];
}

//- (void)loadData {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSMutableArray *datas = [NSMutableArray array];
//        for (int i = 0; i < 5; ++i) {
//            if (i == 0) {
//                [datas addObject:[UIColor redColor]];
//                continue;
//            }
//            [datas addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0]];
//        }
//        _datas = [datas copy];
//        _pageControl.numberOfPages = _datas.count;
//        [_pagerView reloadData];
//    });
//}

#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return self.HomeBannerArr.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
//    cell.backgroundColor = self.HomeBannerArr[index];
//    cell.label.text = [NSString stringWithFormat:@"index->%ld",index];
    HomeBannerModel *model = self.HomeBannerArr[index];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame)*1, CGRectGetHeight(pageView.frame)*1);
    layout.itemSpacing = 15;
    //layout.minimumAlpha = 0.3;
//    layout.itemHorizontalCenter = _horCenterSwitch.isOn;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

#pragma mark - action

- (IBAction)switchValueChangeAction:(UISwitch *)sender {
    if (sender.tag == 0) {
        _pagerView.isInfiniteLoop = sender.isOn;
        [_pagerView updateData];
    }else if (sender.tag == 1) {
        _pagerView.autoScrollInterval = sender.isOn ? 3.0:0;
    }else if (sender.tag == 2) {
        _pagerView.layout.itemHorizontalCenter = sender.isOn;
        [UIView animateWithDuration:0.3 animations:^{
            [_pagerView setNeedUpdateLayout];
        }];
    }
}

- (IBAction)sliderValueChangeAction:(UISlider *)sender {
    if (sender.tag == 0) {
        _pagerView.layout.itemSize = CGSizeMake(CGRectGetWidth(_pagerView.frame)*sender.value, CGRectGetHeight(_pagerView.frame)*sender.value);
        [_pagerView setNeedUpdateLayout];
    }else if (sender.tag == 1) {
        _pagerView.layout.itemSpacing = 30*sender.value;
        [_pagerView setNeedUpdateLayout];
    }else if (sender.tag == 2) {
        _pageControl.pageIndicatorSize = CGSizeMake(6*(1+sender.value), 6*(1+sender.value));
        _pageControl.currentPageIndicatorSize = CGSizeMake(8*(1+sender.value), 8*(1+sender.value));
        _pageControl.pageIndicatorSpaing = (1+sender.value)*10;
    }
}

- (IBAction)buttonAction:(UIButton *)sender {
    _pagerView.layout.layoutType = sender.tag;
    [_pagerView setNeedUpdateLayout];
}

- (void)pageControlValueChangeAction:(TYPageControl *)sender {
    NSLog(@"pageControlValueChangeAction: %ld",sender.currentPage);
}







-(NSMutableArray *)HomeBannerArr{
    if (!_HomeBannerArr) {
        _HomeBannerArr = [NSMutableArray array];
    }
    return _HomeBannerArr;
}
- (void)requestDraft {
    
//    [QMUITips showLoadingInView:self.view];
   
    NSDictionary *dict = @{
        @"portalId":@4,
        @"portalType":@2,
        @"userId":@0,
        @"deviceType":@2
    };
    
    JMKHomeRequest *request = [[JMKHomeRequest alloc] initWithInfo:dict];
    
    [request requestWithModelClass:nil complete:^(id responseObject, NSError *error) {
        
        NSLog(@"responseObject --- %@",responseObject);
        
        
        
//        [QMUITips hideAllTipsInView:self.view];
//        self.draftId = responseObject[@"data"][@"id"];
        NSArray *dataArr =responseObject[@"data"];
//
        [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HomeBannerModel *model = [HomeBannerModel mj_objectWithKeyValues:obj];
           
            NSLog(@"model --- %@",model);
            [self.HomeBannerArr addObject: model];
            
        }];
        
        NSLog(@"self.HomeBannerArr --- %@",self.HomeBannerArr);
        _pageControl.numberOfPages = self.HomeBannerArr.count;
        [_pagerView reloadData];
//        BOTCitizenDataModel *dataModel = [BOTCitizenDataModel yy_modelWithDictionary:dic];
//        if (dataModel){
//            self.dataModel = dataModel;
//        }
//        
//        if (self.dataModel.userName.length == 0) {
//            [self requestUser];
//        }else{
//            [self updateChildrenViewModel];
//        }
//        
    }];

}
#pragma mark - 初始化
- (void)initWithData
{
    self.nickName.text = [VHallApi currentUserNickName];

    self.activityTF.text = [JMKUITool isBlankString:DEMO_Setting.activityID] ? @"" : DEMO_Setting.activityID;

    [self.headImage sd_setImageWithURL:[NSURL URLWithString:[VHallApi currentUserHeadUrl]] placeholderImage:[UIImage imageNamed:@"defaultHead"]];
}

#pragma mark - 设置样式
- (void)setWithUI
{
    self.activityTF.clearButtonMode = UITextFieldViewModeNever;

    self.authSwitch.onTintColor = JMKMainColor;

    self.enterRoomBtn.layer.masksToBounds = YES;
    self.enterRoomBtn.layer.cornerRadius = 20 / 2;

    self.livePublishBtn.layer.masksToBounds = YES;
    self.livePublishBtn.layer.cornerRadius = 20 / 2;

    [self.contentView addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.activityTF.mas_centerY);
        make.right.mas_equalTo(0);
        make.width.height.mas_equalTo(30);
    }];
}

#pragma mark - 绑定自动化标识
- (void)initKIF
{
    self.activityTF.accessibilityLabel = VHTests_Home_RoomId;
    self.enterRoomBtn.accessibilityLabel = VHTests_Home_EnterRoomBtn;
}

#pragma mark - 点击退出登录
- (IBAction)clickOutLoginBtn:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
//    [VHallApi logout:^{
//        [VHProgressHud showToast:@"退出登录成功"];
//    }
//             failure:^(NSError *error) {
//        [VHProgressHud showToast:error.localizedDescription];
//    }];
}

#pragma mark - 点击进入房间
- (IBAction)clickEnterRoomBtn:(UIButton *)sender {
    NSLog(@"点击进入房间");
//    if (self.activityTF.text.length <= 0) {
//        [JMKProgressHud showToast:@"请输入活动ID"];
//        return;
//    }

//     记录房间号
    DEMO_Setting.activityID = self.activityTF.text;

    // 判断是否校验观看权限
//    if (self.authSwitch.on) {
//        // 防止重复点击
//        self.enterRoomBtn.userInteractionEnabled = NO;
//        __weak __typeof(self) weakSelf = self;
//        [VHWebinarInfoData queryWatchAuthWithWebinarId:self.activityTF.text
//                                              complete:^(NSString *type, BOOL authStatus, NSError *error) {
//            // 防止重复点击
//            weakSelf.enterRoomBtn.userInteractionEnabled = YES;
//
//            // 先判断是否报错
//            if (error) {
//                [JMKProgressHud showToast:error.domain];
//                return;
//            }
//
//            // 判断是否需要校验
//            if (authStatus) {
//                // 需要校验
//                weakSelf.type = type;
//                [weakSelf.authAlertView showAuthWithType:type];
//                // 判断校验类型
//            } else {
//                // 不需要校验
//                [weakSelf watchInit];
//            }
//        }];
//    } else {
//        // 不校验
        [self watchInit];
//    }
}

#pragma mark - 获取房间详情
- (void)watchInit
{
    // 取消键盘
    [self.view endEditing:YES];

    // 防止重复点击
    self.enterRoomBtn.userInteractionEnabled = NO;

    __weak __typeof(self) weakSelf = self;
    // 增加一个hud
    [JMKProgressHud showLoading];
//     查询活动详情
    

    
    // 正式SDK的获取方法
//    [VHWebinarBaseInfo getWebinarBaseInfoWithWebinarId
    
    [JMKWebinarBaseInfo getWebinarBaseInfoWithWebinarId:self.activityTF.text
                                               success:^(VHWebinarBaseInfo *_Nonnull baseInfo) {
        // 防止重复点击
        weakSelf.enterRoomBtn.userInteractionEnabled = YES;

        [JMKProgressHud hideLoading];

        // 执行自动化测试用例
        NSMutableDictionary * otherInfo = [NSMutableDictionary dictionary];
        otherInfo[@"type"] = @(baseInfo.type);
        [JMKUITool sendTestsNotificationCenterWithKey:VHTests_EnterRoom otherInfo:otherInfo];
//
//        // 直播 回放
        JMKWatchLiveViewController *watchVC = [JMKWatchLiveViewController new];
        watchVC.accessibilityLabel = @"直播间";
        watchVC.webinar_id = baseInfo.ID;
        watchVC.type = baseInfo.type;
//

//        // 预告页
        JMKWarmUpViewController *warmUP = [JMKWarmUpViewController new];
        warmUP.webinarId = baseInfo.ID;
        warmUP.delegate = self;

//        //1-直播中，2-预约，3-结束，4-点播，5-回放
        switch (baseInfo.type) {
            case 1:{
                [weakSelf.navigationController pushViewController:watchVC
                                                         animated:YES];
            }
            break;

            case 2:{
                [weakSelf.navigationController pushViewController:warmUP
                                                         animated:YES];
            }
            break;

            case 3:{
                [JMKProgressHud showToast:@"直播结束"];
            }
            break;

            case 4:{
                [weakSelf.navigationController pushViewController:watchVC
                                                         animated:YES];
            }
            break;

            case 5:{
                [weakSelf.navigationController pushViewController:watchVC
                                                         animated:YES];
            }
            break;

            default:
                break;
        }
    }
                                                  fail:^(NSError *_Nonnull error) {
        // 防止重复点击
        weakSelf.enterRoomBtn.userInteractionEnabled = YES;
        [JMKProgressHud showToast:error.domain];
    }];
}

#pragma mark - VHAuthAlertViewDelegate
#pragma mark - 填写的回调
- (void)changeTextWithVerifyValue:(NSString *)verifyValue
{
    __weak __typeof(self) weakSelf = self;
    // 先去校验观看权限,通过以后才可以请求
    [VHWebinarInfoData checkWatchAuthWithWebinarId:self.activityTF.text
                                              type:self.type
                                      verify_value:verifyValue
                                          complete:^(NSDictionary *responseObject, NSError *error) {
        // 有数据
        if (responseObject) {
            [weakSelf watchInit];
        }

        // 报错
        if (error) {
            [JMKProgressHud showToast:error.domain];
        }
    }];
}

#pragma mark - VHWarmUpViewControllerDelegate
#pragma mark - 进入房间回调
- (void)enterRoom
{
    [self clickEnterRoomBtn:nil];
}

#pragma mark - 点击发起直播
- (IBAction)clickLivePublish:(UIButton *)sender {
    NSLog(@"点击发起直播");
    if (self.activityTF.text.length <= 0) {
        [JMKProgressHud showToast:@"请输入活动ID"];
        return;
    }

    // 记录房间号
//    DEMO_Setting.activityID = self.activityTF.text;

    // 取消键盘
    [self.view endEditing:YES];

    // 防止重复点击
    self.enterRoomBtn.userInteractionEnabled = NO;

    __weak __typeof(self) weakSelf = self;
    // 增加一个hud
    [JMKProgressHud showLoading];
    // 查询活动详情
//    [VHWebinarBaseInfo getWebinarBaseInfoWithWebinarId:self.activityTF.text
//                                               success:^(VHWebinarBaseInfo *_Nonnull baseInfo) {
//        // 防止重复点击
//        weakSelf.enterRoomBtn.userInteractionEnabled = YES;
//
//        [VHProgressHud hideLoading];
//        
//        VHPublishVC *publishVC = [VHPublishVC new];
//        publishVC.webinar_id = weakSelf.activityTF.text;
//        publishVC.webinar_type = baseInfo.webinar_type;
//        publishVC.screenLandscape = NO;
//        [weakSelf.navigationController pushViewController:publishVC animated:YES];
//    }
//                                                  fail:^(NSError *_Nonnull error) {
//        // 防止重复点击
//        weakSelf.enterRoomBtn.userInteractionEnabled = YES;
//        [VHProgressHud showToast:error.domain];
//    }];
}

- (IBAction)clickH5WithVC:(UIButton *)sender {
    NSLog(@"clickH5WithVC");
    if (self.activityTF.text.length <= 0) {
        [JMKProgressHud showToast:@"请输入活动ID"];
        return;
    }

    // 记录房间号
//    DEMO_Setting.activityID = self.activityTF.text;
//
//    VHWebViewVC * webView = [VHWebViewVC new];
//    webView.webinar_id = self.activityTF.text;
//    webView.vh_NavIsHidden = NO;
//    [self.navigationController pushViewController:webView animated:YES];
}

#pragma mark - 体验airplay投屏或者webview嵌入页
- (IBAction)clickAirPlayTestVC:(UIButton *)sender
{
//    VHAirPlayViewController *airplayVC = [VHAirPlayViewController new];
//
//    airplayVC.vh_NavIsHidden = NO;
//    [self.navigationController pushViewController:airplayVC animated:YES];
}

#pragma mark - 扫描二维码
- (void)clickCodeBtn
{
//    VHCodeVC *codeVC = [VHCodeVC new];
//
//    codeVC.codeType = VHCodeENUM_WebinarID;
//    __weak __typeof(self) weakSelf = self;
//    codeVC.scanWebianrIDWithData = ^(NSString *webinarId) {
//        weakSelf.activityTF.text = webinarId;
//    };
//    [self.navigationController pushViewController:codeVC animated:YES];
}

#pragma mark - 懒加载
- (JMKAuthAlertView *)authAlertView
{
    if (!_authAlertView) {
        _authAlertView = [[JMKAuthAlertView alloc] initWithFrame:self.view.frame];
        _authAlertView.delegate = self;
        [self.view addSubview:_authAlertView];
    }

    return _authAlertView;
}

- (UIButton *)codeBtn
{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeBtn.userInteractionEnabled = YES;
        [_codeBtn setImage:[UIImage imageNamed:@"vh_signSet_code_b"] forState:UIControlStateNormal];
        [_codeBtn addTarget:self action:@selector(clickCodeBtn) forControlEvents:UIControlEventTouchUpInside];
    }

    return _codeBtn;
}

@end
