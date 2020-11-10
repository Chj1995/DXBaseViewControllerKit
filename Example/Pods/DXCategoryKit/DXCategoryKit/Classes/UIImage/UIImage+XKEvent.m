//
//  UIImage+XKEvent.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "UIImage+XKEvent.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@implementation UIImage (XKEvent)
+ (UIImage *)createGradientImageWithSize:(CGSize)size gradientColors:(NSArray *)colors percentage:(NSArray *)percents gradientType:(XKGradientType)gradientType {
    
    NSAssert(percents.count <= 5, @"输入颜色数量过多，如果需求数量过大，请修改locations[]数组的个数");
    
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c];
    }
    CGFloat locations[5];
    for (int i = 0; i < percents.count; i++) {
        locations[i] = [percents[i] floatValue];
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, locations);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case XKGradientType_TopToBottom:
            start = CGPointMake(size.width/2, 0.0);
            end = CGPointMake(size.width/2, size.height);
            break;
        case XKGradientType_LeftToRight:
            start = CGPointMake(0.0, size.height/2);
            end = CGPointMake(size.width, size.height/2);
            break;
        case XKGradientType_LeftTopToRightBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, size.height);
            break;
        case XKGradientType_LeftBottomToRightTop:
            start = CGPointMake(0.0, size.height);
            end = CGPointMake(size.width, 0.0);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)scaleImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)fixImageOrientation {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
            
        default:
            break;
    }
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                                CGImageGetBitsPerComponent(self.CGImage), 0,
                                                CGImageGetColorSpace(self.CGImage),
                                                CGImageGetBitmapInfo(self.CGImage));
       CGContextConcatCTM(ctx, transform);
       switch (self.imageOrientation) {
           case UIImageOrientationLeft:
           case UIImageOrientationLeftMirrored:
           case UIImageOrientationRight:
           case UIImageOrientationRightMirrored:
               // Grr...
               CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
               break;
               
           default:
               CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
               break;
       }
       
       // And now we just create a new UIImage from the drawing context
       CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
       UIImage *img = [UIImage imageWithCGImage:cgimg];
       CGContextRelease(ctx);
       CGImageRelease(cgimg);
       return img;
}

- (NSData *)compressImage {
    int width = (int)self.size.width;
        int height = (int)self.size.height;
        int updateWidth = width;
        int updateHeight = height;
        int longSide = MAX(width, height);
        int shortSide = MIN(width, height);
    //    float scale = ((float) shortSide / longSide);
        // 大小压缩
        UIImage *compressImage = nil;
        if (shortSide <= 1080 || longSide <= 1080) { // 如果宽高任何一边都小于 1080
            updateWidth = width;
            updateHeight = height;
            compressImage = self;
        } else { // 如果宽高都大于 1080
            if (width < height) { // 说明短边是宽
                updateWidth = 1080;
                updateHeight  = (updateWidth * height) / width;
    //            updateHeight = 1080 / scale;
            } else { // 说明短边是高
                updateHeight = 1080;
                updateWidth  = (updateHeight * width) / height;
    //            updateWidth = updateHeight / scale;
            }
            CGSize compressSize = CGSizeMake(updateWidth, updateHeight);
            UIGraphicsBeginImageContext(compressSize);
            [self drawInRect:CGRectMake(0,0, compressSize.width, compressSize.height)];
            compressImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        CGFloat compressRate = 0.5;
        NSData *data = UIImageJPEGRepresentation(compressImage, 1);
        CGFloat max = 1024 * 350;
        if (data.length  < max) {
            return data;
        }else {
            CGFloat rate = data.length / max;
            if (rate < 0.5) {
                compressRate = 0.5;
            }else if (rate > 1) {
                compressRate = 0.6;
            }else {
                compressRate = rate;
            }
        }
        // 质量压缩 50%
        NSData *compressData = UIImageJPEGRepresentation(compressImage, compressRate);
        return compressData;
}

- (UIImage*)subImageByCenterSize:(CGSize)size
{
    if (size.width == 0 || size.height == 0)
        return self;
    CGSize dSize = size;
    CGFloat f1 = size.width/size.height;
    CGFloat f2 = self.size.width/self.size.height;
    if (f1 > f2)
    {
        dSize.width = self.size.width;
        dSize.height = self.size.width/f1;
    }
    else
    {
        dSize.height = self.size.height;
        dSize.width = self.size.height*f1;
    }
    CGRect rect = CGRectMake((self.size.width-dSize.width)*0.5*self.scale, (self.size.height-dSize.height)*0.5*self.scale, dSize.width*self.scale, dSize.height*self.scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *resultImage=[UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    //修正回原scale和方向
    resultImage = [UIImage imageWithCGImage:resultImage.CGImage scale:self.scale orientation:self.imageOrientation];
    
    return resultImage;
}

-(UIImage *)boxblurImageWithBlur:(CGFloat)blur {
    @try {
        NSData *imageData = UIImageJPEGRepresentation(self, 1); // convert to jpeg
        UIImage* destImage = [UIImage imageWithData:imageData];
        if (blur < 0.f || blur > 1.f) {
            blur = 0.5f;
        }
        int boxSize = (int)(blur * 40);
        boxSize = boxSize - (boxSize % 2) + 1;
        
        CGImageRef img = destImage.CGImage;
        
        vImage_Buffer inBuffer, outBuffer;
        
        vImage_Error error;
        
        void *pixelBuffer;
        
        
        CGDataProviderRef inProvider = CGImageGetDataProvider(img);
        CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
        
        
        inBuffer.width = CGImageGetWidth(img);
        inBuffer.height = CGImageGetHeight(img);
        inBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
        
        //create vImage_Buffer for output
        
        pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
        
        if(pixelBuffer == NULL)
            NSLog(@"No pixelbuffer");
        
        outBuffer.data = pixelBuffer;
        outBuffer.width = CGImageGetWidth(img);
        outBuffer.height = CGImageGetHeight(img);
        outBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        // Create a third buffer for intermediate processing
        void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
        vImage_Buffer outBuffer2;
        outBuffer2.data = pixelBuffer2;
        outBuffer2.width = CGImageGetWidth(img);
        outBuffer2.height = CGImageGetHeight(img);
        outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
        
        //perform convolution
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
        CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorSpace);
        
        free(pixelBuffer);
        free(pixelBuffer2);
        CFRelease(inBitmapData);
        
        CGImageRelease(imageRef);
        
        return returnImage;
    } @catch (NSException *exception) {
        return self;
    } @finally {
        
    }
}

+ (UIImage *)circleImage:(UIImage *)originImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    UIImage *resultImage;
    @try {
        //设置边框宽度
        CGFloat imageWH = originImage.size.width;
        
        //计算外圆的尺寸
        CGFloat ovalWH = imageWH + 2 * borderWidth;
        
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(originImage.size, NO, 0);
        
        //画一个大的圆形
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
        
        [borderColor set];
        
        [path fill];
        
        //设置裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, imageWH, imageWH)];
        [clipPath addClip];
        
        //绘制图片
        [originImage drawAtPoint:CGPointMake(borderWidth, borderWidth)];
        
        //从上下文中获取图片
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭上下文
        UIGraphicsEndImageContext();
        
    } @catch (NSException *exception) {
        return originImage;
    } @finally {
        return resultImage;
    }
}

// 根据宽度，图片等比例缩放
+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}

@end
