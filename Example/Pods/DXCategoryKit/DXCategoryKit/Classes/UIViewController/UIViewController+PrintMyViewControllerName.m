//
//  UIViewController+PrintMyViewControllerName.m
//  打印各自的控制器名
//
//  Created by 陈辉金 on 2020/6/8.
//  Copyright © 2020 chj. All rights reserved.
//

#import "UIViewController+PrintMyViewControllerName.h"
#import <objc/runtime.h>


@implementation UIViewController (PrintMyViewControllerName)

+ (void)load {
//#if DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIViewController class];
        Method m1 = class_getInstanceMethod(cls, @selector(viewDidLoad));
        Method m2 = class_getInstanceMethod(cls, @selector(viewDidLoad_Path));
        method_exchangeImplementations(m1, m2);
    });
//#endif
}
- (void)viewDidLoad_Path {
    [self viewDidLoad_Path];
    printf("当前视图涉及的控制器名：♥️ %s ♥️\n",NSStringFromClass(self.class).UTF8String);
}
@end
