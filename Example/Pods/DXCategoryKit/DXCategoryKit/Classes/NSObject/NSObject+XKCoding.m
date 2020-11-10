//
//  NSObject+XKCoding.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSObject+XKCoding.h"
#import <objc/runtime.h>

@implementation NSObject (XKCoding)
+ (void)codingObject:(id)object withCoder:(NSCoder*)aDecoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [aDecoder decodeObjectForKey:key];
        // 设置到成员变量身上
        [object setValue:value forKey:key];
    }
    free(ivars);
}

+ (void)encodingObject:(id)object withCoder:(NSCoder*)aCoder {
    unsigned int count = 0; Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [object valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}
@end
