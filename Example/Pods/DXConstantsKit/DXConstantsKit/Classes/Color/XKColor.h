//
//  XKColor.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
static inline UIColor* KRGBColor(CGFloat red,CGFloat green,CGFloat blue, CGFloat alpha) {
    return [UIColor colorWithRed:red / 255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
static inline UIColor* KHEXColor(NSInteger rgbValue, CGFloat alpha) {
    return [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:alpha];
}
static inline UIColor* KHEXColorNoAlpha(NSInteger rgbValue) {
    return [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:1.0];
}
@interface XKColor : NSObject

/// 字符串转color
/// @param colorString 字符串颜色
+ (UIColor *)stringColorToUIColor:(NSString *)colorString;


//顶部导航条颜色
+ (UIColor *)navigationTitleColor;
+ (UIColor *)navigationBackgroundColor;
+ (UIColor *)navigationItemTitleColor;

//底部tabbar颜色
+ (UIColor *)tabBarTitleNornalColor;
+ (UIColor *)tabBarTitleSelectedColor;
+ (UIColor *)tabBarBackgroundColor;
+ (UIColor *)tabBarLineColor;

//页面颜色
+ (UIColor *)xk_color32;
+ (UIColor *)xk_colorB1;
+ (UIColor *)xk_color97;
+ (UIColor *)xk_color484D8F;
+ (UIColor *)xk_colorFFDA23;
+ (UIColor *)xk_colorED4264;
+ (UIColor *)xk_colorF2;
+ (UIColor *)xk_colorFE;
+ (UIColor *)xk_colorF6;
+ (UIColor *)xk_colorF6F8FB;
+ (UIColor *)xk_color88;
+ (UIColor *)xk_colorDadce3;
+ (UIColor *)xk_colorF3;
+ (UIColor *)xk_color99;
+ (UIColor *)xk_color33;
+ (UIColor *)xk_colorFCD934;
+ (UIColor *)xk_color6D6F;
+ (UIColor *)xk_colorAeb0b7;
+ (UIColor *)xk_color65;
+ (UIColor *)xk_color7E7E;
+ (UIColor *)xk_colorFF3636;
+ (UIColor *)xk_color66;
+ (UIColor *)xk_colorFF8400;
+ (UIColor *)xk_colorF9B542;
+ (UIColor *)xk_color9AD6FF;
+ (UIColor *)xk_colorFFC3B0;
+ (UIColor *)xk_color912D22;
+ (UIColor *)xk_color1D4263;
+ (UIColor *)xk_color4C4C4D;
+ (UIColor *)xk_colorFF3939;
+ (UIColor *)xk_colorFF8300;
+ (UIColor *)xk_colorFFB521;
+ (UIColor *)xk_color1D41631;
+ (UIColor *)xk_color3997E1;
+ (UIColor *)xk_color2B8FDF;
+ (UIColor *)xk_colorFF6600;
+ (UIColor *)xk_colorF19819;
+ (UIColor *)xk_colorF02C2C;
+ (UIColor *)xk_colorForBtnTitle; // 按钮文字颜色
+ (NSArray<UIColor *> *)xk_colorArrFF;
+ (NSArray<UIColor *> *)xk_color_change1;
+ (NSArray<UIColor *> *)xk_cgColor_change1;
@end

NS_ASSUME_NONNULL_END
