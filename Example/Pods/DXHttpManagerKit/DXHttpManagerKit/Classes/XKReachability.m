//
//  XKReachability.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKReachability.h"
@interface XKReachability ()
@property (nonatomic, assign) BOOL isHasNetwork;

@end
static XKReachability *instance = nil;
@implementation XKReachability
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XKReachability alloc] init];
    });
    return instance;
}
- (instancetype)init {
    if (self = [super init]) {
        _isHasNetwork = YES;
        _reachability = [YYReachability reachabilityWithHostname:@"www.baidu.com"];
        @weakify(self);
        _reachability.notifyBlock = ^(YYReachability * _Nonnull reachability) {
            @strongify(self);
            [self changNetwork:reachability];
        };
    }
    return self;
}
#warning mark - 如果是需要判断在有线无线上的业务需要去掉判断
- (void)changNetwork:(YYReachability *)reachbility {
    BOOL isNetwork = [self networkEnable];
    if (_isHasNetwork != isNetwork) {
        _isHasNetwork = isNetwork;
        dispatch_async(dispatch_get_main_queue(), ^{
            XK_POST_NOTIFY_WITH_Object(KXKReachabilityChangedNotification, reachbility);
        });
    }
}
- (BOOL)networkEnable {
    return [_reachability isReachable];
}

//
- (BOOL)isWiFi {
     return  _reachability.status == YYReachabilityStatusWiFi;
}

- (BOOL)isWWAN {
    return  _reachability.status == YYReachabilityStatusWWAN;
}

- (BOOL)is2G {
    if (![self isWiFi] && _reachability.wwanStatus == YYReachabilityWWANStatus2G) return YES;
    return NO;
}

- (BOOL)is3G {
    if (![self isWiFi] && _reachability.wwanStatus == YYReachabilityWWANStatus3G) return YES;
    return NO;
}

- (BOOL)is4G {
    if (![self isWiFi] && _reachability.wwanStatus == YYReachabilityWWANStatus4G) return YES;
    return NO;
}

@end
