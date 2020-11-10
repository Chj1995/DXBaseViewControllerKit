//
//  MBProgressHUD+XKHUD.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

#define MBHudShowMaxDuration (30)
#define MBHudHideDelay       (2.50f)
#define MBHudGraceTime       (2.0)

@interface MBProgressHUD (XKHUD)
+ (UIView *)defaultView;
+ (UIImage *)defaultSuccessImage;
+ (UIImage *)defaultFailureImage;


/**
 显示Loding加载提示Hud, 禁用用户交可使用 hud.userInteractionEnabled = YES;
 */
+ (instancetype)showMessage:(NSString *)message;
+ (instancetype)showMessage:(NSString *)message toView:(UIView *)view;
+ (instancetype)showWithCompletion:(void (^NS_NOESCAPE)(MBProgressHUD *hud))completion;
+ (instancetype)showToView:(UIView *)view completion:(void (^NS_NOESCAPE)(MBProgressHUD *hud))completion;
+ (instancetype)showMessage:(NSString *)message completion:(void (^NS_NOESCAPE)(MBProgressHUD *hud))completion;
+ (instancetype)showMessage:(NSString *)message toView:(UIView *)view completion:(void (^NS_NOESCAPE)(MBProgressHUD *hud))completion;
+ (instancetype)graceShowMessage:(NSString *)message toView:(UIView *)view completion:(void (^)(MBProgressHUD *hud))completion;
+ (instancetype)showMessage:(NSString *)message
                     toView:(UIView *)view
                  graceTime:(NSTimeInterval)gractTime
             hideAfterDelay:(NSTimeInterval)delay
                 completion:(void (^NS_NOESCAPE)(MBProgressHUD *hud))completion;

/**
 隐藏HUd
 */
+ (instancetype)hudForView:(UIView *)view;
- (void)hideWithMessage:(NSString *)message completion:(MBProgressHUDCompletionBlock)completion;
- (void)hideWithSuccess:(NSString *)message completion:(MBProgressHUDCompletionBlock)completion;
- (void)hideWithFailure:(NSString *)message completion:(MBProgressHUDCompletionBlock)completion;
- (void)hideWithAnimated:(BOOL)animated completion:(MBProgressHUDCompletionBlock)completion;
- (void)hideWithMessage:(NSString *)message
                  image:(UIImage *)image
               animated:(BOOL)animated
                  delay:(NSTimeInterval)delay
             completion:(MBProgressHUDCompletionBlock)completion;
@end

NS_ASSUME_NONNULL_END
