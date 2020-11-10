//
//  UIControl+IntervalClick.h
//  XiongKeLive
//
//  Created by XZH on 2016/12/21.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//


#import "UIControl+IntervalClick.h"
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *UIControl_acceptedEventTime = "UIControl_acceptedEventTime";

@implementation UIControl (IntervalClick)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(sendAction:to:forEvent:)
         withSwizzledSelector:@selector(__py_sendAction:to:forEvent:)];
    });
}

- (NSTimeInterval)py_acceptedEventTime
{
    return [objc_getAssociatedObject(self, UIControl_acceptedEventTime) doubleValue];
}

- (void)setPy_acceptedEventTime:(NSTimeInterval)uxy_acceptedEventTime
{
    objc_setAssociatedObject(self, UIControl_acceptedEventTime, @(uxy_acceptedEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)__py_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    
    
    if (NSDate.date.timeIntervalSince1970 - self.py_acceptedEventTime < self.py_eventInterval) return;
    
    if (self.py_eventInterval > 0)
    {
        self.py_acceptedEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self __py_sendAction:action to:target forEvent:event];
}


- (NSTimeInterval)py_eventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

-(void)setPy_eventInterval:(NSTimeInterval)py_eventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(py_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 全面
+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // 若已经存在，则添加会失败
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    // 若原来的方法并不存在，则添加即可
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@end


