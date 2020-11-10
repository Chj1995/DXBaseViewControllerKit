//
//  XKRefreshPointView.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface XKRefreshPointAnimationView : UIView

@end
@interface XKRefreshPointView : UIView
@property (nonatomic, assign)CGFloat distance;
@property (nonatomic, assign)BOOL isRefreshing;
@property (nonatomic, assign)BOOL isShowTitle;
@property (nonatomic, strong) UIColor *titleTextColor;
@end

NS_ASSUME_NONNULL_END
