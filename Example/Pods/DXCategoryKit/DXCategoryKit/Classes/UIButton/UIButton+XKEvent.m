//
//  UIButton+XKEvent.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "UIButton+XKEvent.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
@interface UIButton()
@property (nonatomic, strong) UIImageView *anchorTagImgView;
@end
@implementation UIButton (XKEvent)
/// 设置图文中间上下
- (void)verticalSpace:(CGFloat)space {
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(imageSize.height + space), 0);
    CGSize titleSize = [self.titleLabel sizeThatFits:(CGSizeMake(MAXFLOAT, MAXFLOAT))];
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + space), 0, 0, - titleSize.width);
}
- (void)leftImageSpace:(CGFloat)space leftMargin:(CGFloat)leftMargin {
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, (leftMargin), 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, (leftMargin + space), 0, 0);
}
- (void)rightImageSpace:(CGFloat)space rightMargin:(CGFloat)rightMargin {
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, rightMargin);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, (rightMargin + space));
}
/**
 给角色为主播的头像添加标示
 
 @param anchorSize 标示图宽高
 */
- (void)setAnchorViewWithAnchorSize:(CGSize)anchorSize
{
    [self.superview addSubview:self.anchorTagImgView];
    
    [self.anchorTagImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(anchorSize);
        make.left.equalTo(self.mas_right).offset(-anchorSize.width);
        make.top.equalTo(self.mas_bottom).offset(-anchorSize.height);
    }];
}

// 删除v标识图
- (void)removeAnchorImageView {
    [self.anchorTagImgView removeFromSuperview];
}

#pragma mark - getter / setter
- (UIImageView *)anchorTagImgView {
    UIImageView *imgView = objc_getAssociatedObject(self, _cmd);
    if (!imgView) {
        imgView = [[UIImageView alloc]init];
        [imgView setImage:[UIImage imageNamed:@"search_like_head"]];
        objc_setAssociatedObject(self, _cmd, imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return imgView;
}
@end
