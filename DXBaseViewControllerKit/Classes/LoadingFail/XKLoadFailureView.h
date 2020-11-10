//
//  XKLoadFailureView.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/28.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XKBaseColorButton.h"
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, XKLoadingState) {
    ///隐藏
    XKLoadingState_Hidden           = 0,

    ///加载中
   XKLoadingState_Loading,
    
    ///点击重试
    XKLoadingState_Retry,
    
    ///无数据
    XKLoadingState_NoResult,
    
    ///用户还没有收藏数据
    XKLoadingState_NoUserData,
    
    ///用户还没有收藏数据并需要动作
    XKLoadingState_NoUserDataAndAction,
    
    ///用户还没有粉丝数据
    XKLoadingState_NoFansDataAndAction,
};
@interface XKLoadFailureView : UIView
+ (instancetype)addToView:(UIView *)view;
+ (instancetype)addToView:(UIView *)view show:(BOOL)show;

/**
 *  @brief 修改状态
 */
@property(assign,nonatomic) XKLoadingState state;


/**
 *  @brief 同时修改文案和状态
 */
- (void)setTitle:(NSString *)title andState:(XKLoadingState)state;
- (void)setState:(XKLoadingState)state andTitle:(NSString*)title;


@property(copy, nonatomic) dispatch_block_t reloadBlock;

/**
 *  @brief  所有状态下 点击都重新设置为 loading 状态。
            默认为NO   只有 点击重试状态  才会去刷新
 */
@property(assign,nonatomic)BOOL allTapToReload;

@property(strong,nonatomic) UIImageView* imageView;
@property(strong,nonatomic) UILabel* titleLabel;
@property(strong,nonatomic) UIButton* button;
@property(nonatomic,strong) XKBaseColorButton *reloadButton;

- (void)showInView:(UIView *)view;

- (void)hiddenView;

- (void)setTitle:(NSString *)title forState:(XKLoadingState)state;
- (NSString*)titleForState:(XKLoadingState)state;

- (void)setImage:(UIImage *)image forState:(XKLoadingState)state;
- (UIImage *)imageForState:(XKLoadingState)state;

/**
 *  @brief title nil to hidden
 */
- (void)setButtonTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
