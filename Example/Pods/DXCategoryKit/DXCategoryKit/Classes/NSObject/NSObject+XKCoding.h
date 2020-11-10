//
//  NSObject+XKCoding.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XKCoding)
+ (void)codingObject:(id)object withCoder:(NSCoder*)aDecoder;
+ (void)encodingObject:(id)object withCoder:(NSCoder*)aCoder;
@end

NS_ASSUME_NONNULL_END
