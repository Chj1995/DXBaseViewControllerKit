//
//  XKBaseViewControllerProtocol.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/27.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XKBaseViewControllerProtocol <NSObject>
@optional
//基本设置
- (void)baseSetting;
//设置界面
- (void)layoutMainView;
//刷新数据
- (void)refreshData;
//加载更多数据
- (void)loadMoreDatas;
//加载数据
- (void)loadDatas;
@end

NS_ASSUME_NONNULL_END
