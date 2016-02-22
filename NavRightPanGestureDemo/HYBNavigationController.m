//
//  HYBNavigationController.m
//  NavRightPanGestureDemo
//
//  Created by huangyibiao on 16/2/22.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBNavigationController.h"
#import "HYBBaseViewController.h"

@interface HYBNavigationController () <UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL enableRightGesture;

@end

@implementation HYBNavigationController


- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.enableRightGesture = YES;
  self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
  if ([self.topViewController isKindOfClass:[HYBBaseViewController class]]) {
    if ([self.topViewController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
      HYBBaseViewController *vc = (HYBBaseViewController *)self.topViewController;
      self.enableRightGesture = [vc gestureRecognizerShouldBegin];
    }
  }
  
  return self.enableRightGesture;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
  if ([viewController isKindOfClass:[HYBBaseViewController class]]) {
    if ([viewController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
      HYBBaseViewController *vc = (HYBBaseViewController *)viewController;
      self.enableRightGesture = [vc gestureRecognizerShouldBegin];
    }
  }
  
  [super pushViewController:viewController animated:YES];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
     self.enableRightGesture = YES; 
  return [super popToRootViewControllerAnimated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
  if (self.viewControllers.count == 1) {
    self.enableRightGesture = YES;
  } else {
    NSUInteger index = self.viewControllers.count - 2;
    UIViewController *destinationController = [self.viewControllers objectAtIndex:index];
    if ([destinationController isKindOfClass:[HYBBaseViewController class]]) {
      if ([destinationController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
        HYBBaseViewController *vc = (HYBBaseViewController *)destinationController;
        self.enableRightGesture = [vc gestureRecognizerShouldBegin];
      }
    }
  }
  
  return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
  if (self.viewControllers.count == 1) {
    self.enableRightGesture = YES;
  } else {
    UIViewController *destinationController = viewController;
    if ([destinationController isKindOfClass:[HYBBaseViewController class]]) {
      if ([destinationController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
        HYBBaseViewController *vc = (HYBBaseViewController *)destinationController;
        self.enableRightGesture = [vc gestureRecognizerShouldBegin];
      }
    }
  }
  
  return [super popToViewController:viewController animated:animated];
}

@end
