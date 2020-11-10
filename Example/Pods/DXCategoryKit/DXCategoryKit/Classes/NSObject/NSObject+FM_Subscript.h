//
//  NSObject+FM_Subscript.h
//  MeiMei
//
//  Created by chw on 15/11/26.
//  Copyright (c) 2015年 FM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief informal protocol []简便语法糖
 */
@interface NSObject (XK_Subscript)

- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)object forKeyedSubscript:(id)key;

@end

@interface NSObject (XK_Print)
///打印所有方法
+(NSString*)XK_printAllMethods;
///打印所有属性Key 跟 value
-(NSString*)XK_printAllPropertys;

-(NSString*)XK_getAllPropertys;

@end

@interface NSObject (XK_KVC)

///设置属性值，  dictionary  过滤 filter  中包含的 key
- (void)XK_setPropertyWithDictionary:(NSDictionary*)dictionary;
- (void)XK_setPropertyWithDictionary:(NSDictionary*)dictionary filter:(NSString*)filter, ... NS_REQUIRES_NIL_TERMINATION;

///fmkvc 用于对任何多选 保存变量。  又不想或者不能修改 它结构的时候用
///如果key 是以 XK_ 开头的。  可以用 kvc 直接来存  内部替换了  setValue forUndeineKey 这个方法
- (void)fmkvc_setValue:(id)value forKey:(NSString*)key;
- (id)fmkvc_valueForKey:(NSString*)key;

@end

@interface NSObject (XK_Swizzle)

+ (BOOL)XK_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)XK_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;

@end


@interface NSProxy (XK_Swizzle)

+ (BOOL)XK_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)XK_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;

@end

@interface NSObject (XK_Coding)

+ (void)fmCodingObject:(id)object withCOder:(NSCoder*)aDecoder;
+ (void)fmEncodingObject:(id)object WithCoder:(NSCoder*)aCoder;

@end

@interface NSString (XK_FixFormatError)

+ (NSString*)stringWithInteger:(NSInteger)integer;
+ (NSString*)stringWithUInteger:(NSUInteger)integer;
+ (NSString*)stringWithFloat:(CGFloat)f;
+ (NSString*)stringWithInt:(int)number;
- (NSString*)stringValue;
- (BOOL)isEqualToNumber:(NSNumber*)number;
- (id)objectForKey:(NSString*)key;

@end

@interface NSNumber (XK_FixFormatError)

- (BOOL)isEqualToString:(NSString *)aString;

@end

@interface UIImage (XK_Cache)

+ (UIImage*)XK_imageNamed:(NSString*)string;

@end
