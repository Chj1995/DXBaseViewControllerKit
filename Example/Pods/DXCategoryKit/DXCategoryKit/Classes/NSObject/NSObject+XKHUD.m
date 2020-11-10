//
//  NSObject+XKHUD.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "NSObject+XKHUD.h"
#import "MBProgressHUD.h"
#import <DXConstantsKit/DXConstantsKit.h>
#import <YYKit/YYKit.h>

@implementation NSObject (XKHUD)
- (UIView *)getHUDView {
    UIView * view = nil;
    if([self isKindOfClass:[UIViewController class]]) {
        view = ((UIViewController*)self).view;
    } else if([self isKindOfClass:[UIView class]]) {
        view = (id)self;
    } else {
        view = [[UIApplication sharedApplication] keyWindow];
    }
    return view;
}
- (void)showLoadingInView {
    [self showLoadingInViewWithText:nil];
}
- (void)showLoadingInViewWithText:(NSString *)text, ... {
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
     UIView *hudInView = [self getHUDView];
    [MBProgressHUD hideHUDForView:hudInView animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudInView animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color=KHEXColor(0x1c232c, 0.8);
    if(text.length) {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
        hud.detailsLabel.font = [UIFont systemFontOfSize:16];
        hud.margin = 16;
        hud.bezelView.layer.cornerRadius = 8;
        hud.detailsLabel.text = text;
        hud.detailsLabel.textColor = [UIColor whiteColor];
    }
}
- (void)showLoadingInViewWithClickBlock:(dispatch_block_t)clickBlock {
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
    
    UIView* hudInView = [self getHUDView];
    [MBProgressHUD hideHUDForView:hudInView animated:YES];
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:hudInView animated:YES];
    
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (clickBlock) {
            clickBlock();
        }
    }];
    [hud addGestureRecognizer:tap];
}
- (void)showProgress:(CGFloat)progress {
    UIView *view = [self getHUDView];
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    
    if (hud) {
        hud.mode = MBProgressHUDModeDeterminate;
        hud.progress = progress;
        hud.label.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    }else{
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.progress = progress;
        hud.label.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    }
}

///隐藏当前的hud
- (void)hiddenLoadingInView {
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
    
    UIView* hudInView = [self getHUDView];
    [MBProgressHUD hideHUDForView:hudInView animated:NO];
}

///text hud 会自动消失
- (void)showAlertInView:(NSString *)text, ... {
    if(text.length) {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [self showAlertHUD:0 text:text];
}
- (void)showAlertInViewWithDelay:(CGFloat)delay text:(NSString *)text, ... {
    if(text.length) {
        va_list list;
        va_start(list, text);
        
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [self showAlertHUD:delay text:text];
}
- (void)showAlertHUD:(CGFloat)delay text:(NSString *)text {
    if(!KISString(text))return;
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:YES];
        return;
    }
    UIView* hudInView = [self getHUDView];
    [MBProgressHUD hideHUDForView:hudInView animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudInView animated:YES];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;

    hud.bezelView.backgroundColor = KHEXColor(0x1c232c, 0.8);
    hud.mode = MBProgressHUDModeText;
//    hud.detailsLabel.font = KNornalFont(16);
    hud.margin = 16;
    hud.bezelView.layer.cornerRadius = 8;
    hud.detailsLabel.text = text;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
    float duration = 1;
    if(delay > 0) {
        duration = delay;
    } else {
        duration = (float)text.length*0.08 + 0.3;
        duration = MIN(3, MAX(1, duration));
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (hud.superview) {
            hud.removeFromSuperViewOnHide = YES;
            [hud hideAnimated:YES];
        }
    });
}
///静态方法 默认都加在 window 上
+ (void)showLoadingInWindow {
    [[[UIApplication sharedApplication] keyWindow]showLoadingInView];
}
+ (void)showLoadingInWindowWithText:(NSString *)text,... {
    if(text.length) {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [[[UIApplication sharedApplication] keyWindow] showLoadingInViewWithText:text];
}
+ (void)showLoadingInWindowWithClickBlock:(dispatch_block_t)clickBlock {
    [[[UIApplication sharedApplication] keyWindow]showLoadingInViewWithClickBlock:clickBlock];
}
+ (void)hiddenInWindow {
    [[[UIApplication sharedApplication] keyWindow]hiddenLoadingInView];
}
+ (void)showAlertInWindow:(NSString *)text,... {
    if(text.length) {
//        va_list list;
//        va_start(list, text);
        text = isnull(text);
//        text = [[NSString alloc]initWithFormat:text arguments:list];
//        va_end(list);
    }
    [[[UIApplication sharedApplication] keyWindow]showAlertHUD:0 text:text];
}
+ (void)showAlertInWindowWithDelay:(CGFloat)delay text:(NSString *)text,... {
    if(text.length) {
        va_list list;
        va_start(list, text);
        text = [[NSString alloc]initWithFormat:text arguments:list];
        va_end(list);
    }
    [[[UIApplication sharedApplication] keyWindow]showAlertHUD:delay text:text];
}
@end
