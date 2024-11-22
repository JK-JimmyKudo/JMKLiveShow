//
//  JMKFileDownloadCell.h
//  JMKLiveShow
//
//  Created by llj on 2024/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKFileDownloadCell : UITableViewCell
/// 文件数据
@property (nonatomic, strong) VHFileDownloadListModel *fileDownloadListModel;
/// index
@property (nonatomic, assign) NSInteger indexRow;

+ (JMKFileDownloadCell *)createCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
