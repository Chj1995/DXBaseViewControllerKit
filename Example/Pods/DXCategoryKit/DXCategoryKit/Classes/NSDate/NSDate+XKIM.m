//
//  NSDate+XKIM.m
//  XiongKe
//
//  Created by shaokailin on 2020/6/18.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSDate+XKIM.h"
#import "NSDate+XKEvent.h"
@implementation NSDate (XKIM)
- (NSString *)tk_messageString {
    NSDateComponents *nowCmps = [[NSDate date] getYearMonthDayComponent];
    NSDateComponents *myCmps = [self getYearMonthDayComponent];
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc ] init ];
    NSDateComponents *comp =  [self getComponentWithUnit:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday];
    dateFmt.AMSymbol = @"上午";
    dateFmt.PMSymbol = @"下午";
    if (nowCmps.year != myCmps.year) {
        dateFmt.dateFormat = @"yyyy年MM月dd日 aaah:m";
    }
    else{
        if (nowCmps.day==myCmps.day) {
            dateFmt.dateFormat = @"aaah:mm";
        } else if((nowCmps.day-myCmps.day)==1) {
            
            dateFmt.dateFormat = @"昨天 aaah:mm";
        } else {
            if ((nowCmps.day-myCmps.day) <=7) {
                switch (comp.weekday) {
                    case 1:
                        dateFmt.dateFormat = @"星期日 aaah:mm";
                        break;
                    case 2:
                        dateFmt.dateFormat = @"星期一 aaah:mm";
                        break;
                    case 3:
                        dateFmt.dateFormat = @"星期二 aaah:mm";
                        break;
                    case 4:
                        dateFmt.dateFormat = @"星期三 aaah:mm";
                        break;
                    case 5:
                        dateFmt.dateFormat = @"星期四 aaah:mm";
                        break;
                    case 6:
                        dateFmt.dateFormat = @"星期五 aaah:mm";
                        break;
                    case 7:
                        dateFmt.dateFormat = @"星期六 aaah:mm";
                        break;
                    default:
                        break;
                }
            }else {
                dateFmt.dateFormat = @"yyyy年MM月dd日 aaah:mm";
            }
        }
    }
    return [dateFmt stringFromDate:self];
}
@end
