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

/// 获取活动权限检测
/// @param webinarId 活动id 1、传活动id时，返回活动id+活动创建者相关的配置项信息 2、不传活动id时，获取登录用户的配置项信息
/// @param webinar_user_id 活动发起者用户id，有webinar_id时，必传
/// @param scene_id 使用场景：1权限检测（默认1）  2获取配置项选中值
/// @param success 成功
/// @param failure 失败
+ (void)permissionsCheckWithWebinarId:(NSString *)webinarId
                      webinar_user_id:(NSString *)webinar_user_id
                             scene_id:(NSString *)scene_id
                              success:(void (^)(VHPermissionConfigItem *item))success
                              failure:(void (^)(NSError *error))failure{
    
    
    VHPermissionConfigItem *item = [[VHPermissionConfigItem alloc]init];
    item.watch_hide_like = YES;                                           ///<是否开启点赞
    item.hide_gifts = YES;                                                  ///<是否开启礼物
    item.watch_record_no_chatting = NO;                                    ///<是否开启回放禁言
    item.watch_record_chapter = YES;                                        ///<是否开启回放章节打点
    
    success(item);
    
    
}

/// 返回角色数据
/// @param webinarId 活动id
/// @param roleNameData 角色信息
+ (void)getRoleNameWebinar_id:(NSString *)webinarId
                 dataCallBack:(void (^)(VHRoleNameData *))roleNameData{
    
    VHRoleNameData *RoleNameData = [[VHRoleNameData alloc]init];
    

    RoleNameData.host_name = @"主持人角色名称";      ///<主持人角色名称
    RoleNameData.guest_name = @"嘉宾角色名称";      ///<嘉宾角色名称
    RoleNameData.assist_name = @"助理角色名称";     ///<助理角色名称

    roleNameData(RoleNameData);
    
}

/// 开启观看协议需前置获取观看协议
/// @param webinarId 活动id
/// @param success 观看协议数据
/// @param fail 失败
+ (void)fetchViewProtocol:(NSString *)webinarId
                  success:(void (^)(VHViewProtocolModel *protocolModel))success
                     fail:(void (^)(NSError *error))fail{
    
}
/// 同意观看协议
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)agreeViewProtocol:(NSString *)webinarId
                  success:(void (^)(void))success
                     fail:(void (^)(NSError *error))fail{
    
}

/// 获取问卷历史
/// @param webinarId 活动id
/// @param roomId 房间id
/// @param switchId 场次id
/// @param success 成功
/// @param fail 失败
+ (void)fetchSurveyListWebinarId:(NSString *)webinarId
                          roomId:(NSString *)roomId
                        switchId:(NSString *)switchId
                         success:(void (^)(VHSurveyListModel *listModel))success
                            fail:(void (^)(NSError *error))fail{
    
}

/// 获取抽奖列表接口
/// @param showAll 是否需要展示所有抽奖 0-否(默认：仅展示进行中、已中奖抽奖) 1-全部抽奖 2 已中奖抽奖（sdk专用）
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)fetchLotteryListShowAll:(NSInteger)showAll
                      webinarId:(NSString *)webinarId
                        success:(void (^)(VHLotteryListModel *listModel))success
                           fail:(void (^)(NSError *error))fail{
    
}

/// 获取指定活动下的回放列表
/// - Parameters:
///   - webinarId: 活动id
///   - pageNum: 页数
///   - pageSize: 一页几个
///   - complete: 返回结果的回调
+ (void)getRecordListWithWebinarId:(NSString *)webinarId
                           pageNum:(NSInteger)pageNum
                          pageSize:(NSInteger)pageSize
                          complete:(void (^)(NSArray <VHRecordListModel *> *recordList, NSError *error))complete{
    
}

#pragma mark - 云导播活动
/// 导播台是否开启 director_status=YES:已开启，NO:未开启
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getDirectorStatusWithWebinarId:(NSString *)webinarId
                               success:(void (^)(BOOL director_status))success
                                  fail:(void (^)(NSError *error))fail{
    
}
/// 以视频推流到云导播获取机位列表
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getSeatList:(NSString *)webinarId
            success:(void (^)(VHDirectorModel *directorModel))success
               fail:(void (^)(NSError *error))fail{
    
}
/// 选择机位
/// @param webinarId 活动id
/// @param seatId 机位id
/// @param success 成功
/// @param fail 失败
+ (void)selectSeatWithWebinarId:(NSString *)webinarId
                         seatId:(NSString *)seatId
                        success:(void (^)(BOOL))success
                           fail:(void (^)(NSError *error))fail{
    
}
/// 云导播台的房间流状态
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getDirectorRoomStreamStatus:(NSString *)webinarId
                            success:(void (^)(BOOL isHaveStream))success
                               fail:(void (^)(NSError *error))fail{
    
    
    
}






@end
