//
//  XKMaintenanceView.m
//  XiongKe
//
//  Created by 陈辉金 on 2020/9/19.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKMaintenanceView.h"
#import <Masonry/Masonry.h>
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXCategoryKit/DXCategoryKit.h>
#import <YYKit/YYKit.h>

@interface XKMaintenanceView()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *msgLabel;

@property (nonatomic, strong) UIButton *exitBtn;

@end

@implementation XKMaintenanceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.backgroundColor = [UIColor whiteColor];
        [self layoutMainViews];
    }
    return self;
}

- (void)layoutMainViews {
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.mas_centerY).with.offset(-XKFixWidth(150));
        make.size.mas_equalTo(CGSizeMake(XKFixWidth(150), XKFixWidth(150)));
    }];
    [self addSubview:self.msgLabel];
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(XKFixWidth(40));
        make.left.mas_equalTo(XKFixWidth(40));
        make.right.equalTo(self).with.offset(-XKFixWidth(40));
    }];
    [self addSubview:self.exitBtn];
    [self.exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.msgLabel.mas_bottom).with.offset(XKFixWidth(60));
        make.size.mas_equalTo(CGSizeMake(XKFixWidth(150), XKFixWidth(40)));
        make.centerX.equalTo(self);
    }];
}
- (void)setMsg:(NSString *)msg {
    self.msgLabel.text = msg;
}
- (void)exitBtnClickAction {
    exit(0);
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"maintenance"]];
    }
    return _iconImageView;
}

- (UILabel *)msgLabel {
    if (!_msgLabel) {
        _msgLabel = [UILabel labelWithText:@"维护中" textColor:XKColor.xk_color32 font:KNornalFont(14)];
        _msgLabel.numberOfLines = 0;
        _msgLabel.font = KNornalFont(17);
        _msgLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _msgLabel;
}

- (UIButton *)exitBtn {
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitBtn addTarget:self action:@selector(exitBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
        [_exitBtn setTitle:@"退出APP" forState:UIControlStateNormal];
        [_exitBtn setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
        _exitBtn.layer.cornerRadius = XKFixWidth(5);
        _exitBtn.clipsToBounds = YES;
    }
    return _exitBtn;
}

@end
