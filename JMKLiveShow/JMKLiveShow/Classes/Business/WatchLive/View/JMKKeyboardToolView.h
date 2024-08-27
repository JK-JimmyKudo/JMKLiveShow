//
//  JMKKeyboardToolView.h
//  JMKLiveShow
//
//  Created by llj on 2024/8/27.
//

#import "JMKBaseView.h"
#import "VHTextView.h"
NS_ASSUME_NONNULL_BEGIN


@class JMKKeyboardToolView;

@protocol JMKKeyboardToolViewDelegate <NSObject>

/* 发送按钮事件回调*/
- (void)keyboardToolView:(JMKKeyboardToolView *)view sendText:(NSString *)text;

@end


@interface JMKKeyboardToolView : JMKBaseView


/*! 发送按钮*/
@property (nonatomic, strong) UIButton *sendBtn;
/*! 输入框*/
@property (nonatomic, strong) VHTextView *textView;
/*! 输入的最大长度 默认 0不限制 */
@property (nonatomic, assign) NSInteger maxLength;
/*!  提示文案 */
@property (nonatomic, copy) NSString *placeholder;
/*! 是否正在编辑*/
@property (nonatomic, assign, readonly) BOOL isEditing;

/*! 代理指针*/
@property (nonatomic, weak) id <JMKKeyboardToolViewDelegate> delegate;

/*! 收起键盘*/
- (void)resignFirstResponder;
/*! 打开键盘*/
- (void)becomeFirstResponder;

/*! 清空内容*/
- (void)clearText;

@end

NS_ASSUME_NONNULL_END
