//
//  EnlargeEdge.h
//  XiongKeLive
//
//  Created by XZH on 2016/12/21.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


/**
 设置Button的响应区域
 */
@interface UIButton (EnlargeEdge)
- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
