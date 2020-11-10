//
//  XKLoadFailureView.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKLoadFailureView.h"
#import "XKRefreshPointView.h"
#import "XKReachability.h"
#import "UIImage+XKEvent.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <Masonry/Masonry.h>

@interface XKLoadFailureView ()
@property(nonatomic, strong)NSMutableDictionary * titleMap;
@property(nonatomic, strong)NSMutableDictionary * imageMap;
@property(nonatomic, strong) XKRefreshPointView *animationView;
@end
@implementation XKLoadFailureView
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self layoutMainView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutMainView];
    }
    return self;
}


-(void)layoutMainView {
    // 设置透明，并且enable=no
//    [self setBackgroundColor:[UIColor clearColor]];
//    self.userInteractionEnabled = NO;
    
    self.state = XKLoadingState_Hidden;

    self.titleMap = [NSMutableDictionary dictionary];
     self.imageMap = [NSMutableDictionary dictionary];
    @weakify(self);
    [[RACObserve(self.layer, bounds) skip:1] subscribeNext:^(id x) {
        @strongify(self)
        [self refreshView];
    }];
    _animationView =[[XKRefreshPointView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    _animationView.isShowTitle = NO;
    [self addSubview:_animationView];
    [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

#pragma mark - public
+ (instancetype)addToView:(UIView *)view {
    return [self addToView:view show:YES];
}
+ (instancetype)addToView:(UIView *)view show:(BOOL)show {
    XKLoadFailureView *loadingView = [[self alloc] initWithFrame:CGRectMake(0, 0, view.width, view.height)];
    if (show) {
        [loadingView show];
    } else {
        [loadingView hide];
    }
    return loadingView;
}
-(void)setTitle:(NSString *)title andState:(XKLoadingState)state
{
    [self setState:state andTitle:title];
}
-(void)setState:(XKLoadingState)state andTitle:(NSString *)title
{
    [self setTitle:title forState:state];
    if(_state != state)
    {
        [self setState:state];
    }
}
-(void)setTitle:(NSString *)title forState:(XKLoadingState)state
{
    _titleMap[@(state)] = title;
    if (_state == state) {
        _titleLabel.text = title;
        [self refreshView];
        if(self.superview.subviews.lastObject != self)
        {
            [self.superview bringSubviewToFront:self];
        }
    }
}
-(NSString *)titleForState:(XKLoadingState)state
{
    return _titleMap[@(state)];
}
- (void)setImage:(UIImage *)image forState:(XKLoadingState)state{
    _imageMap[@(state)]=image;
}
- (UIImage *)imageForState:(XKLoadingState)state
{
     return _imageMap[@(state)];
}
-(void)setState:(XKLoadingState)state
{
    _state = state;

    [self setImageView:nil titleLabel:_titleLabel state:state];

    [self refreshView];
    if(self.superview.subviews.lastObject != self)
    {
        [self.superview bringSubviewToFront:self];
    }
}

-(void)setImageView:(UIImageView *)imageView titleLabel:(UILabel *)titleLabel state:(XKLoadingState)state {
    BOOL hasNetwork = [[XKReachability shareInstance] networkEnable];
    NSString* title = [self titleForState:state];
    switch (state) {
        case XKLoadingState_NoResult:
        {
            if(hasNetwork){
                 self.imageView.image = [UIImage imageNamed:kNoDataImageName];
                self.titleLabel.text = title?:@"暂时没有数据哦！";
                _animationView.hidden=YES;
                titleLabel.hidden=NO;
                self.reloadButton.hidden = YES;
            } else {
                self.imageView.image = [UIImage imageNamed:@"slow_net_icon"];
                self.titleLabel.text = title?:@"网络不给力，请再试一次";
                _animationView.hidden = YES;
                titleLabel.hidden=NO;
                self.reloadButton.hidden = NO;
            }
            break;
        }
        case XKLoadingState_Retry:
        {
            if(hasNetwork) {
                self.imageView.image = [UIImage imageNamed:@"slow_net_icon"];
                self.titleLabel.text = title?:@"哦啊~手机网络不太顺畅哦！";
                _animationView.hidden = YES;
                self.titleLabel.hidden=NO;
                 self.reloadButton.hidden = NO;
            } else {
                self.imageView.image = [UIImage imageNamed:@"slow_net_icon"];
                self.titleLabel.text = title?:@"网络不给力，请再试一次";
                _animationView.hidden=YES;
                self.titleLabel.hidden=NO;
                self.reloadButton.hidden = NO;
            }
            break;
        }
        case XKLoadingState_Hidden:
        {
            _animationView.hidden=YES;
            _titleLabel.hidden=YES;
            break;
        }
        case XKLoadingState_Loading:
        {
            self.imageView.image=nil;
            _animationView.isRefreshing = YES;
            _animationView.hidden=NO;
            _titleLabel.hidden=YES;
            if (_reloadButton)
                _reloadButton.hidden = YES;
            break;
        }
        case XKLoadingState_NoUserData:
        {
            UIImage *image=[self imageForState:state];
            self.imageView.image = image;
            self.titleLabel.text = title?:@"暂无数据";
            _animationView.isRefreshing = NO;
            _animationView.hidden=YES;
            self.titleLabel.hidden = NO;
            _reloadButton.hidden = YES;
        }
            break;
        case XKLoadingState_NoUserDataAndAction:
        {
            UIImage *image=[self imageForState:state];
            self.imageView.image = image;
            self.titleLabel.text = title?:@"暂无数据";
            _animationView.isRefreshing = NO;
            _animationView.hidden=NO;
            self.titleLabel.hidden = NO;
            self.reloadButton.hidden = NO;
            [self.reloadButton setTitle:@"去广场逛一逛" forState:UIControlStateNormal];
        }
            break;
        case XKLoadingState_NoFansDataAndAction:
        {
            UIImage *image=[self imageForState:state];
            self.imageView.image = image;
            self.titleLabel.text = title?:@"暂无数据";
            _animationView.isRefreshing = NO;
            _animationView.hidden=NO;
            self.titleLabel.hidden = NO;
            self.reloadButton.hidden = NO;
            [self.reloadButton setTitle:@"我要直播" forState:UIControlStateNormal];
        }
            break;
    }
}
#pragma mark - private
-(void)handleTap:(id)sender {
    if(_state == XKLoadingState_Loading || _state == XKLoadingState_Hidden){
        return;
    }
    _animationView.isRefreshing = YES;
    if(self.state == XKLoadingState_NoUserDataAndAction) {

    } else {
        self.state = XKLoadingState_Loading;
    }
    !self.reloadBlock ?: self.reloadBlock();
}
-(void)refreshView {
    if(_state == XKLoadingState_Hidden) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
}

-(void)show {
    self.state = XKLoadingState_Loading;
}
-(void)hide {
    self.state = XKLoadingState_Hidden;
}

-(void)setButtonTitle:(NSString *)title {
    if(KISString(title)) {
        self.button.hidden = NO;
        [_button setTitle:title forState:UIControlStateNormal];
        _button.centerX = self.width / 2;
        _button.top = self.titleLabel.bottom + 15;
    } else {
        _button.hidden = YES;
    }
}

//暂停layer上面的动画
- (void)pauseLayer:(CALayer*)layer {
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续layer上面的动画
- (void)resumeLayer:(CALayer*)layer {
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

- (void)drawRect:(CGRect)rect
{
    _animationView.center = CGPointMake(self.width*0.5, self.height-SCREEN_HEIGHT*0.5);
}

#pragma mark - getter
- (UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
//        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_imageView.superview);
            make.centerY.equalTo(_imageView.superview).offset(- XKFixWidth(123)/2);
        }];
    }
    return _imageView;
}

- (UILabel*)titleLabel {
    if (!_titleLabel) {
        CGFloat y=CGRectGetMaxY(self.imageView.frame)+XKFixWidth(17);
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,y, SCREEN_WIDTH, 18)];
        _titleLabel.textColor = XKColor.xk_color97;
        _titleLabel.font = KNornalFont(13);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_titleLabel.superview);
            make.top.equalTo(self.imageView.mas_bottom).offset(XKFixWidth(17));
        }];
    }
    return _titleLabel;
}

- (XKBaseColorButton *)reloadButton {
    if (!_reloadButton) {
          CGFloat y=CGRectGetMaxY(self.titleLabel.frame)+XKFixWidth(20);
        _reloadButton = [XKBaseColorButton buttonWithFrame:CGRectMake((self.width - XKFixWidth(155)) * 0.5, y, XKFixWidth(155), XKFixWidth(43)) style:XKBaseColorType_BTN2 target:self action:@selector(handleTap:)];
        _reloadButton.titleLabel.font = KNornalFont(17);
        [_reloadButton setTitleColor:XKColor.xk_colorForBtnTitle forState:UIControlStateNormal];
        [_reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [self addSubview:_reloadButton];
        [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(XKFixWidth(155));
            make.height.offset(XKFixWidth(43));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(XKFixWidth(20));
            make.centerX.equalTo(self->_reloadButton.superview);
        }];
        _reloadButton.backgroundColor = XKColor.xk_colorED4264;
    }
    return _reloadButton;
}
-(UIButton *)button {
    if(_button == nil) {
        self.reloadButton.hidden = YES;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.width = XKFixWidth(150);
        button.height = XKFixWidth(39);
        button.layer.cornerRadius = XKFixWidth(39/2);
        button.layer.masksToBounds = YES;
        UIImage *image = [UIImage createGradientImageWithSize:CGSizeMake(XKFixWidth(150), XKFixWidth(39)) gradientColors:XKColor.xk_colorArrFF percentage:@[@(0.5),@(1.0)] gradientType:XKGradientType_LeftToRight];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = KNornalFont(15);
        _button = button;
        [self addSubview:button];
    }
    return _button;
}


@end
