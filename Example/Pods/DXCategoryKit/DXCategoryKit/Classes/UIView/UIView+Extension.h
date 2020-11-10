//
//  UIView+Extension.h
//  LYQikan
//
//  Created by joker on 15/8/5.
//  Copyright (c) 2015年 jess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@end
@interface UIView (XK_ViewCycle)
/**
 *  @brief 移除所有的子类
 */
-(void)XK_removeAllSubviews;

/**
 *  @brief 找到第一个 这个class 的父视图
 */
-(id)XK_findParentViewWithClass:(Class)clazz;

/**
 *  @brief 找到第一个 这个class 的子视图
 */
-(id)XK_findSubviewWithClass:(Class)clazz;

/**
 *  @brief 只会遍历 子视图，  系统的方法 会遍历子视图的子视图
 */
-(id)XK_findViewWithTag:(NSInteger)tag;

/**
 *  @brief 查找当前view 的 viewController
 */
-(id)XK_viewController;

/*
 * UIView上下居中
 */
+ (void)setSubviewCenterOnVertical:(UIView *)subView AtX:(CGFloat)xStart superView:(UIView *)superView;

/*
 * UIView左右居中
 */
+ (void)setSubviewCenterOnHorizontal:(UIView *)subView AtY:(CGFloat)yStart superView:(UIView *)superView;

+ (void)setSubviewOnCenter:(UIView *)subView superView:(UIView *)superView;
@end

#pragma mark ===================== 适配相关  =====================
/**
 *  iphone6 适配
 *
 *  @param value 要调整的数字
 *
 *  @return 保证取整或是0.5的倍数
 */
CG_INLINE CGFloat CGFloatForView(CGFloat value){
    CGFloat result = 0.f;
    int floorValue = floorf(value);
    float dif = value - floorValue;
    //四舍五入
    if (dif < 0.5f){
        result = floorf(value);
    }
    else{
        result = ceilf(value);
    }
    return result;
}


/**
 *  ipone6+ 适配
 *
 *  @param height
 *
 *  @return 等比放大
 */

///高度
CG_INLINE CGFloat FMFixHeightFloat(CGFloat height) {
    CGRect mainFrme = [[UIScreen mainScreen] applicationFrame];
    if (mainFrme.size.width/375 < 1) {  //iphone6以下不调整
        return height;
    }
    height = height*mainFrme.size.width/375;
    height = CGFloatForView(height);//需要取整，否则1像素分割线无法显示
    return height;
}

///宽度
CG_INLINE CGFloat FMFixWidthFloat(CGFloat width) {
    CGRect mainFrme = [[UIScreen mainScreen] applicationFrame];
    if (mainFrme.size.width/375 < 1) {  //iphone6以下不调整
        return width;
    }
    width = width*mainFrme.size.width/375;
    width = CGFloatForView(width);//需要取整，否则1像素分割线无法显示
    return width;
}

// 经过测试了, 以iphone6屏幕为适配基础
CG_INLINE CGRect
FMRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x; rect.origin.y = y;
    rect.size.width = FMFixWidthFloat(width);
    rect.size.height = FMFixHeightFloat(height);
    return rect;
}

CG_INLINE CGPoint
FMPointMake(CGFloat x, CGFloat y)
{
    CGPoint p;
    p.x = FMFixWidthFloat(x);
    p.y = FMFixHeightFloat(y);
    return p;
}

CG_INLINE CGSize
FMSizeMake(CGFloat width, CGFloat height)
{
    CGSize size;
    size.width = FMFixWidthFloat(width);
    size.height = FMFixHeightFloat(height);
    return size;
}


//宽度维持不变的设置  主要用于全屏宽情况
CG_INLINE CGRect
FMRectFixWidthMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = FMFixWidthFloat(x); rect.origin.y = FMFixHeightFloat(y);
    rect.size.width = width; rect.size.height = FMFixHeightFloat(height);
    return rect;
}

CG_INLINE UIEdgeInsets
FMEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
    CGFloat nTop = FMFixHeightFloat(top);
    CGFloat nLeft = FMFixWidthFloat(left);
    CGFloat nBottom = FMFixHeightFloat(bottom);
    CGFloat nRight = FMFixWidthFloat(right);
    UIEdgeInsets edgeInset = UIEdgeInsetsMake(nTop,nLeft,nBottom,nRight);
    return edgeInset;
}

CG_INLINE CGPoint CGRectCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

///高宽比固定按屏幕宽取高度
CG_INLINE CGFloat FMHeightRatioWith(CGFloat height, CGFloat width) {
    CGRect mainFrme = [[UIScreen mainScreen] applicationFrame];
    return height*mainFrme.size.width/width;
}

/*
 等比缩小至iphone5也匹配的方法
 */
///高度
CG_INLINE CGFloat FMFixHeightFloat2(CGFloat height) {
    CGRect mainFrme = [[UIScreen mainScreen] applicationFrame];
    height = height*mainFrme.size.width/375;
    height = CGFloatForView(height);//需要取整，否则1像素分割线无法显示
    return height;
}

///宽度
CG_INLINE CGFloat FMFixWidthFloat2(CGFloat width) {
    CGRect mainFrme = [[UIScreen mainScreen] applicationFrame];
    width = width*mainFrme.size.width/375;
    width = CGFloatForView(width);//需要取整，否则1像素分割线无法显示
    return width;
}
