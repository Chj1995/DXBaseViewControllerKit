//
//  XKPulbicViewTool.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKPulbicViewTool : NSObject
+ (UIImage*)screenShotWithView:(UIView*)view;
//获取safeeare
+ (CGFloat)viewSafeBottom;
//状态栏高度
+ (CGFloat)getStatusBarHeight;
//设置导航栏的属性
+ (void)setupNavigationBackgroundColor:(UIColor *)bgColor
                                  font:(UIFont *)font
                                 color:(UIColor *)color
                             lineColor:(UIColor *)lineColor;

+ (UIImagePickerController *)construsctImagePickView:(id)delegate type:(NSInteger)type;



/// 创建提示
/// @param type 1 alter 0为actionsheet
/// @param title 标题
/// @param message 内容
/// @param eventBlock 事件回调 0为取消 固定，其他按 other顺序进行下标
/// @param cancle 取消
/// @param others 其他内容
+ (void)showAlertControllerWithType:(UIAlertControllerStyle)type title:(nullable NSString *)title message:(nullable NSString *)message event:(nullable void(^)(NSInteger buttonIndex))eventBlock cancle:(nullable NSString *)cancle otherTitle:(nullable NSString *)others, ... NS_REQUIRES_NIL_TERMINATION;
@end

NS_ASSUME_NONNULL_END
