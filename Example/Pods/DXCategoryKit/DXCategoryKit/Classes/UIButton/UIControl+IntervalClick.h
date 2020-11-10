//
//  UIControl.h
//  XiongKeLive
//
//  Created by XZH on 2016/12/21.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (IntervalClick)
@property (nonatomic, assign) NSTimeInterval py_eventInterval;   //重复点击加间隔
@end
