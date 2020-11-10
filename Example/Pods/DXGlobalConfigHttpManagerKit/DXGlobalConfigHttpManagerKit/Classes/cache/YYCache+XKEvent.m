//
//  YYCache+XKEvent.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "YYCache+XKEvent.h"
#import <DXConstantsKit/DXConstantsKit.h>
@implementation YYCache (XKEvent)
+ (instancetype)shareInstance
{
    static YYCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        cachePath = [cachePath stringByAppendingPathComponent:KAPPBundleIdentifier];
        cachePath = [cachePath stringByAppendingPathComponent:@"XKCache"];
        cache = [self cacheWithPath:cachePath];
    });
    return cache;
}

@end
