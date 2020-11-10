//
//  XKRefreshPointView.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKRefreshPointView.h"
#import <Masonry/Masonry.h>
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXCategoryKit/DXCategoryKit.h>

#define kPointFillColor_1   0.151, 0.151, 0.153, 0.25         //第一个按钮填充色值
#define kPointFillColor_2   0.151, 0.151, 0.153, 0.25         //第二个按钮填充色值
#define kPointFillColor_3   0.151, 0.151, 0.153, 0.25         //第三个按钮填充色值

#define kPointFillColor_jump  0.151, 0.151, 0.153, 0.5         //跳跃按钮填充色值

static CGFloat kPointRadius = 4;//圆点半径
static CGFloat kPointMarginX_1 = 8;
static CGFloat kPointMarginX_2 = 20;
static CGFloat kPointMarginX_3 = 32;// 两点间的 间距要相同
static CGFloat kPointMarginY = 10;




@interface XKRefreshPointAnimationView()

@property (nonatomic,assign)CGFloat distance;
@property (nonatomic,assign)BOOL isRefreshing;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)CGFloat whiteCircleX;
@property (nonatomic,assign)NSInteger timeCount;

@end

@implementation XKRefreshPointAnimationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.whiteCircleX = kPointMarginX_1;//白色点的位置
        self.timeCount = 1;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    if (!_isRefreshing) {
        if (_distance >0 && _distance <= 15) {
            CGContextAddArc(ctx, kPointMarginX_1, 40 + _distance, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_1);
            CGContextFillPath(ctx);
        }
        else if(_distance > 15 && _distance <= 35){
            
            CGContextAddArc(ctx, kPointMarginX_1, kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_1);//填充色值
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_2, 20 + _distance, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_2);
            CGContextFillPath(ctx);
        }
        else if(_distance > 35 && _distance <= 55){
            
            CGContextAddArc(ctx, kPointMarginX_1,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_1);
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_2,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_2);
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_3, kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_3);
            CGContextFillPath(ctx);
            
        }
        else if(_distance > 55){
            CGContextAddArc(ctx, kPointMarginX_1,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_1);
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_2,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_2);
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_3,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_3);
            CGContextFillPath(ctx);
        }
        else if(_distance < 0){
            
            CGContextAddArc(ctx, kPointMarginX_1,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_1);
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_2,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_2);
            CGContextFillPath(ctx);
            
            CGContextAddArc(ctx, kPointMarginX_3, kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
            CGContextSetRGBFillColor(ctx, kPointFillColor_3);
            CGContextFillPath(ctx);
        }
    }
    else{
        
        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(updateUIApperance) userInfo:nil repeats:YES];
        }
        
        CGContextAddArc(ctx, kPointMarginX_1,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
        CGContextSetRGBFillColor(ctx, kPointFillColor_1);
        CGContextFillPath(ctx);
        
        CGContextAddArc(ctx, kPointMarginX_2,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
        CGContextSetRGBFillColor(ctx, kPointFillColor_2);
        CGContextFillPath(ctx);
        
        CGContextAddArc(ctx, kPointMarginX_3,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
        CGContextSetRGBFillColor(ctx, kPointFillColor_3);
        CGContextFillPath(ctx);
        
        CGContextAddArc(ctx, _whiteCircleX,kPointMarginY, kPointRadius, 0, M_PI * 2, 1);
        CGContextSetRGBFillColor(ctx, kPointFillColor_jump);
        CGContextFillPath(ctx);
    }
}

- (void)updateUIApperance{
    
    _timeCount ++;
    NSInteger tmp = _timeCount%3;
    if (tmp == 1) {
        _whiteCircleX = kPointMarginX_1;
    }else if(tmp == 2){
        _whiteCircleX = kPointMarginX_2;
    }  else{
        _whiteCircleX = kPointMarginX_3;
    }
    [self setNeedsDisplay];
}

- (void)setDistance:(CGFloat)distance{
    _distance = distance - kPointRadius;
    [self setNeedsDisplay];
}

- (void)setIsRefreshing:(BOOL)isRefreshing{
    _isRefreshing = isRefreshing;
    if (!_isRefreshing) {
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
        self.timeCount = 1;
        self.whiteCircleX = kPointMarginX_1;
    }
    [self setNeedsDisplay];
}
@end


@interface XKRefreshPointView ()

@property (nonatomic, strong) UIImageView *bgImageView;//头像
@property (nonatomic, strong) UILabel *textLbl;//下方提示

@property (nonatomic, strong) XKRefreshPointAnimationView *animationView;

@end

@implementation XKRefreshPointView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _isShowTitle = YES;
        [self contructView];
    }
    return self;
}
- (void)contructView {
    [self addAnimationView];
    
    [self addTextLabel];
}

- (void)setIsShowTitle:(BOOL)isShowTitle {
    _isShowTitle = isShowTitle;
    [self.textLbl setHidden:!isShowTitle];
}

- (void)setDistance:(CGFloat)distance {
    self.animationView.distance = distance;
}

- (void)setIsRefreshing:(BOOL)isRefreshing {
    self.animationView.isRefreshing = isRefreshing;
}

- (void)addBgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        [_bgImageView setImage:[UIImage imageNamed:@"refresh_bg"]];
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_offset((46));
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self.mas_top).mas_offset((15));
        }];
    }
}

- (void)addAnimationView {
    if (!_animationView) {
        _animationView = [[XKRefreshPointAnimationView alloc] initWithFrame:CGRectZero];
        [self addSubview:_animationView];
        [self bringSubviewToFront:_animationView];
        [_animationView setNeedsDisplay];
        _animationView.backgroundColor = [UIColor clearColor];
        [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset((46));
            make.height.mas_offset((20));
            make.centerX.mas_equalTo(self).mas_equalTo((3));
            make.top.mas_equalTo(self.mas_top).mas_offset((28));

        }];
    }
}


- (void)addTextLabel {
    if (!_textLbl) {
        _textLbl = [[UILabel alloc] init];
        _textLbl.text = KSTRING_FORMAT(@"%@，给你想要的^_^",KAppName) ;
        _textLbl.font = KNornalFont(13);
        _textLbl.textColor = XKColor.xk_color88;
        _textLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLbl];
        [_textLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self.mas_top).mas_offset((61));
        }];
    }
}
-(void)setTitleTextColor:(UIColor *)titleTextColor {
    self.textLbl.textColor = titleTextColor;
}


@end
