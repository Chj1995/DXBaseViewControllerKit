//
//  XK_FMColor.m
//  XiongKeLive
//
//  Created by chw on 16/6/12.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XK_FMColor.h"

@implementation XK_FMColor

//导航条颜色
+ (UIColor*)XK_fmColor_Navigation_Back
{
    
#if UI_STYLE_PURPLE
    return XK_FMCOLOR_HEX(0x891fe1);
#elif UI_STYLE_YELLOW
    return XK_FMCOLOR_HEX(0xffda21);
#else
    return [UIColor whiteColor];
#endif
}

+ (UIColor*)XK_fmColor_Navigation_Title
{
#if UI_STYLE_PURPLE
    return XK_FMCOLOR_HEX(0xd24cfc);
#elif UI_STYLE_PURPLE
    return [XK_FMColor XK_fmColor_B1];
#else
//    return XK_FMCOLOR_HEX(0xf32874);
    return XK_FMCOLOR_HEX(0x323233);
#endif
}

+ (UIColor*)XK_fmColor_Navigation_Title_B
{
#if UI_STYLE_PURPLE
    return XK_FMCOLOR_HEX(0xd24cfc);
#elif UI_STYLE_PURPLE
    return [XK_FMColor XK_fmColor_B1];
#else
    return XK_FMCOLOR_HEX(0x979799);
#endif
}

//底部tabbar颜色
+ (UIColor*)XK_fmColor_TabBar_Back
{
#if UI_STYLE_PURPLE
    return [UIColor whiteColor];
#elif UI_STYLE_YELLOW
    return XK_FMCOLOR_HEX(0x191918);
#else
    return XK_FMCOLOR_HEX(0x979799);
#endif
}

+ (UIColor*)XK_fmColor_TabBar_Title
{
    return XK_FMCOLOR_HEX(0x323233);
}

 + (UIColor*)XK_fmColor_BottomView_Back
{
    return XK_FMCOLOR_HEX(0x474d55);
}

//controller.view默认背景色s
+ (UIColor*)XK_fmColor_Controller_View_Background
{
#if UI_STYLE_PURPLE
    return XK_FMCOLOR_HEX(0xf8f3f4);
#elif UI_STYLE_XINGFEI
    return [[self class] XK_fmColor_BGC];
#else
//    return XK_FMCOLOR_HEX(0xf5eff0);
    return XK_FMCOLOR_HEX(0xffffff);
#endif
}

//分割线颜色，如tableview的cell之间
+ (UIColor*)XK_fmColor_Seperate_Line
{
//    return XK_FMCOLOR_HEX(0xdddddd);
    return XK_FMCOLOR_HEX(0xf2f2f5);
}

//边界线颜色，如view的borderColor
+ (UIColor*)XK_fmColor_Border_Line
{
    return XK_FMCOLOR_HEX(0xdddddd);
}

//cell被选中时的高亮颜色
+ (UIColor*)XK_fmColor_Cell_Hightlight_Color
{
    return XK_FMCOLOR_HEX(0xf6f8fb);
}

+ (UIColor *)XK_fmColor_Line1
{
    return XK_FMCOLOR_HEX(0xf3f4fa);
}

+ (UIColor *)XK_fmColor_Line2
{
    return XK_FMCOLOR_HEX(0xdadce3);
}

#pragma mark - 直播色值
+ (UIColor *)XK_fmColor_R1
{
    return XK_FMCOLOR_HEX(0xffda21);
}

+ (UIColor *)XK_fmColor_R1_Half
{
    return [[self XK_fmColor_R1] colorWithAlphaComponent:0.5];
}

+ (UIColor *)XK_fmColor_R2
{
    return XK_FMCOLOR_HEX(0xb63980);
}

+ (UIColor *)XK_fmColor_white
{
    return [UIColor whiteColor];
}
+ (UIColor *)XK_fmColor_JJ_white
{
    return XK_FMCOLOR_HEX(0xfefefe);
}
+ (UIColor *)XK_fmColor_white_half
{
    return [[UIColor whiteColor] colorWithAlphaComponent:0.5];
}
+ (UIColor *)XK_fmColor_JJ_Tabbar_Bg
{
    return XK_FMCOLOR_HEX(0xC4AA80);
}
+ (UIColor *)XK_fmColor_A1 {
    return XK_FMCOLOR_HEX(0x323233);
}
+ (UIColor *)XK_fmColor_A2 {
    return XK_FMCOLOR_HEX(0x979799);
}

+ (UIColor *)XK_fmColor_A3 {
    return XK_FMCOLOR_HEX(0x7e7e80);
}
+ (UIColor *)XK_fmColor_A4 {
    return XK_FMCOLOR_HEX(0x656566);
}
+ (UIColor *)XK_fmColor_A5 {
    return XK_FMCOLOR_HEX(0xb1b1b3);
}
+ (NSArray<UIColor *> *)XK_fmColor_Change1 {
    return @[(id)XK_FMCOLOR_HEX(0x5ECCFA), (id)XK_FMCOLOR_HEX(0x99FAB9)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change2 {
    return @[(id)XK_FMCOLOR_HEX(0x7d5dff), (id)XK_FMCOLOR_HEX(0xe599ff)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change3 {
    return @[(id)XK_FMCOLOR_HEX(0x5d84ff), (id)XK_FMCOLOR_HEX(0x96dcff)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change4 {
    return @[(id)XK_FMCOLOR_HEX(0xff6699), (id)XK_FMCOLOR_HEX(0xff9988)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change5 {
    return @[(id)XK_FMCOLOR_HEX(0xff9988), (id)XK_FMCOLOR_HEX(0xff6699)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change6 {
    return @[(id)XK_FMCOLOR_HEX(0xFA81B6), (id)XK_FMCOLOR_HEX(0xFF626E)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change7 {
    return @[(id)XK_FMCOLOR_HEX(0xFF626E), (id)XK_FMCOLOR_HEX(0xFA81B6)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change8 {
    return @[(id)XK_FMCOLOR_HEX(0xFF626E), (id)XK_FMCOLOR_HEX(0xFFBE71)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change9 {
    return @[(id)XK_FMCOLOR_HEX(0xFFEDBC), (id)XK_FMCOLOR_HEX(0xFFDA23)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change10 {
    return @[(id)XK_FMCOLOR_HEX(0x6A3093), (id)XK_FMCOLOR_HEX(0xA044FF)];
}
+ (NSArray<UIColor *> *)XK_fmColor_Change11 {
    return @[(id)XK_FMCOLOR_HEX(0xA044FF), (id)XK_FMCOLOR_HEX(0xCD9CFF)];
}

+ (NSArray<UIColor *> *)fmCGColor_Change1 {
    return @[(id)[XK_FMCOLOR_HEX(0x5ECCFA) CGColor], (id)[XK_FMCOLOR_HEX(0x99FAB9) CGColor]];
}
+ (NSArray<UIColor *> *)fmCGColor_Change2 {
    return @[(id)[XK_FMCOLOR_HEX(0x7d5dff) CGColor], (id)[XK_FMCOLOR_HEX(0xe599ff) CGColor]];
}
+ (NSArray<UIColor *> *)fmCGColor_Change3 {
    return @[(id)[XK_FMCOLOR_HEX(0x5d84ff) CGColor], (id)[XK_FMCOLOR_HEX(0x96dcff) CGColor]];
}
+ (NSArray<UIColor *> *)fmCGColor_Change4 {
    return @[(id)[XK_FMCOLOR_HEX(0xff6699) CGColor], (id)[XK_FMCOLOR_HEX(0xff9988) CGColor]];
}

+ (CAGradientLayer *)XK_fmColor_Gradient:(NSArray<UIColor *> *)changeColor rect:(CGRect)rect cornerRadius:(NSInteger)cornerRadius {
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = rect;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.5),@(1.0)];//渐变点
    [gradientLayer setColors:changeColor];//渐变数组
    gradientLayer.cornerRadius = cornerRadius;
    return gradientLayer;
}
 
+ (UIColor *)XK_fmColor_D1 {
    return XK_FMCOLOR_HEX(0x18ce6a);
}
+ (UIColor *)XK_fmColor_D2 {
    return XK_FMCOLOR_HEX(0xf66854);
}

+ (UIColor *)XK_fmColor_B1
{
    return XK_FMCOLOR_HEX(0x333333);
}

+ (UIColor *)XK_fmColor_B2
{
    return XK_FMCOLOR_HEX(0x666666);

}
+ (UIColor *)XK_fmColor_B3
{
    return XK_FMCOLOR_HEX(0x888888);;

}
+ (UIColor *)XK_fmColor_B4
{
    return XK_FMCOLOR_HEX(0x999999);
}
+ (UIColor *)XK_fmColor_B5
{
    return XK_FMCOLOR_HEX(0xCCCCCC);
}
+ (UIColor *)XK_fmColor_B6
{
    return XK_FMCOLOR_HEX(0xe6e6e6);
}
+ (UIColor *)XK_fmColor_B7
{
    return XK_FMCOLOR_HEX(0xf8f3f4);
}
+ (UIColor *)XK_fmColor_B8
{
    return XK_FMCOLOR_HEX(0xbbbbbb);
}

+ (UIColor *)XK_fmColor_sd1
{
    return [[self XK_fmColor_g1] colorWithAlphaComponent:0.3];
}

+ (UIColor *)XK_fmColor_Y1
{
#if UI_STYLE_YELLOW
    return XK_FMCOLOR_HEX(0xffda21);
#else
    return XK_FMCOLOR_HEX(0xfff440);
#endif
}

+ (UIColor *)XK_fmColor_Y2
{
#if UI_STYLE_YELLOW
    return XK_FMCOLOR_HEX(0xfecb51);
#else
    return XK_FMCOLOR_HEX(0xfbd973);
#endif
}

+ (UIColor *)XK_fmColor_Y3
{
#if UI_STYLE_YELLOW
    return XK_FMCOLOR_HEX(0xfe9a42);
#else
    return XK_FMCOLOR_HEX(0xecc85a);
#endif
}

+ (UIColor *)XK_fmColor_BL1
{
    return XK_FMCOLOR_HEX(0x289ef3);
}
+ (UIColor *)XK_fmColor_BL2
{
    return XK_FMCOLOR_HEX(0x8dc8fe);
}
+ (UIColor *)XK_fmColor_BL3
{
    return XK_FMCOLOR_HEX(0x77cdea);
}
+ (UIColor *)XK_fmColor_BL4
{
    return XK_FMCOLOR_HEX(0x54c2e7);
}
+ (UIColor *)XK_fmColor_BL5
{
    return XK_FMCOLOR_HEX(0x7ad5ff);
}
+ (UIColor *)XK_fmColor_P1
{
    return XK_FMCOLOR_HEX(0xde9bfd);
}

+ (UIColor *)XK_fmColor_ZB3
{
    return XK_FMCOLOR_HEX(0x9c7231);

}
+ (UIColor *)XK_fmColor_ZB4
{
    return XK_FMCOLOR_HEX(0x6760bd);
    
}

+ (UIColor *)XK_fmColor_RED
{
    return XK_FMCOLOR_HEX(0xed3d3d);

}
+ (UIColor *)XK_fmColor_BGC
{
    return XK_FMCOLOR_HEX(0xf0f0f0);

}
+ (UIColor *)XK_fmColor_BG2
{
    return [XK_FMColor XK_fmColor_B2];
}

+ (UIColor *)XK_fmColor_blue
{
    return XK_FMCOLOR_HEX(0x2db6fd);
}

+ (UIColor *)XK_fmColor_343434
{
    return XK_FMCOLOR_HEX(0x343434);
}
+ (UIColor *)XK_fmColor_fed934
{
    return XK_FMCOLOR_HEX(0xfcd934);
}
+ (UIColor *)XK_fmColor_fe9a42
{
    return XK_FMCOLOR_HEX(0xfe9a42);
}
+ (UIColor *)XK_fmColor_666666
{
    return XK_FMCOLOR_HEX(0x666666);
}
+ (UIColor *)XK_fmColor_ffbb2a
{
    return XK_FMCOLOR_HEX(0xffbb2a);
}
+ (UIColor *)XK_fmColor_999999
{
    return XK_FMCOLOR_HEX(0x999999);
}
+ (UIColor *)XK_fmColor_cfcfcf
{
    return XK_FMCOLOR_HEX(0xcfcfcf);
}

+ (UIColor *)XK_fmColor_f7f7f7
{
    return XK_FMCOLOR_HEX(0xf7f7f7);
}
+ (UIColor *)XK_fmColor_e8e8e8
{
    return XK_FMCOLOR_HEX(0xe8e8e8);
}

+ (UIColor*)XK_fmColor_e40046
{
    return XK_FMCOLOR_HEX(0xe40046);
}

+ (UIColor*)XK_fmColor_half_black
{
    return [UIColor colorWithWhite:0 alpha:0.5];
}

+ (UIColor*)XK_fmColor_Game_Red
{
    return XK_FMCOLOR_RGB(188, 68, 63);
}

+ (UIColor*)XK_fmColor_Game_Green
{
    return XK_FMCOLOR_RGB(30, 65, 49);
}

#pragma mark - 男人帮过期色值

+ (UIColor *)XK_fmColor_c1
{
    return XK_FMCOLOR_HEX(0x1c232c);
}

+ (UIColor *)XK_fmColor_c2
{
    return XK_FMCOLOR_HEX(0xa4925a);
}
+ (UIColor *)XK_fmColor_c3
{
    return XK_FMCOLOR_HEX(0x29738f);
}

+ (UIColor *)XK_fmColor_c4
{
    return XK_FMCOLOR_HEX(0x3c424a);
}

+ (UIColor *)XK_fmColor_g1
{
    return XK_FMCOLOR_HEX(0x030303);
}

+ (UIColor *)XK_fmColor_g2
{
    return XK_FMCOLOR_HEX(0x6d6f74);
}

+ (UIColor *)XK_fmColor_g3
{
    return XK_FMCOLOR_HEX(0xaeb0b7);
}

+ (UIColor *)XK_fmColor_g4
{
    return XK_FMCOLOR_HEX(0xdadce3);
}

+ (UIColor *)XK_fmColor_g5
{
    return XK_FMCOLOR_HEX(0xf3f4fa);
}

+ (UIColor *)XK_fmColor_g6
{
    return XK_FMCOLOR_HEX(0xf1f4f8);
}

+ (UIColor *)XK_fmColor_red
{
    return XK_FMCOLOR_HEX(0xcc3333);
}

+ (UIColor *)XK_fmColor_picLoadingBg
{
//    XK_FMCOLOR_HEX(0xeaebf1)
    return [UIColor whiteColor];
}

+ (UIColor *)XK_fmColor_btn1_text_disable
{
    return XK_FMCOLOR_RGBA(255,255,255,0.4);
}
+ (UIColor *)XK_fmColor_btn1_text_normal
{
    return [UIColor whiteColor];
}
+ (UIColor *)XK_fmColor_btn1_text_press
{
    return XK_FMCOLOR_RGBA(255,255,255,0.8);
}

+ (UIColor *)XK_fmColor_btn1_fill_disable
{
    return [XK_FMColor XK_fmColor_c2];
}
+ (UIColor *)XK_fmColor_btn1_fill_normal
{
    return [XK_FMColor XK_fmColor_c2];
}
+ (UIColor *)XK_fmColor_btn1_fill_press
{
    return XK_FMCOLOR_HEX(0x8a7535);
}


+ (UIColor *)XK_fmColor_btn3_text_disable
{
    return XK_FMCOLOR_RGBA(255,255,255,0.4);
}
+ (UIColor *)XK_fmColor_btn3_text_normal
{
    return [UIColor whiteColor];
}
+ (UIColor *)XK_fmColor_btn3_text_press
{
    return XK_FMCOLOR_RGBA(255,255,255,0.8);
}

+ (UIColor *)XK_fmColor_btn3_fill_disable
{
    return [XK_FMColor XK_fmColor_c1];
}
+ (UIColor *)XK_fmColor_btn3_fill_normal
{
    return [XK_FMColor XK_fmColor_c1];
}
+ (UIColor *)XK_fmColor_btn3_fill_press
{
    return XK_FMCOLOR_HEX(0x3e444b);
}


+ (UIColor *)XK_fmColor_btn5_text_disable
{
    return XK_FMCOLOR_HEXAndAlpha(0x6d6f74, 0.4);
}
+ (UIColor *)XK_fmColor_btn5_text_normal
{
    return [XK_FMColor XK_fmColor_g2];
}
+ (UIColor *)XK_fmColor_btn5_text_press
{
    return [UIColor whiteColor];
}

+ (UIColor *)XK_fmColor_btn5_fill_disable
{
    return [UIColor whiteColor];
}
+ (UIColor *)XK_fmColor_btn5_fill_normal
{
    return [UIColor whiteColor];
}
+ (UIColor *)XK_fmColor_btn5_fill_press
{
    return [XK_FMColor XK_fmColor_g2];
}

+ (UIColor *)XK_fmColor_btn6_fill_press
{
    return XK_FMCOLOR_HEXAndAlpha(0xaf3434, 1);
}

+ (UIColor *)XK_fmColor_btn8_fill_disable
{
     return XK_FMCOLOR_HEXAndAlpha(0x595e65, 0.28);
}
+ (UIColor *)XK_fmColor_btn8_text_disable
{
    return XK_FMCOLOR_HEX(0xffffff);
}
+ (UIColor *)XK_fmColor_btn8_fill_press
{
    return XK_FMCOLOR_HEXAndAlpha(0x595e65, 1);
}
+ (UIColor *)XK_fmColor_btn8_text_press
{
    return XK_FMCOLOR_HEXAndAlpha(0xffffff,0.5) ;
}


+ (UIColor *)XK_fmColor_btn9_fill_disable
{
    return [self XK_fmColor_c3];
}
+ (UIColor *)XK_fmColor_btn9_text_disable
{
    return XK_FMCOLOR_HEXAndAlpha(0xffffff,0.28);
}
+ (UIColor *)XK_fmColor_btn9_fill_normal
{
    return [self XK_fmColor_c3];
}
+ (UIColor *)XK_fmColor_btn9_text_normal
{
    return [UIColor whiteColor];
}
+ (UIColor *)XK_fmColor_btn9_fill_press
{
    return XK_FMCOLOR_HEXAndAlpha(0x1b627b, 1);
}
+ (UIColor *)XK_fmColor_btn9_text_press
{
    return XK_FMCOLOR_HEXAndAlpha(0xffffff,0.5) ;
}

+ (UIColor *)XK_fmColor_main{
    return XK_FMCOLOR_HEX(0xf7d15c);
}

//转换带#的颜色值
+ (UIColor *)fmColorFromString:(NSString*)strColor
{
    if (!strColor)
        return nil;
    NSMutableString *color = [NSMutableString stringWithString:strColor];
    // 转换成标准16进制数
    [color replaceCharactersInRange:[strColor rangeOfString:@"#" ] withString:@"0x"];
    
    // 十六进制字符串转成整形。
    long colorLong = strtoul([color cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    return XK_FMCOLOR_HEX(colorLong);
}

+ (UIColor *)XK_fmColor_e1 {
    return XK_FMCOLOR_HEX(0xED4264);
}

+ (UIColor *)XK_fmColor_e2 {
    return XK_FMCOLOR_HEX(0xFF3939);
}

+ (UIColor *)XK_fmColor_e3 {
    return XK_FMCOLOR_HEX(0x16A951);
}

+ (UIColor *)XK_fmColor_e4 {
    return XK_FMCOLOR_HEX(0xCACACC);
}

+ (UIColor *)XK_fmColor_e5 {
    return XK_FMCOLOR_HEX(0xC9C9C9);
}

+ (UIColor *)XK_fmColor_e6 {
    return XK_FMCOLOR_HEX(0xFFDA23);
}

+ (UIColor *)XK_fmColor_e7 {
    return XK_FMCOLOR_HEX(0xFFCA27);
}

+ (UIColor *)XK_fmColor_e8 {
    return XK_FMCOLOR_HEX(0x484D8F);
}

+ (UIColor *)XK_fmColor_e9 {
    return XK_FMCOLOR_HEX(0xFEFEFF);
}

+ (UIColor *)XK_fmColor_e10 {
    return XK_FMCOLOR_HEX(0xF6F6F9);
}

@end

