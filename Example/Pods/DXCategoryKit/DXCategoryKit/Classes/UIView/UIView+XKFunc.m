//
//  UIView+XKFunc.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "UIView+XKFunc.h"
#import <YYKit/YYKit.h>

@implementation UIView (XKFunc)

+ (void)setSubviewCenterOnVertical:(UIView *)subView AtX:(CGFloat)xStart superView:(UIView *)superView
{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    subView.origin = CGPointMake(xStart, floorf((superView.height - subView.height)/2));
}


+ (void)setSubviewCenterOnHorizontal:(UIView *)subView AtY:(CGFloat)yStart superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    
    subView.origin = CGPointMake(floorf((superView.width - subView.width)/2), yStart);
}


+ (void)setSubviewOnCenter:(UIView *)subView superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    subView.origin = CGPointMake(floorf((superView.width - subView.width)/2), floorf((superView.height - subView.height)/2));
}


//添加圆角
- (void)radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner {
    if (@available(iOS 11.0, *)) {
        self.layer.cornerRadius = radius;
        self.layer.maskedCorners = (CACornerMask)corner;
    } else {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    }
}
@end
