//
//  NSObject+XKHUD.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XKHUD)
- (void)showLoadingInView;
- (void)showLoadingInViewWithText:(NSString * _Nullable)text,...;
- (void)showLoadingInViewWithClickBlock:(dispatch_block_t)clickBlock;
- (void)showProgress:(CGFloat)progress;

///隐藏当前的hud
- (void)hiddenLoadingInView;

///text hud 会自动消失
- (void)showAlertInView:(NSString *)text,...;
- (void)showAlertInViewWithDelay:(CGFloat)delay text:(NSString *)text,...;

///静态方法 默认都加在 window 上
+ (void)showLoadingInWindow;
+ (void)showLoadingInWindowWithText:(NSString*)text,...;
+ (void)showLoadingInWindowWithClickBlock:(dispatch_block_t)clickBlock;
+ (void)hiddenInWindow;
+ (void)showAlertInWindow:(NSString *)text,...;
+ (void)showAlertInWindowWithDelay:(CGFloat)delay text:(NSString*)text,...;
@end

NS_ASSUME_NONNULL_END
