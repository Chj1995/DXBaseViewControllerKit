//
//  XKEmptyView.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKEmptyView.h"
#import "XKBaseColorButton.h"
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXCategoryKit/DXCategoryKit.h>
#import "XKPulbicViewTool.h"

static const CGFloat kDefaultLabelPadding = 25.f;//文本距离图标间距
static const CGFloat kDefaultSubLabelPadding = 8.f;//第一文本 和第二文本 间距
static const CGFloat kDefaultButtongPadding = 14.f;//文本和按钮 间距
static const CGFloat kDefaultButtonHeight = 50.f;//按钮高度


@implementation XKEmptyView {
    UIView *_baseView; //底座
    UILabel *_label; //基本文本
    XKBaseColorButton *_button; //基本按钮
    UILabel *_subLabel; //子文本
    BOOL _hadSetBaseYPadding;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    _hadSetBaseYPadding = NO;
    [self constructSubView];
    return self;
}

- (void)constructSubView{
    _baseView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_baseView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.userInteractionEnabled = NO;
    [_baseView addSubview:_imageView];
    
    
    //label
    _label = [[UILabel alloc] init];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = KBlodFont(15);
    _label.textColor = XKColor.xk_color99;
    _label.numberOfLines = 2;
    _label.lineBreakMode = NSLineBreakByCharWrapping;
    [_baseView addSubview:_label];
    
    //subLabel
    _subLabel = [[UILabel alloc] init];
    _subLabel.textAlignment = NSTextAlignmentCenter;
    _subLabel.font = KNornalFont(12);
    _subLabel.textColor = XKColor.xk_colorAeb0b7;
    [_baseView addSubview:_subLabel];
    
    
    _button = [XKBaseColorButton buttonWithStyle:XKBaseColorType_BTN1];
    _button.titleLabel.font = KBlodFont(18);
    [_baseView addSubview:_button];
    _button.layer.cornerRadius = 5;
    _button.layer.borderWidth = 0;
    _button.layer.masksToBounds = YES;
}

-(void)setBaseYPadding:(CGFloat)baseYPadding{
    _baseYPadding = baseYPadding;
    _hadSetBaseYPadding = YES;
}
#pragma mark - public
- (void)setImage:(UIImage *)image{
    [self setImage:image
         labelText:nil
     labelYPadding:0];
}

//设置文本
- (void)setLabelText:(NSString *)labelText{
    [self setImage:nil
         labelText:labelText
     labelYPadding:0];
}

//设置图片和文本
- (void)setImage:(UIImage *)image
       labelText:(NSString *)labelText{
    [self setImage:image
         labelText:labelText
     labelYPadding:kDefaultLabelPadding];
}

//设置图片和文本，以及文本位置
- (void)setImage:(UIImage *)image
       labelText:(NSString *)labelText
   labelYPadding:(CGFloat)labelPadding{
    [self setImage:image
         labelText:labelText
     labelYPadding:labelPadding
      subLabelText:@""
   subLabelPadding:kDefaultSubLabelPadding
        buttonText:@""
      buttonTarget:nil
      buttonAction:nil
       btnYPadding:0];
}

//设置图片，文本和按钮，
- (void)setImage:(UIImage *)image
       labelText:(NSString *)labelText
      buttonText:(NSString *)buttonText
    buttonTarget:(id)buttonTarget
    buttonAction:(__nullable SEL)buttonAction{
    [self setImage:image
         labelText:labelText
     labelYPadding:kDefaultLabelPadding
      subLabelText:@""
   subLabelPadding:kDefaultSubLabelPadding
        buttonText:buttonText
      buttonTarget:buttonTarget
      buttonAction:buttonAction
       btnYPadding:kDefaultButtongPadding];
}

//设置图片，文本，子文本和按钮
- (void)setImage:(UIImage *)image
       labelText:(NSString *)labelText
    subLabelText:(NSString *)subLabelText
      buttonText:(NSString *)buttonText
    buttonTarget:(id)buttonTarget
    buttonAction:(__nullable SEL)buttonAction{
    [self setImage:image
         labelText:labelText
     labelYPadding:kDefaultLabelPadding
      subLabelText:subLabelText
   subLabelPadding:kDefaultSubLabelPadding
        buttonText:buttonText
      buttonTarget:buttonTarget
      buttonAction:buttonAction
       btnYPadding:kDefaultButtongPadding];
}

//设置图片，文本和按钮，以及文本，按钮位置
- (void)setImage:(UIImage *)image
       labelText:(NSString *)labelText
   labelYPadding:(CGFloat)labelPadding
    subLabelText:(NSString *)subLabelText
 subLabelPadding:(CGFloat)subLabelPadding
      buttonText:(NSString *)buttonText
    buttonTarget:(id)buttonTarget
    buttonAction:(__nullable SEL)buttonAction
     btnYPadding:(CGFloat)btnYPadding{
    if (!image) {//图标
        _imageView.frame = CGRectZero;
    }
    else{
        CGSize size = CGSizeMake(XKFixWidth(image.size.width), XKFixWidth(image.size.height) );
        _imageView.size = size;
        [_imageView setImage:image];
    }
    
    if (!KISString(labelText)) {//第一行文本
        _label.frame = CGRectZero;
        labelPadding = 0.f;
    }
    else{
        _label.text = labelText;
        _label.numberOfLines = 2;
        _label.size = CGSizeMake(SCREEN_WIDTH *0.75, kDefaultButtonHeight);
        [_label sizeToFit];
    }
    
    if (!KISString(subLabelText)) {//子文本
        _subLabel.frame = CGRectZero;
        subLabelPadding = 0.f;
    }
    else{
        _subLabel.text = subLabelText;
        _subLabel.numberOfLines = 0;
        [_subLabel sizeToFit];
    }
    
    if (!KISString(buttonText)) {//按钮
        _button.frame = CGRectZero;
        btnYPadding = 0.f;
    }
    else {
        _button.size = CGSizeMake(SCREEN_WIDTH * 0.84, kDefaultButtonHeight);
        [_button setTitle:buttonText forState:UIControlStateNormal];
        [_button addTarget:buttonTarget action:buttonAction forControlEvents:UIControlEventTouchUpInside];
    }
    
    CGFloat baseHeight = _imageView.height + _label.height + _subLabel.height + _button.height + XKFixWidth(labelPadding + btnYPadding);
    _baseView.size = CGSizeMake(self.width, baseHeight);
    if (_hadSetBaseYPadding) {
        _baseView.origin = CGPointMake(self.width * 0.5 - _baseView.width * 0.5, XKFixWidth(self.baseYPadding));
    }else{
        _baseView.origin = CGPointMake(self.width * 0.5 - _baseView.width * 0.5, SCREEN_HEIGHT/5 - [XKPulbicViewTool getStatusBarHeight] + 44);
    }

    
    CGFloat nextY = 0.f;
    [UIView setSubviewCenterOnHorizontal:_imageView AtY:nextY superView:_baseView];
    nextY += _imageView.height + XKFixWidth(labelPadding);
    
    [UIView setSubviewCenterOnHorizontal:_label AtY:nextY superView:_baseView];
    nextY += _label.height + XKFixWidth(subLabelPadding);
    
    [UIView setSubviewCenterOnHorizontal:_subLabel AtY:nextY superView:_baseView];
    nextY += _subLabel.height + XKFixWidth(btnYPadding);
    
    [UIView setSubviewCenterOnHorizontal:_button AtY:nextY superView:_baseView];
    
    self.size = CGSizeMake(self.width, _baseView.bottom + _baseView.origin.y);
}


@end
