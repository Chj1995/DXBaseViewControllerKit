//
//  UILabel+XKInit.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "UILabel+XKInit.h"

@implementation UILabel (XKInit)
+ (UILabel*)labelWithText:(NSString *)string textColor:(UIColor *)textColor font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.text = string;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (UILabel*)labelWithFrame:(CGRect)frame text:(NSString *)string textColor:(UIColor *)textColor font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = string;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (UILabel*)labelWithFrame:(CGRect)frame text:(NSString *)string textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = string;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    return label;
}
@end
