//
//  ViewController.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "ViewController.h"
//#import "IQKeyboardManager.h"
//#import <IQKeyboardManager/IQKeyboardManager.h>
//
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self configIQKeyboardManager];
}
- (void)configIQKeyboardManager
{
    NSLog(@"configIQKeyboardManager");
    // 是都开启键盘工具
//    [[IQKeyboardManager sharedManager] setEnable:YES];
//    [[IQKeyboardManager sharedManager] setEnable:YES];
//    // 是否显示键盘提示工具栏
//    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
//    // 键盘弹出时，点击背景，键盘收回
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
//    // 下一步
//    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysShow;
}


/*
 
 
 @property (nonatomic, strong) id data;                             ///<活动详情原数据
 @property (nonatomic) VHRoleNameData *roleData;                    ///<角色数据
 @property (nonatomic) VHWebinarLiveType webinar_type;           ///<1 音频直播 2 视频直播 3 互动直播
 @property (nonatomic) VHMovieActiveState type;                     ///<1-直播中，2-预约，3-结束，4-点播，5-回放
 @property (nonatomic) NSInteger webinar_show_type;              ///<横竖屏 0竖屏 1横屏
 @property (nonatomic) NSInteger no_delay_webinar;               ///<是否无延迟直播 1:是 0:否
 @property (nonatomic) NSInteger inav_num;                          ///<当前活动设置的最大连麦人数， 如：6表示1v5，16表示1v15...
 @property (nonatomic) BOOL allowAdvanceBeauty;                  ///<获取美颜权限结果
 @property (nonatomic) BOOL rehearsal_type;                      ///<YES:彩排中 NO:未彩排
 @property (nonatomic, readonly) NSInteger is_director;             ///<能否使用云导播功能 0-否 1-是
 @property (nonatomic, copy) NSString *ID;                          ///<活动id
 @property (nonatomic, copy) NSString *user_id;                     ///<活动创建者用户id
 @property (nonatomic, copy) NSString *subject;                     ///<标题
 @property (nonatomic, copy) NSString *introduction;             ///<简介
 @property (nonatomic, copy) NSString *img_url;                     ///<封面图片
 @property (nonatomic, copy) NSString *category;                    ///<类别，eg：金融
 @property (nonatomic, copy) NSString *start_time;                  ///<直播开始时间
 @property (nonatomic, copy) NSString *actual_start_time;        ///<实际开始时间
 @property (nonatomic, copy) NSString *end_time;                    ///<直播结束时间
 @property (nonatomic, assign) NSInteger live_subtitle_type; ///<0：关闭，1：中文转中文字幕，2：中文转中英字幕，3：中文转英文字幕，4：英文转英文字母，5：英文转中英字幕

 
 */

@end
