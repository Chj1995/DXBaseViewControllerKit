//
//  FMToolsFunction.m
//  XiongKeLive
//
//  Created by chw on 16/6/6.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//
#import "XKToolsFunction.h"

@implementation XKToolsFunction

/**
 *  验证手机号是否有效
 *
 *  @param phone 输入的手机号
 *
 *  @return YES 有效\NO 无效
 */
+ (BOOL)verifyMobilePhone:(NSString*)phone
{
    phone = [phone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *regex = @"^((13[0-9])|(14[0-9])|(15[0-9])|(18[0-9])|(17[0-9])|(16[0-9])|(19[0-9]))\\d{8}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL res = [pred evaluateWithObject:phone];
    return res;
}

/**
 *  验证身份证是否有效
 *
 *  @param phone 输入的身份证
 *
 *  @return YES 有效\NO 无效
 */
+ (BOOL)verifyCardId:(NSString*)cardId
{
    cardId = [cardId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *regex = @"\\d{15}|\\d{17}[0-9Xx]";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL res = [pred evaluateWithObject:cardId];
    return res;
}

/**
 *  拼接web用的url
 *
 *  @param host   <#host description#>
 *  @param suffix <#suffix description#>
 *  @param params <#params description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)componentUrlWithPrefix:(NSString *)prefix params:(NSDictionary *)params
{
    NSMutableString *componentUrl=[NSMutableString new];
    //    [componentUrl appendString:host];
    [componentUrl appendString:prefix];
    [componentUrl appendString:@"?"];
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [componentUrl appendFormat:@"%@=%@&",key,obj];
    }];
    NSString *url= [componentUrl substringToIndex:componentUrl.length-1];
    return url;
}
@end
