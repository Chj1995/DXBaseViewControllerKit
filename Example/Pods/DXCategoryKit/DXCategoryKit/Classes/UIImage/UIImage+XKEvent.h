//
//  UIImage+XKEvent.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DXConstantsKit/XKEnum.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (XKEvent)
+ (UIImage *)createGradientImageWithSize:(CGSize)size gradientColors:(NSArray *)colors percentage:(NSArray *)percents gradientType:(XKGradientType)gradientType;

/// 缩小图片
/// @param size 缩小的图片大小
- (UIImage *)scaleImageWithSize:(CGSize)size;

/// 让图片旋转到正常视角的角度
/// 有时候拍照完照片可能会出现方向被旋转了。
- (UIImage *)fixImageOrientation;

/// 压缩图片
- (NSData *)compressImage;

//按比例在中心截取最大范围的图片（例：原图300*300，参数100*80，则在中间截取300*240即上下被截掉了）
- (UIImage*)subImageByCenterSize:(CGSize)size;

//返回高斯模糊的图
-(UIImage *)boxblurImageWithBlur:(CGFloat)blur;

/**
 *  生成圆角的图片
 *
 *  @param originImage 原始图片
 *  @param borderColor 边框原色
 *  @param borderWidth 边框宽度
 *
 *  @return 圆形图片
 */
+ (UIImage *)circleImage:(UIImage *)originImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

// 根据宽度，图片等比例缩放
+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

@end

NS_ASSUME_NONNULL_END
