//
//  NSDate+XKEvent.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSDate+XKEvent.h"
#import <DXConstantsKit/DXConstantsKit.h>
NSString * const kFORMATTERYMD = @"yyyy-MM-dd";
NSString * const kFORMATTERYMDH = @"yyyy-MM-dd HH";
NSString * const kFORMATTERYMDHm = @"yyyy-MM-dd HH:mm";
NSString * const kFORMATTERYMDHms = @"yyyy-MM-dd HH:mm:ss";
static const CGFloat  _timeZone = 28800;
static NSDateFormatter * _formatter = nil;
static NSCalendar * _calendar = nil;
@implementation NSDate (XKEvent)
//获取传服务器的时间戳
- (NSTimeInterval)getTime {
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:self];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //默认是中国的时间 在1992年以下会多1小时的误差
    NSTimeInterval timeAdd = interval - _timeZone;
    if (timeAdd < 0) {
        timeAdd = 0;
    }
    NSInteger time = [self timeIntervalSince1970];
    time -= timeAdd;
    return time;
}

- (NSDate *)serverDateToLocalDate {
    NSTimeZone *toTimeZone = [NSTimeZone localTimeZone];
    NSInteger toGMTOffset = [toTimeZone secondsFromGMTForDate:self];
    if (_timeZone != toGMTOffset) {
        NSDate *date = [self dateByAddingTimeInterval:toGMTOffset - _timeZone];
        return date;
    }
    return self;
}


//判断当前日期是不是某天
- (BOOL)isTodayWidthDay:(NSInteger)days {
    if (self) {
        NSDateComponents *todayDateComponents = [[self class] todayDateComponents];
        todayDateComponents.day += days;
        NSDateComponents *curDateComponents = [self getYearMonthDayComponent];
        if (todayDateComponents.year == curDateComponents.year && todayDateComponents.month == curDateComponents.month && todayDateComponents.day == curDateComponents.day) {
            return YES;
        }
    }
    return NO;
}
- (BOOL)isEqualToDateWithNoTime:(NSDate *)date {
    NSDateComponents *curDateComponents = [self getYearMonthDayComponent];
    NSDateComponents *dateComponents = [date getYearMonthDayComponent];
    if (dateComponents.year == curDateComponents.year && dateComponents.month == curDateComponents.month && dateComponents.day == curDateComponents.day) {
        return YES;
    }
    return NO;
}
- (BOOL)isEqualToDateWithTime:(NSDate *)date {
    NSDateComponents *curDateComponents = [self getComponentWithUnit:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond];
    NSDateComponents *dateComponents = [date getComponentWithUnit:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond];
    if (dateComponents.year == curDateComponents.year && dateComponents.month == curDateComponents.month && dateComponents.day == curDateComponents.day && dateComponents.hour == curDateComponents.hour && dateComponents.minute == curDateComponents.minute && dateComponents.second == curDateComponents.second) {
        return YES;
    }
    return NO;
}


+ (BOOL)isTodayWithTime:(NSTimeInterval)timeInterval {
    if (timeInterval > 0) {
        NSDate *saveDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        return [saveDate isTodayWidthDay:0];
    }
    return NO;
}

+ (NSInteger)getDaysInYear:(NSInteger)year month:(NSInteger)month {
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
        return 31;
    }else if (month == 2){
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            return 29;
        }
        return 28;
    }else {
        return 30;
    }
}

//获取今天时间转换
+ (NSDateComponents *)todayDateComponents {
    return [[NSDate date]getYearMonthDayComponent];
}
#pragma mark - 时间转换
//日期转字符串
- (NSString *)dateToString:(NSString *)format {
    NSString *timeString = nil;
    if (self != nil) {
        [self setupFormatter];
        [_formatter setDateFormat:format];
        timeString = [_formatter stringFromDate:self];
    }
    return timeString;
}
- (NSDate *)stringToDate:(NSString *)timeString format:(NSString *)format {
    NSDateFormatter * formatter = [self setupFormatter];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:timeString];
    return date;
}
+ (NSDate *)stringToDate:(NSString *)timeString format:(NSString *)format {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter * formatter = [currentDate setupFormatter];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:timeString];
    return date;
}
- (NSDate *)appendDay:(NSInteger)day {
    return [self dateByAddingTimeInterval:24 * 60 * 60 * day];
}
- (NSInteger)_year {
    NSDateComponents *dateComponents = [self getComponentWithUnit:NSCalendarUnitYear];
    return dateComponents.year;
}
/**
 *  显示时间间隔，带几点几分。如x年x月x日 hh：mm
 *
 *  @param have         YES 带具体时间， NO 不带具体时间  (几点几分)
 *
 *  @return 刚刚 \ x分钟前 \ x小时前 \ 昨天 hh：mm \ 前天 hh：mm \ x月x日 hh：mm \ x年x月x日 hh：mm
 */
- (NSString *)transformDateWithHaveHourMunite:(BOOL)have canShowSinceTime:(BOOL)canShow {
    if (!self)
        return nil;
    NSDate *fromDate = self;
    NSTimeInterval time = [fromDate timeIntervalSince1970];
    NSDate *nowDate = [NSDate date];
    if (!canShow) {
        if (time > [nowDate timeIntervalSince1970])   //超过当前时间显示未知
            return @"未知时间";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeInterval temp = [nowDate timeIntervalSinceDate:fromDate];
    if (temp < 60)              //小于60秒
        return @"刚刚";
    else if (temp < 60*60)      //小于1小时
        return [NSString stringWithFormat:@"%d分钟前", ((int)temp)/60];
    else if (temp < 24*60*60)   //小于1天
        return [NSString stringWithFormat:@"%d小时前", ((int)temp)/(60*60)];
    else {
        NSTimeInterval t = [[nowDate appendDay:-1] timeIntervalSince1970];
        if (time > t)  {
            [formatter setDateFormat:@"HH:mm"];
            NSString *str = [formatter stringFromDate:fromDate];
            if (have)
                return [NSString stringWithFormat:@"昨天 %@", str];
            else
                return @"昨天";
        }
        t -= 24*60*60;   //前天开始时间
        //大于前天开始时间，即是前天
        if (time > t) {
            [formatter setDateFormat:@"HH:mm"];
            NSString *str = [formatter stringFromDate:fromDate];
            if (have)
                return [NSString stringWithFormat:@"前天 %@", str];
            else
                return @"前天";
        } else {
            if (fromDate._year != nowDate._year) {
                if (have)
                    [formatter setDateFormat:@"y年M月d日 HH:mm"];
                else
                    [formatter setDateFormat:@"y年M月d日"];
                return [formatter stringFromDate:fromDate];
            } else {
                if (have)
                    [formatter setDateFormat:@"M月d日 HH:mm"];
                else
                    [formatter setDateFormat:@"M月d日"];
                return [formatter stringFromDate:fromDate];
            }
        }
    }
    return @"未知时间";
}
-(NSString *)getDisplayTimeString
{
    ///转成本地时间，  可能自己已经是本地时间的  下面会做判断
    NSDate* localDate = [self getLocalTime];
    NSDate* now = [NSDate date];
    ///显示的时间 在 现在  之后
    if ([localDate compare:now] != NSOrderedAscending) {
        ///显示时间 不进行  本地时区转换
        localDate = self;
        ///再进行对比  如果还大于当前时间  显示刚刚
        if ([localDate compare:now] != NSOrderedAscending) {
            return @"刚刚";
        }
    }
    NSString *displayString = nil;
    NSInteger secondDiff = [now timeIntervalSince1970] - [localDate timeIntervalSince1970];
    if(secondDiff < 86400){
        if (secondDiff >= 3600) {
            displayString = KSTRING_FORMAT(@"%ld小时前", (long)(secondDiff/3600));
        }
        else if(secondDiff >= 60) {
            displayString = KSTRING_FORMAT(@"%ld分钟前", (long)(secondDiff/60));
        }  else{
            displayString = @"刚刚";
        }
    }
    else if(secondDiff <= 86400 * 3){
        displayString = KSTRING_FORMAT(@"%ld天前", (long)(secondDiff/86400));
    } else {
        NSDateComponents* components = [localDate getComponentWithUnit:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay];
        NSDateComponents* today = [NSDate todayDateComponents];
        
        if(components.year == today.year)   {
            
            displayString = KSTRING_FORMAT(@"%ld-%ld",(long)components.month,(long)components.day);
        } else{
            displayString = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)components.year,(long)components.month,(long)components.day];
        }
    }
    return displayString;
}
-(NSDate *)getLocalTime {
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval:seconds sinceDate: self];
}
#pragma mark - 基础
- (NSInteger )getWeekIndex {
    NSDateComponents *comps = [self getComponentWithUnit:NSCalendarUnitWeekday];
    if (comps) {
        return [[self class] weekIndexForIndex:comps.weekday];
    }
    return 0;
}
+ (NSInteger)weekIndexForIndex:(NSInteger)index {
    NSInteger week = 0;
    switch (index) {
        case 1:
            week = 7;
            break;
        case 2:
            week = 1;
            break;
        case 3:
            week = 2;
            break;
        case 4:
            week = 3;
            break;
        case 5:
            week = 4;
            break;
        case 6:
            week = 5;
            break;
        case 7:
            week = 6;
            break;
        default:
            break;
    }
    return week;
}
- (NSDateComponents *)getYearMonthDayComponent {
    unsigned unti = NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear;;
    return [self getComponentWithUnit:unti];
}
- (NSDateComponents *)getComponentWithUnit:(NSCalendarUnit)unitFlags {
    if (self) {
        [self setupCalendar];
        NSDateComponents *comps = [_calendar components:unitFlags fromDate:self];
        return comps;
    }
    return nil;
}

- (NSDateFormatter *)setupFormatter {
    if (_formatter == nil || [_formatter isKindOfClass:[NSNull class]]) {
        _formatter = [[NSDateFormatter alloc]init];
        [_formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:+_timeZone]];
    }
    return _formatter;
}
-(NSCalendar *)setupCalendar {
    if (_calendar == nil || [_calendar isKindOfClass:[NSNull class]]) {
        _calendar =  [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:+_timeZone]];
    }
    return _calendar;
}
@end
