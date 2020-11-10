//
//  UIView+XKGradient.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DXConstantsKit/XKEnum.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XKGradient)
/**
 *  根据给定的颜色，设置UIView的颜色
 *  @param btnSize  这里要求手动设置下生成图片的大小，防止coder使用第三方layout,没有设置大小
 *  @param clrs     渐变颜色的数组
 *  @param percent  渐变颜色的占比数组
 *  @param type     渐变色的类型
 */
- (UIView *)gradientWithSize:(CGSize)btnSize colorArray:(NSArray *)clrs percentageArray:(NSArray *)percent gradientType:(XKGradientType)type;

/**
 *  返回根据给定的颜色的uiimage
 *  @param btnSize  这里要求手动设置下生成图片的大小，防止coder使用第三方layout,没有设置大小
 *  @param clrs     渐变颜色的数组
 *  @param percent  渐变颜色的占比数组
 *  @param type     渐变色的类型
 */
- (UIImage *)gradientBgWithSize:(CGSize)btnSize colorArray:(NSArray *)clrs percentageArray:(NSArray *)percent gradientType:(XKGradientType)type;
@end

NS_ASSUME_NONNULL_END
