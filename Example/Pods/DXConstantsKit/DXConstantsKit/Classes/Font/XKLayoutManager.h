//
//  FMLayoutManager.h
//  XiongKeLive
//
//  Created by chw on 16/6/6.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XKLayoutManagerInstance     [XKLayoutManager shareInstance]

#define XKLayoutManagerLeftMargin   [XKLayoutManager shareInstance].fmLeftMargin
#define XKLayoutManagerRightMargin  [XKLayoutManager shareInstance].fmRightMargin

@interface XKLayoutManager : NSObject

+ (instancetype)shareInstance;

/**
 * @brief 默认尺寸的基数，按找不同屏幕的尺寸不一样.默认按照4.7寸的屏来设置
 *
 */
@property (nonatomic,assign) CGFloat fmWidthBase;
@property (nonatomic,assign) CGFloat fmHeightBase;
@property (nonatomic,assign) CGFloat fmFontBase;

@property (nonatomic, assign) CGFloat fmLeftMargin;         //默认的左边距
@property (nonatomic, assign) CGFloat fmRightMargin;        //默认的右边距

@property (nonatomic, assign) CGFloat fmStatusBarHeight;    //iphoneX是44，其他20
@property (nonatomic, assign) CGFloat fmTopBarHeight;       //默认64，navBar+statusBar高度
@property (nonatomic, assign) CGFloat fmBottomBarHeight;    //默认49
@property (nonatomic, assign) CGFloat fmBottomBaseLineInset;//iphoneX才需要调整的34

@property (nonatomic, strong) UIFont *fmNavTitleFont;

@property (nonatomic, assign) CGFloat fmIfSHowFloatViewHeight;//当弹起最小话的时候，商城和个人中心需要拉高


#pragma mark - MQFont
@property (nonatomic,assign) CGFloat xkFont_8;
@property (nonatomic,assign) CGFloat xkFont_9;
@property (nonatomic,assign) CGFloat xkFont_10;
@property (nonatomic,assign) CGFloat xkFont_11;
@property (nonatomic,assign) CGFloat xkFont_12;
@property (nonatomic,assign) CGFloat xkFont_13;
@property (nonatomic,assign) CGFloat xkFont_14;
@property (nonatomic,assign) CGFloat xkFont_15;
@property (nonatomic,assign) CGFloat xkFont_16;
@property (nonatomic,assign) CGFloat xkFont_17;
@property (nonatomic,assign) CGFloat xkFont_18;
@property (nonatomic,assign) CGFloat xkFont_19;
@property (nonatomic,assign) CGFloat xkFont_20;
@property (nonatomic,assign) CGFloat xkFont_22;
@property (nonatomic,assign) CGFloat xkFont_23;
@property (nonatomic,assign) CGFloat xkFont_24;
@property (nonatomic,assign) CGFloat xkFont_27;
@property (nonatomic,assign) CGFloat xkFont_29;
@property (nonatomic,assign) CGFloat xkFont_30;
@property (nonatomic,assign) CGFloat xkFont_32;
@property (nonatomic,assign) CGFloat xkFont_36;
@property (nonatomic,assign) CGFloat xkFont_40;
@property (nonatomic,assign) CGFloat xkFont_50;
@property (nonatomic,assign) CGFloat xkFont_70;

@property (nonatomic,strong) UIFont *xkDefaultFont_8;
@property (nonatomic,strong) UIFont *xkDefaultFont_9;
@property (nonatomic,strong) UIFont *xkDefaultFont_10;
@property (nonatomic,strong) UIFont *xkDefaultFont_11;
@property (nonatomic,strong) UIFont *xkDefaultFont_12;
@property (nonatomic,strong) UIFont *xkDefaultFont_13;
@property (nonatomic,strong) UIFont *xkDefaultFont_14;
@property (nonatomic,strong) UIFont *xkDefaultFont_15;
@property (nonatomic,strong) UIFont *xkDefaultFont_16;
@property (nonatomic,strong) UIFont *xkDefaultFont_17;
@property (nonatomic,strong) UIFont *xkDefaultFont_18;
@property (nonatomic,strong) UIFont *xkDefaultFont_19;
@property (nonatomic,strong) UIFont *xkDefaultFont_20;
@property (nonatomic,strong) UIFont *xkDefaultFont_22;
@property (nonatomic,strong) UIFont *xkDefaultFont_23;
@property (nonatomic,strong) UIFont *xkDefaultFont_24;
@property (nonatomic,strong) UIFont *xkDefaultFont_27;
@property (nonatomic,strong) UIFont *xkDefaultFont_29;
@property (nonatomic,strong) UIFont *xkDefaultFont_30;
@property (nonatomic,strong) UIFont *xkDefaultFont_32;
@property (nonatomic,strong) UIFont *xkDefaultFont_36;
@property (nonatomic,strong) UIFont *xkDefaultFont_40;
@property (nonatomic,strong) UIFont *xkDefaultFont_50;
@property (nonatomic,strong) UIFont *xkDefaultFont_70;

@property (nonatomic,strong) UIFont *xkBlodFont_9;
@property (nonatomic,strong) UIFont *xkBlodFont_10;
@property (nonatomic,strong) UIFont *xkBlodFont_11;
@property (nonatomic,strong) UIFont *xkBlodFont_12;
@property (nonatomic,strong) UIFont *xkBlodFont_13;
@property (nonatomic,strong) UIFont *xkBlodFont_14;
@property (nonatomic,strong) UIFont *xkBlodFont_15;
@property (nonatomic,strong) UIFont *xkBlodFont_16;
@property (nonatomic,strong) UIFont *xkBlodFont_17;
@property (nonatomic,strong) UIFont *xkBlodFont_18;
@property (nonatomic,strong) UIFont *xkBlodFont_19;
@property (nonatomic,strong) UIFont *xkBlodFont_20;
@property (nonatomic,strong) UIFont *xkBlodFont_22;
@property (nonatomic,strong) UIFont *xkBlodFont_23;
@property (nonatomic,strong) UIFont *xkBlodFont_24;
@property (nonatomic,strong) UIFont *xkBlodFont_27;
@property (nonatomic,strong) UIFont *xkBlodFont_30;


@property (nonatomic,strong) UIFont *font1;
@property (nonatomic,strong) UIFont *font2;
@property (nonatomic,strong) UIFont *font3;
@property (nonatomic,strong) UIFont *font4;
@property (nonatomic,strong) UIFont *font5;
@property (nonatomic,strong) UIFont *font6;
@property (nonatomic,strong) UIFont *font7;
@property (nonatomic,strong) UIFont *font8;
@property (nonatomic,strong) UIFont *font9;
@property (nonatomic,strong) UIFont *font10;
@property (nonatomic,strong) UIFont *font11;
@property (nonatomic,strong) UIFont *font12;
@property (nonatomic,strong) UIFont *font13;
@property (nonatomic,strong) UIFont *font14;
@property (nonatomic,strong) UIFont *font15;
@property (nonatomic,strong) UIFont *font16;
@property (nonatomic,strong) UIFont *font17;

@end
