//
//  XKBaseViewController.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXConstantsKit/XKMaxAreaButton.h>
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "XKBaseViewControllerProtocol.h"
#import "XKLoadFailureView.h"
#import "XKEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface XKBaseViewController : UIViewController<XKBaseViewControllerProtocol>
@property (assign, nonatomic, readonly) CGFloat tabbarHeight;

@property (assign, nonatomic, readonly) CGFloat tabbarHomeHeight;

@property (assign, nonatomic, readonly) CGFloat navigationHeight;

@property (assign, nonatomic, readonly) CGFloat viewContentHeight;
//网络加载
@property (strong, nonatomic) XKLoadFailureView* failureView;
- (void)addFailureView:(UIView *)view;
#pragma mark - 空页面相关
@property (strong, nonatomic) XKEmptyView *emptyView;//空页面

@property (strong, nonatomic) UIView *customeNavigationView;
@property (strong, nonatomic) UILabel *customNavTitleLabel;
@property (strong, nonatomic) XKMaxAreaButton *customBackBtn;
@property (strong, nonatomic) XKMaxAreaButton *customRightNavigationBtn;
/**
 *  显示空页面 放置在self.view 上
 *
 *  @param isShow 是否显示
 */
- (void)showEmptyView:(BOOL)isShow;
/**
 *  显示空页面 放置在tableFooterView 上
 *
 *  @param isShow    是否显示
 *  @param tableView 相关联的Tableview，
 */
- (void)showEmptyView:(BOOL)isShow andTableView:(UITableView *)tableView;


//添加返回按钮事件
- (void)addBackButton:(NSString *)image;

/// 添加右边导航栏
/// @param image 图片
- (void)addNavigaitonRightItemWithImage:(NSString *)image action:(SEL)action;
- (void)addNavigaitonRightItemWithTitle:(NSString *)title action:(SEL)action;
- (void)addNavigaitonLeftItemWithTitle:(NSString *)title action:(SEL)action;

/**
 *  路由跳转
 *
 */
- (void)routerEvent:(NSString *)url href:(nullable NSString *)href linkType:(XKMediatorLinkType)linkType;

// 自定义navigationView
- (void)addCustomeNavigationView;
- (void)addCustomeNavigationTitle:(NSString *)title;
- (void)addCustomeNavigationLeftBtnImageName:(NSString *)imgName action:(SEL)action;
- (void)addCustomeNavigationRightBtnImageName:(NSString *)imgName action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
