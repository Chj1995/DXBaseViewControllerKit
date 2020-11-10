//
//  XKBaseColorButton.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKBaseColorButton.h"
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXCategoryKit/DXCategoryKit.h>
#import <YYKit/YYKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface XKBaseColorButton ()

@property (nonatomic, strong) NSMutableDictionary *borderMap;
@property (nonatomic, strong) NSMutableDictionary *backgroundMap;

@end
@implementation XKBaseColorButton
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self bindSign];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self bindSign];
}
- (void)setColorType:(XKBaseColorType)colorType {
    _colorType = colorType;
    switch (colorType) {
        case XKBaseColorType_BTN1:
            {
                self.layer.cornerRadius = 8;
                self.layer.masksToBounds = YES;
                [self setTitleColor:XKColor.xk_color99 forState:UIControlStateDisabled];
                [self setTitleColor:XKColor.xk_color32 forState:UIControlStateNormal];
                [self setTitleColor:XKColor.xk_color32 forState:UIControlStateHighlighted];
                self.titleLabel.font = KBlodFont(16);
                
                [self setBackgroundColor:XKColor.xk_colorF3 forState:UIControlStateDisabled];
                [self setBackgroundColor:XKColor.xk_colorED4264 forState:UIControlStateNormal];
                [self setBackgroundColor:XKColor.xk_colorED4264 forState:UIControlStateHighlighted];
                
                
                [self setBorderColor:XKColor.xk_colorF3 forState:UIControlStateDisabled];
                [self setBorderColor:XKColor.xk_color33 forState:UIControlStateNormal];
                
                self.layer.borderWidth = 1;
            }
                break;
            case XKBaseColorType_BTN2:
            {
                self.layer.cornerRadius = self.height/2.0;
                self.layer.masksToBounds = YES;
                [self setTitleColor:XKColor.xk_color99 forState:UIControlStateDisabled];
                [self setTitleColor:XKColor.xk_color32 forState:UIControlStateNormal];
                [self setTitleColor:XKColor.xk_color32 forState:UIControlStateHighlighted];
                
                [self setBackgroundColor:XKColor.xk_colorF3 forState:UIControlStateDisabled];
                [self setBackgroundColor:XKColor.xk_colorED4264 forState:UIControlStateNormal];
                [self setBackgroundColor:XKColor.xk_colorED4264 forState:UIControlStateHighlighted];
            }
                break;
            case XKBaseColorType_BTN9:
            {
                self.layer.cornerRadius = 4;
                self.layer.masksToBounds = YES;
                [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
                [self setTitleColor:XKColor.xk_colorFCD934 forState:UIControlStateNormal];
                [self setTitleColor:XKColor.xk_colorFCD934 forState:UIControlStateHighlighted];
                self.titleLabel.font = KBlodFont(12);
                
                [self setBackgroundColor:KHEXColor(0xdadada,1.0) forState:UIControlStateDisabled];
                [self setBackgroundColor:KHEXColor(0xfff4bf,1.0) forState:UIControlStateNormal];
                [self setBackgroundColor:KHEXColor(0xfff4bf,1.0) forState:UIControlStateHighlighted];
                
                
                [self setBorderColor:KHEXColor(0xdadada,1.0) forState:UIControlStateDisabled];
                [self setBorderColor:KHEXColor(0xfff4bf,1.0) forState:UIControlStateNormal];
                
                self.layer.borderWidth = 0.5;
            }
                break;
                

            default:
                break;
        }
    [self stateChange];
}
#pragma mark - public
+ (XKBaseColorButton *)buttonWithStyle:(XKBaseColorType)style {
    XKBaseColorButton *button = [XKBaseColorButton buttonWithType:UIButtonTypeCustom];
    button.colorType = style;
    return button;
}

+ (XKBaseColorButton *)buttonWithFrame:(CGRect)rect style:(XKBaseColorType)style {
    return [[self class] buttonWithFrame:rect style:style target:nil action:nil];
}

+ (XKBaseColorButton *)buttonWithFrame:(CGRect)rect style:(XKBaseColorType)style target:(id)target action:(SEL _Nullable)action {
    XKBaseColorButton *button = [XKBaseColorButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenDisabled = NO;
    button.frame = rect;
    button.colorType = style;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
- (void)setBorderColor:(UIColor*)borderColor forState:(UIControlState)state {
    [self.borderMap setValue:borderColor forKey:[NSString stringWithUInteger:state]];
}
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self.backgroundMap setValue:backgroundColor forKey:[NSString stringWithUInteger:state]];
}
- (void)bindSign {
    @weakify(self)
    [[RACSignal merge:@[RACObserve(self, highlighted),RACObserve(self, selected),RACObserve(self, enabled)]]subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self stateChange];
    }];
}

- (void)stateChange {
    NSString *key = [NSString stringWithUInteger:self.state];
    UIColor *bordorColor = [_borderMap valueForKey:key];
    UIColor *backgoundColor = [_backgroundMap valueForKey:key];
    
    if (bordorColor)
        self.layer.borderColor = [bordorColor CGColor];
    if (backgoundColor)
        self.backgroundColor = backgoundColor;
}

#pragma - getter
- (NSMutableDictionary *)borderMap {
    if (!_borderMap) {
        _borderMap = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    return _borderMap;;
}
- (NSMutableDictionary *)backgroundMap {
    if (!_backgroundMap) {
        _borderMap = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    return _backgroundMap;;
}
@end
