//
//  UIView+Extension.m
//  LYQikan
//
//  Created by joker on 15/8/5.
//  Copyright (c) 2015年 jess. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom-frame.size.height;
    self.frame = frame;
}
@end








@implementation UIView (XK_ViewCycle)
- (void)XK_removeAllSubviews
{
    NSArray *array = self.subviews;
    for (UIView *subview in array)
    {
        [subview removeFromSuperview];
    }
}

-(id)XK_findParentViewWithClass:(Class)clazz
{
    if ([self isKindOfClass:clazz])
    {
        return self;
    }
    UIView *view = self.superview;
    while (view && ![view isKindOfClass:clazz])
    {
        view = view.superview;
    }
    return view;
}

-(id)XK_findSubviewWithClass:(Class)clazz
{
    UIView* resultView = nil;
    
    NSMutableArray* stackArray = [NSMutableArray array];
    NSArray* subviews = self.subviews;
    
    ///使用堆栈 模拟递归效果
    while (subviews.count)
    {
        for (UIView* subview in subviews)
        {
            if([subview isKindOfClass:clazz]) {
                resultView = subview;
                break;
            }
            else if(subview.subviews.count) {
                [stackArray addObject:subview];
            }
        }
        
        if(resultView) {
            break;
        }
        
        if(stackArray.count)
        {
            UIView* view = stackArray.lastObject;
            subviews = view.subviews;
            
            [stackArray removeLastObject];
        }
        else
        {
            subviews = nil;
        }
    }
    return resultView;
}
-(id)XK_findViewWithTag:(NSInteger)tag
{
    UIView* resultView = nil;
    NSArray* subviews = self.subviews;
    for (UIView* subview in subviews)
    {
        if(subview.tag == tag)
        {
            resultView = subview;
            break;
        }
    }
    return resultView;
}
-(id)XK_viewController
{
    UIView* next = self;
    do {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
        next = next.superview;
    } while (next);
    return nil;
}

/*
 * UIView上下居中
 */
+ (void)setSubviewCenterOnVertical:(UIView *)subView AtX:(CGFloat)xStart superView:(UIView *)superView
{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    subView.origin = CGPointMake(xStart, floorf((superView.height - subView.height)/2));
}

/*
 * UIView左右居中
 */
+ (void)setSubviewCenterOnHorizontal:(UIView *)subView AtY:(CGFloat)yStart superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    
    subView.origin = CGPointMake(floorf((superView.width - subView.width)/2), yStart);
}

/*
 * UIView上下左右居中
 */
+ (void)setSubviewOnCenter:(UIView *)subView superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    
    subView.origin = CGPointMake(floorf((superView.width - subView.width)/2), floorf((superView.height - subView.height)/2));
}
@end
