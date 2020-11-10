//
//  XKEmptyView.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKEmptyView : UIView
@property(nonatomic, strong)UIImageView *imageView; //基本图片
@property(nonatomic, readonly)UILabel *label;
@property(nonatomic, assign) CGFloat baseYPadding;  //设置背景与顶部间距 如果设置，必须在底下的方法之前设置。

//设置图片
- (void)setImage:(UIImage *)image;

//设置文本
- (void)setLabelText:(NSString *)labelText;

//设置图片和文本
- (void)setImage:(UIImage *_Nullable)image
       labelText:(NSString *_Nullable)labelText;

//设置图片和文本，以及文本位置
- (void)setImage:(UIImage *_Nullable)image
       labelText:(NSString *_Nullable)labelText
   labelYPadding:(CGFloat)labelPadding;

//设置图片，文本和按钮，
- (void)setImage:(UIImage *_Nullable)image
       labelText:(NSString *_Nullable)labelText
      buttonText:(NSString *_Nullable) buttonText
    buttonTarget:(id _Nullable)buttonTarget
    buttonAction:(__nullable SEL)buttonAction;

//设置图片，文本，子文本和按钮，
- (void)setImage:(UIImage *_Nullable)image
       labelText:(NSString *_Nullable)labelText
    subLabelText:(NSString *_Nullable)subLabelText
      buttonText:(NSString *_Nullable)buttonText
    buttonTarget:(id)buttonTarget
    buttonAction:(__nullable SEL)buttonAction;


//设置图片，文本和按钮，以及文本，按钮位置
- (void)setImage:(UIImage *)image
       labelText:(NSString *_Nullable)labelText
   labelYPadding:(CGFloat)labelPadding
    subLabelText:(NSString *_Nullable)subLabelText
 subLabelPadding:(CGFloat)subLabelPadding
      buttonText:(NSString *_Nullable)buttonText
    buttonTarget:(id)buttonTarget
    buttonAction:(__nullable SEL)buttonAction
     btnYPadding:(CGFloat)btnYPadding;
@end

NS_ASSUME_NONNULL_END
