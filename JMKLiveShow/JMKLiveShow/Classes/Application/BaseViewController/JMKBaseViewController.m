//
//  JMKBaseViewController.m
//  JMKLiveShow
//
//  Created by llj on 2024/8/22.
//

#import "JMKBaseViewController.h"

@interface JMKBaseViewController ()

@end

@implementation JMKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addLeftBth];
}

-(void)addLeftBth{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 给返回按钮,增加标识
    leftBtn.accessibilityLabel = VHTest_Base_BackBtn;
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setImage:[UIImage imageNamed:@"vh_back"]
             forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickLeftBarItem)
      forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]
                                    initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
