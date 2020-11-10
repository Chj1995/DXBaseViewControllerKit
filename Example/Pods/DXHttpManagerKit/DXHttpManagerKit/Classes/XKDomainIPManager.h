//
//  XKDomainIPManager.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/22.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKDomainIPManager : NSObject

/// 获取用户域名IP
+ (NSString *)getUserModuleUrl:(NSString *)url;

/// 获取首页域名IP
+ (NSString *)getHomeModuleUrl:(NSString *)url;

/// 获取订单域名IP
+ (NSString *)getOrderModuleUrl:(NSString *)url;

/// 获取社区域名IP
+ (NSString *)getCommunityModuleUrl:(NSString *)url;

/// 获取礼物域名IP
+ (NSString *)getGiftModuleUrl:(NSString *)url;

/// 获取分享域名IP
+ (NSString *)getShareModuleUrl:(NSString *)url;
+ (NSString *)getApiModuleUrl:(NSString *)url;

+ (NSString *)getFamilyModuleUrl:(NSString *)url;

+ (NSString *)getBadgeModuleUrl:(NSString *)url;
+ (NSString *)getGradeModuleUrl:(NSString *)url;
/// 获取IM地址
/// @param url path
+ (NSString *)getIMModuleUrl:(NSString *)url;
+ (NSString *)getIMModuleUrl1:(NSString *)url;
// IM聊天地址
+ (NSString *)getIMAPPUrl;
//称号
+ (NSString *)getUserTitleModuleUrl:(NSString *)url;
+ (NSString *)getUserTitlePriceModuleUrl:(NSString *)url;
@end

NS_ASSUME_NONNULL_END
