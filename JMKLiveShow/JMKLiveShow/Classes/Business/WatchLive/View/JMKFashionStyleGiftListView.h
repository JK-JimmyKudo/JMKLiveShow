//
//  JMKFashionStyleGiftListView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/26.
//

#import "JMKBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ClickSendBtnBlock)(void);

@interface VHFashionStyleGiftListCell : UICollectionViewCell

/// 是否选中
@property (nonatomic, assign) BOOL isSelect;
/// 白色背景
@property (nonatomic, strong) UIView *giftView;
/// 礼物图片
@property (nonatomic, strong) UIImageView *giftImg;
/// 标题
@property (nonatomic, strong) UILabel *titleLab;
/// 发送按钮
@property (nonatomic, strong) UIButton *sendBtn;

/// 数据model
@property (nonatomic, strong) VHallGiftListItem *giftListItem;

/// 点击发送回调
@property (nonatomic, copy) ClickSendBtnBlock clickSendBtnBlock;
@end

@interface JMKFashionStyleGiftListView : JMKBaseView


/// 展示礼物列表
- (void)showGiftToWebinarInfoData:(VHWebinarInfoData *)webinarInfoData;

/// 关闭计时器
- (void)dismiss;


@end

NS_ASSUME_NONNULL_END
