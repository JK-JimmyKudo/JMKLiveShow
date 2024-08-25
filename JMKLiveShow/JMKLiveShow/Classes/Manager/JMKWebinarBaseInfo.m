//
//  JMKInfoMationM.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "JMKWebinarBaseInfo.h"

@implementation JMKWebinarBaseInfo

+ (void)getWebinarBaseInfoWithWebinarId:(NSString *)webinarId
                                success:(void (^)(VHWebinarBaseInfo *baseInfo))success
                                   fail:(void (^)(NSError *error))fail{
    
    
    VHWebinarBaseInfo * baseInfo = [[VHWebinarBaseInfo alloc]init];
    
    baseInfo.data = @"活动详情原数据";
//    VHRoleNameData *roleData = [[VHRoleNameData alloc]init];
    
    baseInfo.roleData.host_name = @"主持人角色名称";       ///<主持人角色名称
    baseInfo.roleData.guest_name = @"嘉宾角色名称";   ///<嘉宾角色名称
    baseInfo.roleData.assist_name = @"助理角色名称";      ///<助理角色名称
    

//    baseInfo.roleData = roleData;

    baseInfo.webinar_type = VHWebinarLiveType_Audio;       ///<1 音频直播 2 视频直播 3 互动直播
    baseInfo.type =    VHMovieActiveStateLive;   ///<1-直播中，2-预约，3-结束，4-点播，5-回放
   
    baseInfo.webinar_show_type = 0;              ///<横竖屏 0竖屏 1横屏
    baseInfo.no_delay_webinar = 1;               ///<是否无延迟直播 1:是 0:否
    baseInfo.inav_num = 6;                          ///<当前活动设置的最大连麦人数， 如：6表示1v5，16表示1v15...
    baseInfo.allowAdvanceBeauty = YES;                  ///<获取美颜权限结果
    baseInfo.rehearsal_type = YES;                      ///<YES:彩排中 NO:未彩排
//    baseInfo.is_director = 0;             ///<能否使用云导播功能 0-否 1-是
    baseInfo.ID = @"111";                          ///<活动id
    baseInfo.user_id = @"222";                     ///<活动创建者用户id
    baseInfo.subject = @"";                     ///<标题
    baseInfo.introduction = @"";             ///<简介
    baseInfo.img_url = @"";                     ///<封面图片
    baseInfo.category = @"";                    ///<类别，eg：金融
    baseInfo.start_time = @"";                  ///<直播开始时间
    baseInfo.actual_start_time = @"";        ///<实际开始时间
    baseInfo.end_time = @"";                    ///<直播结束时间
    baseInfo.live_subtitle_type = 0 ; ///<0：关闭，1：中文转中文字幕，2：中文转中英字幕，3：中文转英文字幕，4：英文转英文字母，5：英文转中英字幕

    
    success(baseInfo);
    
}
@end
