//
//  HomeBannerModel.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import <Foundation/Foundation.h>
#import "JMKBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeBannerModel : JMKBaseModel


@property (nonatomic,copy)NSString *imgUrl;
@property (nonatomic,copy)NSString *seriesPrice;
@property (nonatomic,copy)NSString *sourceId;


@property (nonatomic,strong) NSArray *data;

@end

NS_ASSUME_NONNULL_END
