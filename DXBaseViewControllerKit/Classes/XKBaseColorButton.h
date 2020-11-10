//
//  XKBaseColorButton.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, XKBaseColorType) {
    XKBaseColorType_BTN1     = 0,    //normal Y1背景，Disabled line1，  44高度，左右间距16
    XKBaseColorType_BTN2     = 2,    //normal XK_FMCOLOR_HEX(0xFBD848)背景，

    XKBaseColorType_BTN9     = 9,    //normal Y1背景，Disabled line1，  44高度，左右间距16

};
NS_ASSUME_NONNULL_BEGIN

@interface XKBaseColorButton : UIButton
@property (nonatomic, assign) XKBaseColorType colorType;
- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state;
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;


+ (XKBaseColorButton *)buttonWithStyle:(XKBaseColorType)style;    //使用约束时用的
+ (XKBaseColorButton *)buttonWithFrame:(CGRect)rect style:(XKBaseColorType)style;
+ (XKBaseColorButton *)buttonWithFrame:(CGRect)rect style:(XKBaseColorType)style target:(id _Nullable)target action:(SEL _Nullable)action;
@end

NS_ASSUME_NONNULL_END
