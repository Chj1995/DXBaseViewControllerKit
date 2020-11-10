//
//  UIImageView+XKAnchor.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (XKAnchor)
/**
给角色为主播的头像添加标示

@param size 标示图宽高
*/
- (void)addAnchorIdentifierWithSize:(CGSize)size;
- (void)removeAnchorIdentifier;
@end

NS_ASSUME_NONNULL_END
