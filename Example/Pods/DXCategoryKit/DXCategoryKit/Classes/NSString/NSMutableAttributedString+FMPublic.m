//
//  NSMutableString+FMPublic.m
//  XiongKeLive
//
//  Created by 陈炜来 on 16/6/24.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSMutableAttributedString+FMPublic.h"
#import <DXConstantsKit/XKConstants.h>

@implementation NSMutableAttributedString (FMPublic)
+ (NSMutableAttributedString *)XK_AttrubutedString:(NSString*)string lineSpacing:(CGFloat)lineSpacing characterSpacing:(CGFloat)characterSpacing textColor:(UIColor*)textColor font:(UIFont*)font textAligment:(NSTextAlignment)aligment
{
    CGFloat hspace=characterSpacing;
    CGFloat vspace=lineSpacing;
    if (iPhone6p) {
        hspace=characterSpacing *1.1;
        vspace=lineSpacing *1.1;
    }
    
    if (!string || string.length < 1)
        return nil;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment=aligment;
    [paragraphStyle setLineSpacing:vspace];      //调整行间距
    //    [paragraphStyle setParagraphSpacing:8]; //调整段落间距(暂时用不到)
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if(hspace > 1)
        [attributedString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:hspace-1] range:NSMakeRange(0,[string length])];   //-1是因为系统默认的字间距为0时实际有1的差距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    if (textColor) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, [string length])];
    }
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [string length])];
    return  attributedString;
}
+ (NSMutableAttributedString *)XK_AttrubutedString:(NSString*)string lineSpacing:(CGFloat)lineSpacing characterSpacing:(CGFloat)characterSpacing textColor:(UIColor*)textColor font:(UIFont*)font
{
    return [self XK_AttrubutedString:string lineSpacing:lineSpacing characterSpacing:characterSpacing textColor:textColor font:font textAligment:NSTextAlignmentLeft];
}
+ (NSMutableAttributedString *)XK_AttrubutedString:(NSString*)string lineSpacing:(CGFloat)lineSpacing characterSpacing:(CGFloat)characterSpacing font:(UIFont*)font
{
   return [self XK_AttrubutedString:string lineSpacing:lineSpacing characterSpacing:characterSpacing textColor:nil font:font];
}

@end
