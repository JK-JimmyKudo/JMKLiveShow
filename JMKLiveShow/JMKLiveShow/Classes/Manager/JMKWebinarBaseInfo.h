//
//  JMKInfoMationM.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import <Foundation/Foundation.h>
#import "VHLiveSDK/VHWebinarInfo.h"
NS_ASSUME_NONNULL_BEGIN

@protocol JMKWebinarInfoDelegate <NSObject>

/// 房间人数改变回调 （目前仅支持真实人数改变触发此回调）
/// @param online_real 真实在线用户数
/// @param online_virtual 虚拟在线用户数
- (void)onlineChangeRealNum:(NSUInteger)online_real virtualNum:(NSUInteger)online_virtual;

@end

@interface JMKWebinarBaseInfo : NSObject



/// 查询活动基础信息
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getWebinarBaseInfoWithWebinarId:(NSString *)webinarId
                                success:(void (^)(VHWebinarBaseInfo *baseInfo))success
                                   fail:(void (^)(NSError *error))fail;

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
                              failure:(void (^)(NSError *error))failure;

/// 返回角色数据
/// @param webinarId 活动id
/// @param roleNameData 角色信息
+ (void)getRoleNameWebinar_id:(NSString *)webinarId
                 dataCallBack:(void (^)(VHRoleNameData *))roleNameData;

/// 开启观看协议需前置获取观看协议
/// @param webinarId 活动id
/// @param success 观看协议数据
/// @param fail 失败
+ (void)fetchViewProtocol:(NSString *)webinarId
                  success:(void (^)(VHViewProtocolModel *protocolModel))success
                     fail:(void (^)(NSError *error))fail;
/// 同意观看协议
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)agreeViewProtocol:(NSString *)webinarId
                  success:(void (^)(void))success
                     fail:(void (^)(NSError *error))fail;

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
                            fail:(void (^)(NSError *error))fail;

/// 获取抽奖列表接口
/// @param showAll 是否需要展示所有抽奖 0-否(默认：仅展示进行中、已中奖抽奖) 1-全部抽奖 2 已中奖抽奖（sdk专用）
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)fetchLotteryListShowAll:(NSInteger)showAll
                      webinarId:(NSString *)webinarId
                        success:(void (^)(VHLotteryListModel *listModel))success
                           fail:(void (^)(NSError *error))fail;

/// 获取指定活动下的回放列表
/// - Parameters:
///   - webinarId: 活动id
///   - pageNum: 页数
///   - pageSize: 一页几个
///   - complete: 返回结果的回调
+ (void)getRecordListWithWebinarId:(NSString *)webinarId
                           pageNum:(NSInteger)pageNum
                          pageSize:(NSInteger)pageSize
                          complete:(void (^)(NSArray <VHRecordListModel *> *recordList, NSError *error))complete;

#pragma mark - 云导播活动
/// 导播台是否开启 director_status=YES:已开启，NO:未开启
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getDirectorStatusWithWebinarId:(NSString *)webinarId
                               success:(void (^)(BOOL director_status))success
                                  fail:(void (^)(NSError *error))fail;
/// 以视频推流到云导播获取机位列表
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getSeatList:(NSString *)webinarId
            success:(void (^)(VHDirectorModel *directorModel))success
               fail:(void (^)(NSError *error))fail;
/// 选择机位
/// @param webinarId 活动id
/// @param seatId 机位id
/// @param success 成功
/// @param fail 失败
+ (void)selectSeatWithWebinarId:(NSString *)webinarId
                         seatId:(NSString *)seatId
                        success:(void (^)(BOOL))success
                           fail:(void (^)(NSError *error))fail;
/// 云导播台的房间流状态
/// @param webinarId 活动id
/// @param success 成功
/// @param fail 失败
+ (void)getDirectorRoomStreamStatus:(NSString *)webinarId
                            success:(void (^)(BOOL isHaveStream))success
                               fail:(void (^)(NSError *error))fail;






@end

NS_ASSUME_NONNULL_END
