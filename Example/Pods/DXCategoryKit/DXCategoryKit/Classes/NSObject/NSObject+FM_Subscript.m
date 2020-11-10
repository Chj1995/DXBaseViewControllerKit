//
//  NSObject+FM_Subscript.m
//  MeiMei
//
//  Created by chw on 15/11/26.
//  Copyright (c) 2015年 MeiMei. All rights reserved.
//

#import "NSObject+FM_Subscript.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (XK_Subscript)
- (id)objectAtIndexedSubscript:(NSUInteger)index
{
    if (self == nil) {
        return nil;
    }
    if ([self respondsToSelector:@selector(objectAtIndex:)] && [self respondsToSelector:@selector(count)]) {
        id unself = self;
        // TODO
        NSUInteger count = [unself count];
        if (index < count) {
            return [unself objectAtIndex:index];
        }
    }
    return nil;
}
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index
{
    if (object == nil) {
        return;
    }
    if ([self respondsToSelector:@selector(replaceObjectAtIndex:withObject:)] &&
        [self respondsToSelector:@selector(count)]) {
        id unself = self;

        // TODO
        NSUInteger count = [unself count];
        if (index < count) {
            [unself replaceObjectAtIndex:index withObject:object];
        }
        else if ([self respondsToSelector:@selector(addObject:)]) {
            [unself addObject:object];
        }
    }
}
- (id)objectForKeyedSubscript:(id)key
{
    if ([self respondsToSelector:@selector(objectForKey:)]) {
        id unself = self;
        return [unself objectForKey:key];
    }
    return nil;
}
- (void)setObject:(id)object forKeyedSubscript:(id)key
{
    if (key == nil) {
        return;
    }

    if ([self respondsToSelector:@selector(setObject:forKey:)]) {
        id unself = self;
        if (object) {
            [unself setObject:object forKey:key];
        }
        else if ([unself respondsToSelector:@selector(removeObjectForKey:)]) {
            [unself removeObjectForKey:key];
        }
    }
}

- (BOOL)containsString:(NSString*)aString
{
    if ([self respondsToSelector:@selector(rangeOfString:)]) {
        if ([(id)self rangeOfString:aString].length > 0) {
            return YES;
        }
    }
    return NO;
}
- (BOOL)_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard
{
    return NO;
}
@end

@implementation NSArray (XK_Subscript)
- (id)XK_safeInitWithObjects:(const id[])objects count:(NSUInteger)cnt
{
    for (int i = 0; i < cnt; i++) {
        if (objects[i] == nil) {
#if IS_TEST
            if (isSimulator) {
                [[MTStatusBarOverlay sharedOverlay] postFinishMessage:@"Array初始化错误..." duration:2];
            }
#endif
            return nil;
        }
    }

    return [self XK_safeInitWithObjects:objects count:cnt];
}
- (id)objectAtIndexedSubscript:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}
@end
@implementation NSMutableArray (XK_Subscript)
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index
{
    if (object == nil) {
        return;
    }
    if (index < self.count) {
        [self replaceObjectAtIndex:index withObject:object];
    }
    else {
        [self addObject:object];
    }
}
@end

@implementation NSDictionary (XK_Subscript)

- (instancetype)XK_safeInitWithObjects:(const id[])objects forKeys:(const id<NSCopying>[])keys count:(NSUInteger)cnt
{
    for (int i = 0; i < cnt; i++) {
        if (objects[i] == nil || keys[i] == nil) {
#if IS_TEST
            if (isSimulator) {
                [[MTStatusBarOverlay sharedOverlay] postFinishMessage:@"Dictionary初始化错误..." duration:2];
            }
#endif
            return nil;
        }
    }
    return [self XK_safeInitWithObjects:objects forKeys:keys count:cnt];
}
- (id)objectForKeyedSubscript:(id)key
{
    id value = [self objectForKey:key];
    if (value == [NSNull null] && [key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return value;
}
@end
@implementation NSMutableDictionary (XK_Subscript)
- (void)setObject:(id)object forKeyedSubscript:(id)key
{
    if (key == nil) {
        return;
    }

    if (object) {
        [self setObject:object forKey:key];
    }
    else {
        [self removeObjectForKey:key];
    }
}
@end
@implementation NSMapTable (XK_Subscript)
- (id)objectForKeyedSubscript:(id)key
{
    if (key) {
        return [self objectForKey:key];
    }
    return nil;
}
- (void)setObject:(id)object forKeyedSubscript:(id)key
{
    if (key == nil)
        return;

    if (object) {
        [self setObject:object forKey:key];
    }
    else {
        [self removeObjectForKey:key];
    }
}
@end

@implementation NSUserDefaults (XK_Subscript)
- (id)objectForKeyedSubscript:(id)key
{
    if (key) {
        return [self objectForKey:key];
    }
    return nil;
}
- (void)setObject:(id)object forKeyedSubscript:(id)key
{
    if (key == nil)
        return;

    if (object) {
        [self setObject:object forKey:key];
    }
    else {
        [self removeObjectForKey:key];
    }
}
@end
@implementation NSCache (XK_Subscript)
- (id)objectForKeyedSubscript:(id)key
{
    if (key) {
        return [self objectForKey:key];
    }
    return nil;
}
- (void)setObject:(id)object forKeyedSubscript:(id)key
{
    if (key == nil)
        return;

    if (object) {
        [self setObject:object forKey:key];
    }
    else {
        [self removeObjectForKey:key];
    }
}
@end

@implementation NSObject (XK_Swizzle)
+ (BOOL)XK_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_
{
    Method origMethod = class_getInstanceMethod(self, origSel_);
    if (!origMethod) {
        return NO;
    }
    Method altMethod = class_getInstanceMethod(self, altSel_);
    if (!altMethod) {
        return NO;
    }

    class_addMethod(self,
        origSel_,
        class_getMethodImplementation(self, origSel_),
        method_getTypeEncoding(origMethod));
    class_addMethod(self,
        altSel_,
        class_getMethodImplementation(self, altSel_),
        method_getTypeEncoding(altMethod));

    method_exchangeImplementations(class_getInstanceMethod(self, origSel_), class_getInstanceMethod(self, altSel_));

    return YES;
}

+ (BOOL)XK_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_
{
    return [object_getClass((id)self) XK_swizzleMethod:origSel_ withMethod:altSel_ error:error_];
}

+ (void)load
{
    [objc_getClass("__NSPlaceholderArray") XK_swizzleMethod:@selector(initWithObjects:count:) withMethod:@selector(XK_safeInitWithObjects:count:) error:nil];

    [objc_getClass("__NSPlaceholderDictionary") XK_swizzleMethod:@selector(initWithObjects:forKeys:count:) withMethod:@selector(XK_safeInitWithObjects:forKeys:count:) error:nil];
}
@end

@implementation NSProxy (XK_Swizzle)
+ (BOOL)XK_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_
{
    Method origMethod = class_getInstanceMethod(self, origSel_);
    if (!origMethod) {
        return NO;
    }
    Method altMethod = class_getInstanceMethod(self, altSel_);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    origSel_,
                    class_getMethodImplementation(self, origSel_),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel_,
                    class_getMethodImplementation(self, altSel_),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, origSel_), class_getInstanceMethod(self, altSel_));
    
    return YES;
}

+ (BOOL)XK_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_
{
    return [object_getClass((id)self) XK_swizzleMethod:origSel_ withMethod:altSel_ error:error_];
}
@end

@implementation NSString (XK_FixFormatError)

+ (NSString*)stringWithInteger:(NSInteger)integer
{
    return [NSNumber numberWithInteger:integer].stringValue;
}

+ (NSString*)stringWithUInteger:(NSUInteger)integer
{
    return [NSNumber numberWithUnsignedInteger:integer].stringValue;
}

+ (NSString*)stringWithFloat:(CGFloat)f
{
    return [NSNumber numberWithFloat:f].stringValue;
}

+ (NSString*)stringWithInt:(int)number
{
    return [NSNumber numberWithInt:number].stringValue;
}

- (NSString*)stringValue
{
    return self.description;
}
- (BOOL)isEqualToNumber:(NSNumber*)number
{
    NSString *temp = [number stringValue];
    return [self isEqualToString:temp];
}
- (id)objectForKey:(NSString*)key
{
    return self;
}
@end

@implementation UIImagePickerController (XK_FixBugForBK)
+ (void)bk_registerDynamicDelegate
{
}
+ (void)bk_linkDelegateMethods:(NSDictionary*)dictionary
{
}
@end

static void* FMKVCMapKey = &FMKVCMapKey;

@implementation NSObject (XK_KVC)
+(void)load
{
    [NSObject XK_swizzleMethod:@selector(setValue:forUndefinedKey:) withMethod:@selector(XK_swizzleSetValue:forUndefinedKey:) error:nil];
    [NSObject XK_swizzleMethod:@selector(valueForUndefinedKey:) withMethod:@selector(XK_swizzleValueForUndefinedKey:) error:nil];
}
-(void)XK_swizzleSetValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key hasPrefix:@"XK_"])
    {
        [self fmkvc_setValue:value forKey:key];
    }
    else
    {
        [self XK_swizzleSetValue:value forUndefinedKey:key];
    }
}
-(id)XK_swizzleValueForUndefinedKey:(NSString *)key
{
    if ([key hasPrefix:@"XK_"])
    {
       return [self fmkvc_valueForKey:key];
    }
    else
    {
        return [self XK_swizzleValueForUndefinedKey:key];
    }
}
- (id)fmkvc_valueForKey:(NSString*)key
{
    if (key) {
        NSMutableDictionary* dic = objc_getAssociatedObject(self, FMKVCMapKey);
        if (dic) {
            return dic[key];
        }
    }

    return nil;
}
- (void)fmkvc_setValue:(id)value forKey:(NSString*)key
{
    if (key) {
        NSMutableDictionary* dic = objc_getAssociatedObject(self, FMKVCMapKey);
        if (dic == nil) {
            dic = [NSMutableDictionary dictionary];
            objc_setAssociatedObject(self, FMKVCMapKey, dic, OBJC_ASSOCIATION_RETAIN);
        }
        if (value) {
            [dic setObject:value forKey:key];
        }
        else {
            [dic removeObjectForKey:key];
        }
    }
}


- (void)XK_setPropertyWithDictionary:(NSDictionary*)dictionary
{
    [self XK_setPropertyWithDictionary:dictionary filter:nil];
}
- (void)XK_setPropertyWithDictionary:(NSDictionary*)dictionary filter:(NSString*)filter, ...
{
    NSMutableDictionary* keyValues = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    
    va_list list;
    va_start(list, filter);
    NSString* filterObject = filter;
    while (filterObject) {
        [keyValues removeObjectForKey:filterObject];
        filterObject = va_arg(list, NSString*);
    }
    va_end(list);
    
    [keyValues enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
        id value = [self XK_valueWithSetPropertyObject:obj];
        [self setValue:value forKeyPath:key];
    }];
}
-(id)XK_valueWithSetPropertyObject:(id)obj
{
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSString* className = [obj objectForKey:@".class"];
        if (className) {
            id value = [[NSClassFromString(className) alloc] init];
            
            NSDictionary* params = [obj objectForKey:@".params"];
            [value XK_setPropertyWithDictionary:params filter:nil];
            
            return value;
        }
    }
    return obj;
}

@end




@implementation NSNumber (XK_FixFormatError)

- (BOOL)isEqualToString:(NSString *)aString
{
    return [[self stringValue] isEqualToString:aString];
}

- (NSInteger)length
{
    return [[self stringValue] length];
}

@end

@implementation NSObject (XK_Coding)

+ (void)fmCodingObject:(id)object withCOder:(NSCoder*)aDecoder
{
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

+ (void)fmEncodingObject:(id)object WithCoder:(NSCoder*)aCoder
{
    unsigned int count = 0; Ivar *ivars = class_copyIvarList([object class], &count);
    
    for (int i = 0; i<count; i++)
    {
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

@implementation UIImage(XK_Cache)

+ (UIImage*)XK_imageNamed:(NSString *)string
{
    NSString *thumbnailFile = [NSString stringWithFormat:@"%@/%@.png", [[NSBundle mainBundle] resourcePath], string];
    UIImage *thumbnail = [UIImage imageWithContentsOfFile:thumbnailFile];
    return thumbnail;
}

@end
