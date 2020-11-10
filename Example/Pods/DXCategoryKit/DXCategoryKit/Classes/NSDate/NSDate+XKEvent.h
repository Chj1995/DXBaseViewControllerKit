//
//  NSDate+XKEvent.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString * const kFORMATTERYMD;
extern NSString * const kFORMATTERYMDH;
extern NSString * const kFORMATTERYMDHm;
extern NSString * const kFORMATTERYMDHms;

@interface NSDate (XKEvent)
/// 获取时间搓
- (NSTimeInterval)getTime;

/// 添加时区差
- (NSDate *)serverDateToLocalDate;

/// 判断是否是今天
/// @param days 第几天
- (BOOL)isTodayWidthDay:(NSInteger)days;

/// 日期是否一样
/// @param date 日期
- (BOOL)isEqualToDateWithNoTime:(NSDate *)date;
- (BOOL)isEqualToDateWithTime:(NSDate *)date;
/// 判断是否是今天
/// @param time 时间戳
+ (BOOL)isTodayWithTime:(NSTimeInterval)time;

/// 获取一年里的月份里的j天数
/// @param year 哪一年
/// @param month 哪个月
+ (NSInteger)getDaysInYear:(NSInteger)year month:(NSInteger)month;

/// 日期转字符串
/// @param format 转换格式
- (NSString *)dateToString:(NSString *)format;

/// 字符串转date
/// @param timeString 时间字符串
/// @param format 转换类型
+ (NSDate *)stringToDate:(NSString *)timeString format:(NSString *)format;
- (NSDate *)stringToDate:(NSString *)timeString format:(NSString *)format;
- (NSString *)transformDateWithHaveHourMunite:(BOOL)have canShowSinceTime:(BOOL)canShow;
-(NSString *)getDisplayTimeString;
/// 获取当前星期几
- (NSInteger )getWeekIndex;


- (NSDateComponents *)getYearMonthDayComponent;
- (NSDateComponents *)getComponentWithUnit:(NSCalendarUnit)unitFlags;
@end

NS_ASSUME_NONNULL_END
