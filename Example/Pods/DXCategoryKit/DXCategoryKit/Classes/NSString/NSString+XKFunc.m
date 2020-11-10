//
//  NSString+XKFunc.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/27.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSString+XKFunc.h"
#include <CommonCrypto/CommonDigest.h>
#import <DXConstantsKit/XKFuncs.h>
static const CGFloat  kFileHashDefaultChunkSizeForReadingData = 8192;
@implementation NSString (XKFunc)
- (NSString *)jointUrl:(NSString *)url {
    if (!url || url.length < 1)
        return self;
    if ([url containsString:@"http"]) {
        return url;
    }
    NSString *compent=self;
    if ([self hasSuffix:@"/"]) {
        compent= [compent stringByAppendingString:url];
    } else {
        compent=  [NSString stringWithFormat:@"%@/%@", compent, url];
    }
    return compent;
}

+ (NSString*)stringWithUInteger:(NSUInteger)integer {
    return [NSNumber numberWithUnsignedInteger:integer].stringValue;
}
+ (NSString *)stringWithInteger:(NSInteger)integer {
    return [NSNumber numberWithInteger:integer].stringValue;
}
- (BOOL)isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
+ (NSString*)getFileMD5WithPath:(NSString*)path
{
    return (__bridge_transfer NSString *)FileMD5HashCreateWithPath((__bridge CFStringRef)path, kFileHashDefaultChunkSizeForReadingData);
}

CFStringRef FileMD5HashCreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData) {
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    // Get the file URL
    CFURLRef fileURL =
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  (CFStringRef)filePath,
                                  kCFURLPOSIXPathStyle,
                                  (Boolean)false);
    if (!fileURL) goto done;
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            (CFURLRef)fileURL);
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
    // Initialize the hash object
    CC_MD5_CTX hashObject;
    CC_MD5_Init(&hashObject);
    // Make sure chunkSizeForReadingData is valid
    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = kFileHashDefaultChunkSizeForReadingData;
    }
    // Feed the data to the hash object
    bool hasMoreData = true;
    while (hasMoreData) {
        uint8_t buffer[chunkSizeForReadingData];
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        if (readBytesCount == -1) break;
        if (readBytesCount == 0) {
            hasMoreData = false;
            continue;
        }
        CC_MD5_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
    }
    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    // Compute the hash digest
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &hashObject);
    // Abort if the read operation failed
    if (!didSucceed) goto done;
    // Compute the string result
    char hash[2 * sizeof(digest) + 1];
    for (size_t i = 0; i < sizeof(digest); ++i) {
        snprintf(hash + (2 * i), 3, "%02x", (int)(digest[i]));
    }
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hash,kCFStringEncodingUTF8);
    
    done:
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return result;
}

- (NSString*)subStringWithLength:(NSInteger)length tail:(BOOL)tail {
    if (self.length <= length)
        return self;
    NSString *string = [self substringToIndex:length];
    if (tail)
    {
        string = [string stringByAppendingString:@"…"];
    }
    return string;
}

+ (BOOL)isEmpty:(NSString *)str {
    NSString *trim = [[self class] trimWhitespace:str];
    return ![[self class] isStringWithAnyText:trim];
}
+ (NSString *)trimWhitespace:(NSString *)str {
    if (KISString(str)) {
        return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    return nil;
}
+ (BOOL)isStringWithAnyText:(id)object {
    return KISString(object);
}

- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    return ceil(textSize.width);
}
//其他的东西
+ (BOOL)compareVersionWithNew:(NSString *)version old:(NSString *)old {
    if (!KISString(old) && KISString(version)) {
        return YES;
    }
    if (!KISString(old) || !KISString(version)) {
        return NO;
    }
    if ([version compare:old options:NSNumericSearch] == NSOrderedDescending) {
        return YES;
    }
    return NO;
}
@end
