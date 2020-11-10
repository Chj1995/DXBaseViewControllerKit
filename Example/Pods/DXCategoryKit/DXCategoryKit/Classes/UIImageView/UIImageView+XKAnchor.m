//
//  UIImageView+XKAnchor.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "UIImageView+XKAnchor.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>

@implementation UIImageView (XKAnchor)
/**
给角色为主播的头像添加标示

@param size 标示图宽高
*/
- (void)addAnchorIdentifierWithSize:(CGSize)size {
    [self.superview addSubview:self.anchorTagImgView];
    [self.anchorTagImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(size);
        make.left.equalTo(self.mas_right).offset(- size.width);
        make.top.equalTo(self.mas_bottom).offset(- size.height);
    }];
}
- (void)removeAnchorIdentifier {
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
