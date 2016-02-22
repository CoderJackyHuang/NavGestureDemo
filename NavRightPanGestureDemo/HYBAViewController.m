//
//  HYBAViewController.m
//  NavRightPanGestureDemo
//
//  Created by huangyibiao on 16/2/22.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBAViewController.h"

@interface HYBAViewController () <UIAlertViewDelegate>

@end

@implementation HYBAViewController

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

- (void)onBack {
  [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin {
  return YES;
}




@end
