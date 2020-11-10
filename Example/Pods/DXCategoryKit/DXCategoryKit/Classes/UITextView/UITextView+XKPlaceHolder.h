//
//  UITextView+XKPlaceHolder.h
//  XiongKe
//
//  Created by shaokailin on 2020/6/19.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (XKPlaceHolder)
- (void(^)(NSString *,UIColor * _Nullable))placeHolder;
@end

NS_ASSUME_NONNULL_END
