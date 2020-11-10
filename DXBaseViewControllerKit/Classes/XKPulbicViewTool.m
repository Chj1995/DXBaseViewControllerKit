//
//  XKPulbicViewTool.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKPulbicViewTool.h"
#import <DXConstantsKit/DXConstantsKit.h>
#import <YYKit/YYKit.h>

@implementation XKPulbicViewTool

+ (UIImage*)screenShotWithView:(UIView*)view
{
    NSLog(@"截屏的view大小:%@", NSStringFromCGRect(view.frame));
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);     //设置截屏大小
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

+ (CGFloat)viewSafeBottom {
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    } else {
        return 0;
    }
}
//设置导航栏的属性
+ (void)setupNavigationBackgroundColor:(UIColor *)bgColor font:(UIFont *)font color:(UIColor *)color lineColor:(UIColor *)lineColor {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.barTintColor = bgColor;
    navigationBar.tintColor = XKColor.xk_color32;
    navigationBar.translucent = NO;
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : color,NSFontAttributeName : font};
    [[UINavigationBar appearance]  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    if (lineColor == nil) {
        lineColor = [UIColor clearColor];
    }
    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:lineColor size:CGSizeMake(SCREEN_WIDTH, 0.5)]];
}
//获取状态栏高度
+ (CGFloat)getStatusBarHeight {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (void)showAlertControllerWithType:(UIAlertControllerStyle)type title:(NSString *)title message:(NSString *)message event:(void (^)(NSInteger))eventBlock cancle:(NSString *)cancle otherTitle:(NSString *)others, ... {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:type];

    if (KISString(cancle)) {
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (eventBlock) {
                eventBlock(0);
            }
        }];
        [alertVC addAction:cancleAction];
    }
    if (others) {
        NSInteger i = 1;
        if (KISString(others)) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:others style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (eventBlock) {
                    eventBlock(i);
                }
            }];
            [alertVC addAction:otherAction];
            i ++;
        }
        va_list args;
        va_start(args, others);
        NSString *otherstring = nil;
        
        while ((otherstring = va_arg(args, NSString*))) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherstring style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (eventBlock) {
                    eventBlock(i);
                }
            }];
            [alertVC addAction:otherAction];
            i++;
        }
        va_end(args);
    }
    [[self class] presentAction:alertVC];
}
+ (void)presentAction:(UIAlertController *)alertVC {
//    UIViewController* rootVC = [UIViewController currentTopViewController];
//    [rootVC presentViewController:alertVC animated:YES completion:nil];
}
+ (UIImagePickerController *)construsctImagePickView:(id)delegate type:(NSInteger)type {
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    if (type == 0)
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    else {
        controller.navigationBar.translucent = NO;
        NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:[XK_FMColor XK_fmColor_Navigation_Title], NSForegroundColorAttributeName, nil];
        [controller.navigationBar setTitleTextAttributes:attrs];
        if ([controller.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
            [controller.navigationBar setBarTintColor:[XK_FMColor XK_fmColor_Navigation_Back]];
            [controller.navigationBar setTintColor:[XK_FMColor XK_fmColor_Navigation_Title]];
        }
        
        [controller.navigationBar setTitleTextAttributes:attrs];
    }
    controller.allowsEditing = YES;
    controller.delegate = delegate;
    return controller;
}
@end
