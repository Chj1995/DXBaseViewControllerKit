//
//  XK_FMColor.h
//  XiongKeLive
//
//  Created by chw on 16/6/12.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

//转换十六进制值到rgb
#define XK_FMCOLOR_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define XK_FMCOLOR_HEXAndAlpha(rgbValue,alfa) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alfa]

#define XK_FMCOLOR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define XK_FMCOLOR_RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface XK_FMColor : NSObject

//顶部导航条颜色
+ (UIColor*)XK_fmColor_Navigation_Back;
+ (UIColor*)XK_fmColor_Navigation_Title; // 大标题
+ (UIColor*)XK_fmColor_Navigation_Title_B; // 小标题

//底部tabbar颜色
+ (UIColor*)XK_fmColor_TabBar_Back;
+ (UIColor*)XK_fmColor_TabBar_Title;

//例如商品详情底部那一行的颜色
+ (UIColor*)XK_fmColor_BottomView_Back;

//controller.view默认背景色s
+ (UIColor*)XK_fmColor_Controller_View_Background;

//分割线颜色，如tableview的cell之间
+ (UIColor*)XK_fmColor_Seperate_Line;

//边界线颜色，如view的borderColor
+ (UIColor*)XK_fmColor_Border_Line;

//cell被选中时的高亮颜色
+ (UIColor*)XK_fmColor_Cell_Hightlight_Color;
#pragma mark - 直播色值
+ (UIColor *)XK_fmColor_JJ_Tabbar_Bg;
+ (UIColor *)XK_fmColor_JJ_white;

+ (UIColor *)XK_fmColor_white;
+ (UIColor *)XK_fmColor_white_half;

+ (UIColor *)XK_fmColor_R1;
+ (UIColor *)XK_fmColor_R1_Half;
+ (UIColor *)XK_fmColor_R2;

+ (UIColor *)XK_fmColor_A1;
+ (UIColor *)XK_fmColor_A2;
+ (UIColor *)XK_fmColor_A3;
+ (UIColor *)XK_fmColor_A4;
+ (UIColor *)XK_fmColor_A5;
+ (NSArray<UIColor *> *)XK_fmColor_Change1;
+ (NSArray<UIColor *> *)XK_fmColor_Change2;
+ (NSArray<UIColor *> *)XK_fmColor_Change3;
+ (NSArray<UIColor *> *)XK_fmColor_Change4;
+ (NSArray<UIColor *> *)XK_fmColor_Change5;
+ (NSArray<UIColor *> *)XK_fmColor_Change6;
+ (NSArray<UIColor *> *)XK_fmColor_Change7;
+ (NSArray<UIColor *> *)XK_fmColor_Change8;
+ (NSArray<UIColor *> *)XK_fmColor_Change9;
+ (NSArray<UIColor *> *)XK_fmColor_Change10;
+ (NSArray<UIColor *> *)XK_fmColor_Change11;
+ (NSArray<UIColor *> *)fmCGColor_Change1;
+ (NSArray<UIColor *> *)fmCGColor_Change2;
+ (NSArray<UIColor *> *)fmCGColor_Change3;
+ (NSArray<UIColor *> *)fmCGColor_Change4;

// 颜色渐变
+ (CAGradientLayer *)XK_fmColor_Gradient:(NSArray<UIColor *> *)changeColor rect:(CGRect)rect cornerRadius:(NSInteger)cornerRadius;
+ (UIColor *)XK_fmColor_D1;
+ (UIColor *)XK_fmColor_D2;

+ (UIColor *)XK_fmColor_B1;
+ (UIColor *)XK_fmColor_B2;
+ (UIColor *)XK_fmColor_B3;
+ (UIColor *)XK_fmColor_B4;
+ (UIColor *)XK_fmColor_B5;
+ (UIColor *)XK_fmColor_B6;
+ (UIColor *)XK_fmColor_B7;
+ (UIColor *)XK_fmColor_B8;

+ (UIColor *)XK_fmColor_sd1;//字体阴影的颜色

+ (UIColor *)XK_fmColor_Y1;
+ (UIColor *)XK_fmColor_Y2;
+ (UIColor *)XK_fmColor_Y3;

+ (UIColor *)XK_fmColor_BL1;
+ (UIColor *)XK_fmColor_BL2;
+ (UIColor *)XK_fmColor_BL3;
+ (UIColor *)XK_fmColor_BL4;
+ (UIColor *)XK_fmColor_BL5;
+ (UIColor *)XK_fmColor_P1;

+ (UIColor *)XK_fmColor_main;

+ (UIColor *)XK_fmColor_RED;
+ (UIColor *)XK_fmColor_BGC;
+ (UIColor *)XK_fmColor_BG2;

+ (UIColor *)XK_fmColor_ZB3;
+ (UIColor *)XK_fmColor_ZB4;

+ (UIColor *)XK_fmColor_Line1;
+ (UIColor *)XK_fmColor_Line2;

+ (UIColor *)XK_fmColor_blue;

+ (UIColor *)XK_fmColor_343434;
+ (UIColor *)XK_fmColor_666666;
+ (UIColor *)XK_fmColor_999999;
+ (UIColor *)XK_fmColor_e8e8e8;
+ (UIColor *)XK_fmColor_cfcfcf;
+ (UIColor *)XK_fmColor_f7f7f7;
+ (UIColor *)XK_fmColor_fed934;
+ (UIColor *)XK_fmColor_fe9a42;
+ (UIColor *)XK_fmColor_e40046;
+ (UIColor *)XK_fmColor_ffbb2a;
///黑色半透明
+ (UIColor*)XK_fmColor_half_black;

+ (UIColor*)XK_fmColor_Game_Red;
+ (UIColor*)XK_fmColor_Game_Green;

#pragma mark - 男人帮过期色值

+ (UIColor *)XK_fmColor_c1;
+ (UIColor *)XK_fmColor_c2;
+ (UIColor *)XK_fmColor_c3;
+ (UIColor *)XK_fmColor_c4;

+ (UIColor *)XK_fmColor_g1;
+ (UIColor *)XK_fmColor_g2;
+ (UIColor *)XK_fmColor_g3;
+ (UIColor *)XK_fmColor_g4;
+ (UIColor *)XK_fmColor_g5;
+ (UIColor *)XK_fmColor_g6;

+ (UIColor *)XK_fmColor_red;



+ (UIColor *)XK_fmColor_picLoadingBg;

+ (UIColor *)XK_fmColor_btn1_text_disable;
+ (UIColor *)XK_fmColor_btn1_text_normal;
+ (UIColor *)XK_fmColor_btn1_text_press;

+ (UIColor *)XK_fmColor_btn1_fill_disable;
+ (UIColor *)XK_fmColor_btn1_fill_normal;
+ (UIColor *)XK_fmColor_btn1_fill_press;


+ (UIColor *)XK_fmColor_btn3_text_disable;
+ (UIColor *)XK_fmColor_btn3_text_normal;
+ (UIColor *)XK_fmColor_btn3_text_press;

+ (UIColor *)XK_fmColor_btn3_fill_disable;
+ (UIColor *)XK_fmColor_btn3_fill_normal;
+ (UIColor *)XK_fmColor_btn3_fill_press;


+ (UIColor *)XK_fmColor_btn5_text_disable;
+ (UIColor *)XK_fmColor_btn5_text_normal;
+ (UIColor *)XK_fmColor_btn5_text_press;

+ (UIColor *)XK_fmColor_btn5_fill_disable;
+ (UIColor *)XK_fmColor_btn5_fill_normal;
+ (UIColor *)XK_fmColor_btn5_fill_press;

+ (UIColor *)XK_fmColor_btn6_fill_press;

+ (UIColor *)XK_fmColor_btn8_fill_disable;
+ (UIColor *)XK_fmColor_btn8_text_disable;
+ (UIColor *)XK_fmColor_btn8_fill_press;
+ (UIColor *)XK_fmColor_btn8_text_press;

+ (UIColor *)XK_fmColor_btn9_fill_disable;
+ (UIColor *)XK_fmColor_btn9_text_disable;
+ (UIColor *)XK_fmColor_btn9_fill_normal;
+ (UIColor *)XK_fmColor_btn9_text_normal;
+ (UIColor *)XK_fmColor_btn9_fill_press;
+ (UIColor *)XK_fmColor_btn9_text_press;


//转换带#的颜色值
+ (UIColor *)fmColorFromString:(NSString*)strColor;

+ (UIColor *)XK_fmColor_e1;
+ (UIColor *)XK_fmColor_e2;
+ (UIColor *)XK_fmColor_e3;
+ (UIColor *)XK_fmColor_e4;
+ (UIColor *)XK_fmColor_e5;
+ (UIColor *)XK_fmColor_e6;
+ (UIColor *)XK_fmColor_e7;
+ (UIColor *)XK_fmColor_e8;
+ (UIColor *)XK_fmColor_e9;
+ (UIColor *)XK_fmColor_e10;

@end
