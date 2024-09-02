//
//  JMKChatCustomCell.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VHChatCustomModel : NSObject

/// 昵称
@property (nonatomic, copy) NSString *nickName;
/// 身份
@property (nonatomic, assign) NSInteger roleName;
/// 详情
@property (nonatomic, copy) NSString *content;
/// 附加信息
@property (nonatomic, strong) NSMutableDictionary *info;

@end

typedef void (^ClickSurveyToModel)(VHChatCustomModel *chatCustomModel);


@interface JMKChatCustomCell : UITableViewCell

@property (nonatomic, strong) VHChatCustomModel *chatCustomModel;

@property (nonatomic, copy) ClickSurveyToModel clickSurveyToModel;

/// 初始化
+ (JMKChatCustomCell *)createCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
