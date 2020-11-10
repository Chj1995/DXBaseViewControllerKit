//
//  NSMutableString+FMPublic.h
//  XiongKeLive
//
//  Created by 陈炜来 on 16/6/24.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (FMPublic)
+ (NSMutableAttributedString *)XK_AttrubutedString:(NSString*)string lineSpacing:(CGFloat)lineSpacing characterSpacing:(CGFloat)characterSpacing textColor:(UIColor*)textColor font:(UIFont*)font textAligment:(NSTextAlignment)aligment;
+ (NSMutableAttributedString *)XK_AttrubutedString:(NSString*)string lineSpacing:(CGFloat)lineSpacing characterSpacing:(CGFloat)characterSpacing textColor:(UIColor*)textColor font:(UIFont*)font;
+ (NSMutableAttributedString *)XK_AttrubutedString:(NSString*)string lineSpacing:(CGFloat)lineSpacing characterSpacing:(CGFloat)characterSpacing font:(UIFont*)font;

@end
