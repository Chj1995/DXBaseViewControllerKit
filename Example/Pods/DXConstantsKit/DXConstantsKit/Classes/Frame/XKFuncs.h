//
//  XKFuncs.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/22.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKFuncs_h
#define XKFuncs_h

#ifdef __OBJC__


#ifdef DEBUG
#define DLog(fmt, ...) {NSLog((@"^ %s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#else
#define DLog(...)
#endif

//字符串转换
#define KSTRING_FORMAT(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

/// 屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
/// 屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
/// 系统 scale
#define SCREEN_SCALE ([[UIScreen mainScreen] scale])
CG_INLINE CGFloat XKFixWidth(CGFloat width) {
    width = width * SCREEN_WIDTH / 375.0;
    return width;
}
static inline UIFont* KNornalFont(CGFloat fontSize) {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}
static inline UIFont* KLightFont(CGFloat fontSize) {
    return [UIFont fontWithName:@"PingFangSC-Light" size:fontSize];
}
static inline UIFont* KBlodFont(CGFloat fontSize) {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
}
static inline UIFont* KMediumFont(CGFloat fontSize) {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}
static inline UIFont* KMediumMTFont(CGFloat fontSize) { // 斜体
    CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(5 * (CGFloat)M_PI / 180), 1, 0, 0);
    UIFontDescriptor *desc = [UIFontDescriptor fontDescriptorWithName:KMediumFont(10).fontName matrix:matrix];
    return [UIFont fontWithDescriptor:desc size:fontSize];
}
//获取版本号
#define KAPPShortVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]
#define KAPPBundleIdentifier [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"]
#define KAppName [[NSBundle mainBundle] infoDictionary][@"CFBundleName"]

//配置和用户信息管理
#define KAPPConfig [XKGlobalConfigHttpManager shareInstance]
#define KUserConfig [XKUserHttpManager sharedInstance]

//通知
#define XK_POST_NOTIFY(name) [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil]
#define XK_POST_NOTIFY_WITH_INFO(name,data) [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:(data)]
#define XK_POST_NOTIFY_WITH_Object(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]
static inline BOOL KISArray(id object) {
    if (object && [object isKindOfClass:[NSArray class]] && ((NSArray *)object).count > 0) {
        return YES;
    }
    return NO;
}
//空值判断
static inline BOOL KISString(id value) {
    if (!value || [value isKindOfClass:[NSNull class]] || (([NSStringFromClass([value class])isEqualToString:@"__NSCFConstantString"] || [NSStringFromClass([value class])isEqualToString:@"__NSCFString"]) &&  (((NSString *)value).length == 0 || [(NSString *)value isEqualToString:@""]))) {
        return NO;
    }
    return YES;
}
static inline BOOL KISDictionary(id object) {
    if (object && [object isKindOfClass:[NSDictionary class]] && ((NSDictionary *)object).allKeys.count > 0) {
        return YES;
    }
    return NO;
}
static inline BOOL KISData(id data){
     if (data != nil && ![data isKindOfClass:[NSClassFromString(@"_NSZeroData") class]]) {
         return YES;
     }
    return NO;
}

typedef void (^XKBlock)(void);
typedef void (^XKOneArgBlock)(id arg);
typedef void (^XKKeyValueBlock)(id key,id value);
typedef void (^XKIndexValueBlock)(NSInteger index,id value);
typedef void (^XKBoolObjectBlock)(BOOL result,id object);
typedef void (^XKSelectBlock)(NSInteger selectedIndex);
typedef void (^JFloatBlock)(CGFloat value);

#endif
#endif /* XKFuncs_h */
