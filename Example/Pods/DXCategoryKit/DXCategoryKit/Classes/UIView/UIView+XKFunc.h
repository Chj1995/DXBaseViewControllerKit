//
//  UIView+XKFunc.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XKFunc)
/*
* UIView上下居中
*/
+ (void)setSubviewCenterOnVertical:(UIView *)subView AtX:(CGFloat)xStart superView:(UIView *)superView;
/*
* UIView左右居中
*/
+ (void)setSubviewCenterOnHorizontal:(UIView *)subView AtY:(CGFloat)yStart superView:(UIView *)superView;
/*
* UIView上下左右居中
*/
+ (void)setSubviewOnCenter:(UIView *)subView superView:(UIView *)superView;


/// 添加圆角
/// @param radius 圆角半径
/// @param corner 要加的角
- (void)radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;
@end

NS_ASSUME_NONNULL_END
