//
//  HYBBController.m
//  NavRightPanGestureDemo
//
//  Created by huangyibiao on 16/2/22.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBBController.h"

@implementation HYBBController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:@"返回" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
  [button sizeToFit];
  [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];
  self.navigationItem.leftBarButtonItem = btnItem;
}

- (BOOL)gestureRecognizerShouldBegin {
  [self onBack];
  return NO;
}

- (void)onBack {
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"标哥的技术博客"
                                                      message:@"知道博客地址是什么吗？"
                                                     delegate:self
                                            cancelButtonTitle:@"不知道"
                                            otherButtonTitles:@"知道", nil];
  [alertView show];
}


#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 0) {
    
  } else {
    if ([self.navigationItem.title isEqualToString:@"VC6"]) {
      NSUInteger index = self.navigationController.viewControllers.count - 3;
      UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:index];
      [self.navigationController popToViewController:vc animated:YES];
    } else {
      [self.navigationController popViewControllerAnimated:YES];
    }
  }
}

@end
