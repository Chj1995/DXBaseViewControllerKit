//
//  FMToolsFunction.h
//  XiongKeLive
//
//  Created by chw on 16/6/6.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XKToolsFunction : NSObject


/**
 *  验证手机号是否有效
 *
 *  @param phone 输入的手机号
 *
 *  @return YES 有效\NO 无效
 */
+ (BOOL)verifyMobilePhone:(NSString*)phone;

/**
 *  验证身份证是否有效
 *
 *  @param cardId 输入的身份证
 *
 *  @return YES 有效\NO 无效
 */
+ (BOOL)verifyCardId:(NSString*)cardId;


/**
 *  拼接web用的url
 *
 *  @param prefix url
 *  @param params 参数
 *
 *  @return 带参的url
 */
+(NSString *)componentUrlWithPrefix:(NSString *)prefix params:(NSDictionary *)params;
@end
