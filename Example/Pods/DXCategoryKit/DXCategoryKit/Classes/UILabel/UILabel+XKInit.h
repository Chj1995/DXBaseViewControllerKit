//
//  UILabel+XKInit.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (XKInit)
+ (UILabel*)labelWithText:(NSString * _Nullable)string textColor:(UIColor * _Nullable)textColor font:(UIFont *_Nullable)font;

+ (UILabel*)labelWithFrame:(CGRect)frame text:(NSString *_Nullable)string textColor:(UIColor *_Nullable)textColor font:(UIFont *_Nullable)font;


+ (UILabel*)labelWithFrame:(CGRect)frame text:(NSString *_Nullable)string textColor:(UIColor *_Nullable)textColor font:(UIFont *_Nullable)font textAlignment:(NSTextAlignment)textAlignment;
@end

NS_ASSUME_NONNULL_END
