//
//  XKColor.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKColor.h"

@implementation XKColor
#pragma mark - 颜色值


//顶部导航条颜色
+ (UIColor*)navigationTitleColor {
    return [self xk_color32];
}
+ (UIColor*)navigationItemTitleColor {
    return [self xk_color97];
}
+ (UIColor *)navigationBackgroundColor {
    return [UIColor whiteColor];
}
//底部tabbar颜色
+ (UIColor*)tabBarTitleNornalColor {
    return [[self class]navigationItemTitleColor];
}
+ (UIColor*)tabBarTitleSelectedColor {
    return KHEXColor(0x474d55, 1.0);
}

+ (UIColor*)tabBarBackgroundColor {
    return [[self class]navigationBackgroundColor];
}
+ (UIColor*)tabBarLineColor {
    return KHEXColor(0xF5F5F5, 1.0);
}
#pragma mark - 页面上的颜色
+ (UIColor *)xk_color32 {
    return KHEXColor(0x323233, 1.0);
}
+ (UIColor *)xk_color97 {
    return KHEXColor(0x979799, 1.0);
}
+ (UIColor *)xk_colorB1 {
    return KHEXColor(0xB1B1B3, 1.0);
}
+ (UIColor *)xk_color484D8F {
    return KHEXColor(0x484D8F, 1.0);
}
+ (UIColor *)xk_colorFFDA23 {
    return KHEXColor(0xFFDA23, 1.0);
}
+ (UIColor *)xk_colorED4264 {
    return KHEXColor(0xED4264, 1.0);
}
+ (UIColor *)xk_colorF2 {
    return KHEXColor(0xF2F2F5, 1.0);
}
+ (UIColor *)xk_colorFE {
    return KHEXColor(0xFEFEFF,1.0);
}
+ (UIColor *)xk_colorF6 {
    return KHEXColor(0xF6F6F9,1.0);
}
+ (UIColor *)xk_color7E7E {
    return KHEXColor(0x7e7e90, 1.0);
}
+ (UIColor *)xk_colorF3 {
    return KHEXColor(0xF3f3fa,1.0);
}
+ (UIColor *)xk_colorF6F8FB {
    return KHEXColor(0xF6F8FB,1.0);
}
+ (UIColor *)xk_colorFF3636 {
    return KHEXColor(0xFF3636,1.0);
}

+ (UIColor *)xk_color88 {
    return KHEXColor(0x888888,1.0);
}
+ (UIColor *)xk_colorDadce3 {
    return KHEXColor(0xDadce3,1.0);
}

+ (UIColor *)xk_color99 {
    return KHEXColor(0x999999,1.0);
}

+ (UIColor *)xk_color33 {
    return KHEXColor(0x333333,1.0);
}

+ (UIColor *)xk_colorFCD934 {
    return KHEXColor(0xFCD934,1.0);
}

+ (UIColor *)xk_color6D6F {
    return KHEXColor(0x6d6f74, 1.0);
}

+ (UIColor *)xk_colorAeb0b7 {
    return KHEXColor(0xaeb0b7, 1.0);
}
+ (UIColor *)xk_color65 {
    return KHEXColor(0x656566, 1.0);
}
+ (UIColor *)xk_color66 {
    return KHEXColor(0x666666, 1.0);
}

+ (UIColor *)xk_colorFF8400 {
    return KHEXColor(0xFF8400, 1.0);
}

+ (UIColor *)xk_colorF9B542 {
    return KHEXColor(0xF9B542, 1.0);
}

+ (UIColor *)xk_color9AD6FF {
    return KHEXColor(0x9AD6FF, 1.0);
}

+ (UIColor *)xk_colorFFC3B0 {
    return KHEXColor(0xFFC3B0, 1.0);
}

+ (UIColor *)xk_color912D22 {
    return KHEXColor(0x912D22, 1.0);
}
+ (UIColor *)xk_color1D4263 {
    return KHEXColor(0x1D4263, 1.0);
}

+ (UIColor *)xk_color4C4C4D {
    return KHEXColor(0x4C4C4D, 1.0);
}

+ (UIColor *)xk_colorFF3939 {
    return KHEXColor(0xFF3939, 1.0);
}

+ (UIColor *)xk_colorFF8300 {
    return KHEXColor(0xFF8300, 1.0);
}

+ (UIColor *)xk_colorFFB521 {
    return KHEXColor(0xFFB521, 1.0);
}

+ (UIColor *)xk_color1D41631 {
    return KHEXColor(0x1D4163, 1.0);
}

+ (UIColor *)xk_color3997E1 {
    return KHEXColor(0x3997E1, 1.0);
}

+ (UIColor *)xk_color2B8FDF {
    return KHEXColor(0x2B8FDF, 1.0);
}

+ (UIColor *)xk_colorForBtnTitle {
    return [UIColor whiteColor];
}

+ (UIColor *)xk_colorFF6600 {
    return KHEXColor(0xFF6600, 1.0);
}
+ (UIColor *)xk_colorF19819 {
    return KHEXColor(0xF19819, 1.0);
}
+(UIColor *)xk_colorF02C2C {
    return KHEXColor(0xF02C2C, 1.0);
}

+ (NSArray<UIColor *> *)xk_colorArrFF {
    return @[(id)KHEXColor(0x5ECCFA,1.0).CGColor, (id)KHEXColor(0x99FAB9,1.0).CGColor];
}

+ (NSArray<UIColor *> *)xk_color_change1 {
    return @[(id)KHEXColor(0xFFEDBC,1.0), (id)KHEXColor(0xED4264,1.0)];
}

+ (NSArray<UIColor *> *)xk_cgColor_change1 {
    return @[(id)KHEXColor(0xFFEDBC,1.0).CGColor, (id)KHEXColor(0xED4264,1.0).CGColor];
}

#pragma mark - color方法
+ (UIColor *)stringColorToUIColor:(NSString *)colorString {
    NSString *cString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return nil;
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}





@end
