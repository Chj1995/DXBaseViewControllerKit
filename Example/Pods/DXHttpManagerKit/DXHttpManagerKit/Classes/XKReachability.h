//
//  XKReachability.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YYReachability.h"
#import "XKNetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

#define XKReachabilityHelper [XKReachability shareInstance]

@interface XKReachability : NSObject
@property (nonatomic, strong) YYReachability *reachability;
+ (instancetype)shareInstance;
/**< 网络连接是否正常*/
- (BOOL)networkEnable;
/**< 当前网络是否WiFi*/
- (BOOL)isWiFi;
/**< 当前网络是否蜂窝数据*/
- (BOOL)isWWAN;
/**< 当前为2G网络>*/
- (BOOL)is2G;
 /**< 当前为3G网络>*/
- (BOOL)is3G;
/**< 当前为4G网络>*/
- (BOOL)is4G;

+ (void)addRequestHeadersToRequest:(NSMutableURLRequest *)urlRequest;

@end

NS_ASSUME_NONNULL_END
