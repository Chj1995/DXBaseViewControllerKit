//
//  XKGlobalConfigModel.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKGlobalConfigModel.h"
#import "NSObject+XKCoding.h"
@implementation XKGlobalConfigModel
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        if (coder == nil) {
            return self;
        }
        [NSObject codingObject:self withCoder:coder];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder {
    [NSObject encodingObject:self withCoder:coder];
}
@end
