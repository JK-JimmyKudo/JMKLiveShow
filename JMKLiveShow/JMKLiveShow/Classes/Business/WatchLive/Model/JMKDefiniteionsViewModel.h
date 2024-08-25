//
//  JMKDefiniteionsViewModel.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKDefiniteionsViewModel : NSObject
/// 画质
@property (nonatomic, assign) VHMovieDefinition def;
/// 文案
@property (nonatomic, copy) NSString *title;
/// 选中
@property (nonatomic, assign) BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
