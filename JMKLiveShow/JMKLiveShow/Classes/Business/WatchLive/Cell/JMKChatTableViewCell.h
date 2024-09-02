//
//  JMKChatTableViewCell.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VHChatPhotoCollectionCell : UICollectionViewCell

@property (nonatomic, copy) NSString *image_url;

@property (nonatomic, assign) BOOL isLeft;

@end


@interface JMKChatTableViewCell : UITableViewCell

/// 初始化
+ (JMKChatTableViewCell *)createCellWithTableView:(UITableView *)tableView;

/// 模型
@property (nonatomic, strong) VHallChatModel *model;


@end

NS_ASSUME_NONNULL_END
