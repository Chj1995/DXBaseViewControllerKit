//
//  NSString+XKFunc.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/27.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XKFunc)

/// 拼接图片地址
/// @param url url地址
- (NSString *)jointUrl:(NSString *)url;

+ (NSString*)stringWithUInteger:(NSUInteger)integer;
+ (NSString *)stringWithInteger:(NSInteger)integer;
- (BOOL)isPureInt;

+ (NSString*)getFileMD5WithPath:(NSString*)path;
- (NSString*)subStringWithLength:(NSInteger)length tail:(BOOL)tail;

+ (BOOL)isEmpty:(NSString *)str;

/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/// 判断版本是否要更新
/// @param version 新的版本号
/// @param old 旧版本号
+ (BOOL)compareVersionWithNew:(NSString *)version old:(NSString *)old;
@end

NS_ASSUME_NONNULL_END
