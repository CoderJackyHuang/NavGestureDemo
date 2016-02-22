//
//  HYBBaseViewController.h
//  NavRightPanGestureDemo
//
//  Created by huangyibiao on 16/2/22.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYBBaseViewController : UIViewController

// 默认返回为YES,表示支持右滑返回
- (BOOL)gestureRecognizerShouldBegin;

@end
