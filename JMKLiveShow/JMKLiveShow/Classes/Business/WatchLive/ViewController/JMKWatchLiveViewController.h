//
//  JMKWatchLiveViewController.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/24.
//

#import "JMKBaseViewController.h"
#import <VHLiveSDK/VHallApi.h>
#import "VHLiveSDK/VHallConst.h"
NS_ASSUME_NONNULL_BEGIN

@interface JMKWatchLiveViewController : JMKBaseViewController

/// 活动id
@property (nonatomic, copy) NSString *webinar_id;

/// 活动状态 1-直播中，2-预约，3-结束，4-点播，5-回放
@property (nonatomic) VHMovieActiveState type;

@end

NS_ASSUME_NONNULL_END
