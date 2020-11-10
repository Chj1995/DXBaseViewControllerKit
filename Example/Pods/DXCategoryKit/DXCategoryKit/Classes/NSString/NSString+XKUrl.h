//
//  NSString+XKUrl.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/30.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XKUrl)
- (NSString *)appendingUrlParamsFilterRepeat:(id)params, ...;
@end

NS_ASSUME_NONNULL_END
