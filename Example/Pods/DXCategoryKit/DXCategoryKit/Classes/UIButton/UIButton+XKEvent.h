//
//  UIButton+XKEvent.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XKEvent)
/// 设置图文中间上下
- (void)verticalSpace:(CGFloat)space;
- (void)leftImageSpace:(CGFloat)space leftMargin:(CGFloat)leftMargin;
- (void)rightImageSpace:(CGFloat)space rightMargin:(CGFloat)rightMargin;

/**
 给角色为主播的头像添加标示

 @param anchorSize 标示图宽高
 */
- (void)setAnchorViewWithAnchorSize:(CGSize)anchorSize;


// 删除v标识图
- (void)removeAnchorImageView;
@end

NS_ASSUME_NONNULL_END
