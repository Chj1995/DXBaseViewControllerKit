//
//  XKConstants.h
//  XiongKeLive
//
//  Created by chw on 16/6/6.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKConstants_h
#define XKConstants_h

#ifdef DEBUG
#define NSLog(...) NSLog(@"%@", [NSString stringWithFormat:__VA_ARGS__])
#define DMLog(...) NSLog(@"%s line:%d :%@", __PRETTY_FUNCTION__, __LINE__,[NSString stringWithFormat:__VA_ARGS__])
#define DDLogError(...) NSLog(@"%s line:%d :%@", __PRETTY_FUNCTION__, __LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
//#define NSLog(...)
#define DMLog(...)
#define DDLogError(...)
#endif


static inline void FMRunInMainQueue(dispatch_block_t block){
    if ([NSThread isMainThread]) {
        if (block)
            block();
    } else {
        if (block)
            dispatch_async(dispatch_get_main_queue(), block);
    }
}

static inline void FMRunInBackgroudQueue(dispatch_block_t block){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            if(block)
            {
                block();
            }
        }
    });
}

//各种Block定义
#pragma mark - BlockDefine
typedef void (^FMBlock)(void);
typedef void (^FMTimeBlock) (void);
typedef void (^FMBOOLBlock)(BOOL boolean);
typedef void (^FMIndexBlock)(NSInteger index);
typedef void (^FMStringBlock)(NSString *string);
typedef void (^FMIndexStringBlock)(NSInteger index,NSString *string);
typedef void (^FMBoolStringBlock)(BOOL boolean, NSString *string);
typedef void (^FMSenderBlock)(id sender);
typedef void (^FMDoubleBlock)(double value);
typedef void (^FMFloatBlock)(CGFloat value);
typedef void (^FMKeyValueBlock)(id key, id obj);
typedef void (^FMBooleanValueBlock)(BOOL boolean, id value);
typedef void (^FMTwoStringBlock)(NSString *string1, NSString *string2);
typedef void (^FMTwoVlaueBlock)(id sender, BOOL boolean);

//字符串为空处理
#define isnull(obj) [obj isKindOfClass:[NSNull class]] || obj == nil ? @"" : [NSString stringWithFormat:@"%@",obj]

#define  XK_DEFAULE_DATA_SIZE   20

#define SCREEN_BOUNDS ([[UIScreen mainScreen]bounds])
/// 屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
/// 屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
/// 系统 scale
#define SCREEN_SCALE ([[UIScreen mainScreen] scale])
// KeyWindow
#define KeyWindow ([UIApplication sharedApplication].keyWindow)

//判断系统版本
#define IOS5 ([UIDevice currentDevice].systemVersion.floatValue >= 5)
#define IOS6 ([UIDevice currentDevice].systemVersion.floatValue >= 6)
#define IOS7 ([UIDevice currentDevice].systemVersion.floatValue >= 7)
#define IOS8 ([UIDevice currentDevice].systemVersion.floatValue >= 8)
#define IOS8Before ([UIDevice currentDevice].systemVersion.floatValue < 8.0f)
#define IOS9 ([UIDevice currentDevice].systemVersion.floatValue >= 9)
#define IOS10Before ([UIDevice currentDevice].systemVersion.floatValue <= 10)
#define IOS10 ([UIDevice currentDevice].systemVersion.floatValue >= 10)
#define IOS11 ([UIDevice currentDevice].systemVersion.floatValue >= 11)
#define IOS12 ([UIDevice currentDevice].systemVersion.floatValue >= 12)
#define IOS13 ([UIDevice currentDevice].systemVersion.floatValue >= 13)
#define IOS11Before ([UIDevice currentDevice].systemVersion.floatValue < 11.0f)
//判断手机型号
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6 ([UIScreen mainScreen].bounds.size.width == 375)
#define iPhone6p ([UIScreen mainScreen].bounds.size.width == 414)
#define iPhoneX ([UIScreen mainScreen].bounds.size.height == 812)


//判断iPhoneX，Xs（iPhoneX，iPhoneXs）
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXsMax
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size)&& !isPad : NO)

//判断iPhoneX所有系列

#define IS_PhoneXAll ((([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0f) && ([[[[UIApplication sharedApplication] delegate] window] safeAreaInsets].bottom > 0.0))? YES : NO)
#define k_Height_NavContentBar 44.0f
#define k_Height_StatusBar (IS_PhoneXAll? 44.0 : 20.0)
#define k_Height_NavBar (IS_PhoneXAll ? 88.0 : 64.0)
#define k_Height_TabBar (IS_PhoneXAll ? 83.0 : 49.0)

#define kIsiPhoneX    (fabs((double)[[UIScreen mainScreen] bounds].size.height - ( double )812 ) < DBL_EPSILON )
#define STATUS_BAR_HIGHT    (IS_PhoneXAll ? 44: 20)
#define NAVI_BAR_HIGHT      (IS_PhoneXAll ? 88: 64)
#define TAB_BAR_ADDING       (IS_PhoneXAll ? 34 : 0)


#define FMString(x) NSLocalizedString(x, nil)

#define  XK_WEAKSELF      __weak typeof(self) weakSelf                    = self;
#define  XK_STRONGSELF(weakSelf)    __strong __typeof(weakSelf)strongSelf = weakSelf;

#define APPName [[NSBundle mainBundle] infoDictionary][@"CFBundleName"]
#define APPVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]
#define APPBuildVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"]
#define APPBundleIdentifier [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"]


#pragma mark - ThirdPart
//第三方key等
//#define K_KEY_UMENG             @"586b4f3245297d42c1000e1d"
#define K_KEY_BAIDU             @"2zEe8EAtNm0mG9GBGbbTrWU1ZIqTUZR4"
//#define K_APPID_QQ              @"1107390113"
//#define K_SCRECT_QQ             @"fQaEBimk84sAtCNW"

#define K_APPID_QQ              @"101866295"
#define K_SCRECT_QQ             @"6c0c8e4ee3329289aaee3f7631338451"

#define K_KEY_WEIBO             @"1803990925"
#define K_SCRECT_WEIBO          @"a82b7f5785e1d43baf7fb88be6247e4c"
#define K_REDIRECTURI_WEIBO     @"https://api.weibo.com/oauth2/default.html"

#pragma mark - 礼物文件缓存地址
#define kGiftCachePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"MeiSuiGiftPackage"]
#define kGiftTmpPath NSTemporaryDirectory()
// 礼物对象缓存地址
#define kGiftCodingCachPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"MeiSuiGiftPackage.data"]

#define K_WebView_RankList_path  @"ms://leaderboard"  // 榜单排行榜 路由地址

#endif /* FMConstants_h */
