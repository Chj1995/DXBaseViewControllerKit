//
//  NSString+XKUrl.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/30.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSString+XKUrl.h"
#import <YYKit/YYKit.h>
@implementation NSString (XKUrl)
- (NSString *)appendingUrlParamsFilterRepeat:(id)params, ... {
    NSDictionary* parmasDicionary = nil;
    
    if ([params isKindOfClass:[NSString class]]) {
        va_list list;
        va_start(list, params);
        NSString* urlParamsString = [[NSString alloc] initWithFormat:params arguments:list];
        va_end(list);
        
        parmasDicionary = [urlParamsString queryDictionary];
    }
    else if ([params isKindOfClass:[NSDictionary class]]) {
        parmasDicionary = params;
    }
    
    if ([self containsString:@"?"] && parmasDicionary.count > 0) {
        NSMutableDictionary* mutableParams = [NSMutableDictionary dictionaryWithDictionary:parmasDicionary];
        
        NSString* queryString = [[[self componentsSeparatedByString:@"?"] lastObject] lowercaseString];
        NSArray* allKeys = parmasDicionary.allKeys;
        
        for (NSString* key in allKeys) {
            NSString* keyStr = [NSString stringWithFormat:@"%@=", key.lowercaseString];
            NSString* urlKey = [NSString stringWithFormat:@"&%@", keyStr];
            if ([queryString containsString:urlKey] || [queryString hasPrefix:keyStr]) {
                [mutableParams removeObjectForKey:key];
            }
        }
        parmasDicionary = [mutableParams copy];
    }
    if (parmasDicionary.count > 0) {
        return [self appendingURLParams:parmasDicionary];
    }
    return self;
}
-(NSDictionary *)queryDictionary {
    NSArray* array = [self componentsSeparatedByString:@"?"];
    NSString* encodedString = array.lastObject;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSArray *pairs = [encodedString componentsSeparatedByString:@"&"];
    
    for (NSString *kvp in pairs) {
        if ([kvp length] == 0) {
            continue;
        }
        
        NSRange pos = [kvp rangeOfString:@"="];
        NSString *key;
        NSString *val;
        
        if (pos.location == NSNotFound) {
            key = [self stringByUnescapingFromURLQuery:kvp];
            val = @"";
        } else {
            key = [self stringByUnescapingFromURLQuery:[kvp substringToIndex:pos.location]];
            val = [self stringByUnescapingFromURLQuery:[kvp substringFromIndex:pos.location + pos.length]];
        }
        
        if (!key || !val) {
            continue; // I'm sure this will bite my arse one day
        }
        
        [result setObject:val forKey:key];
    }
    return result;
}
- (NSString*)appendingURLParams:(id)params, ...
{
    NSString* urlParamsString = nil;
    if ([params isKindOfClass:[NSDictionary class]]) {
        NSMutableString* mutableString = [NSMutableString string];
        [(NSDictionary*)params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
            
            if ([key isKindOfClass:[NSString class]] == NO) {
                key = [key description];
            }
            if ([obj isKindOfClass:[NSString class]] == NO) {
                obj = [obj description];
            }
            
            if (mutableString.length > 0) {
                [mutableString appendString:@"&"];
            }
            [mutableString appendFormat:@"%@=%@", key, [obj stringByURLEncode]];
        }];
        urlParamsString = mutableString;
    }
    else if ([params isKindOfClass:[NSString class]]) {
        va_list list;
        va_start(list, params);
        urlParamsString = [[NSString alloc] initWithFormat:params arguments:list];
        va_end(list);
    }
    
    if (urlParamsString.length == 0) {
        return self;
    }
    
    if ([urlParamsString hasPrefix:@"&"]) {
        urlParamsString = [urlParamsString substringFromIndex:1];
    }
    
    NSString* resultURLString = nil;
    if ([self containsString:@"?"]) {
        if ([self hasSuffix:@"&"] == NO) {
            resultURLString = [self stringByAppendingFormat:@"&%@", urlParamsString];
        }
        else {
            resultURLString = [self stringByAppendingString:urlParamsString];
        }
    }
    else {
        resultURLString = [self stringByAppendingFormat:@"?%@", urlParamsString];
    }
    return resultURLString;
}
- (NSString *)stringByUnescapingFromURLQuery:(NSString*)string {
    NSString *deplussed = [string stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    return [deplussed stringByRemovingPercentEncoding];
}
@end
