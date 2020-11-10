//
//  XKBaseViewController.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKBaseViewController.h"
#import <Masonry/Masonry.h>
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXCategoryKit/DXCategoryKit.h>
#import "XKPulbicViewTool.h"
#import <DXGlobalConfigHttpManagerKit/XKGlobalConfigHttpManager.h>

#define KAPPConfig [XKGlobalConfigHttpManager shareInstance]
@interface XKBaseViewController ()

@end

@implementation XKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self noFullScreen];
}

- (void)showEmptyView:(BOOL)isShow {
    if (isShow) {
        [self.view bringSubviewToFront:self.emptyView];
        _emptyView.backgroundColor = [self.view backgroundColor];
        _emptyView.hidden = NO;
    } else {
        _emptyView.hidden = YES;
    }
}
- (void)showEmptyView:(BOOL)isShow andTableView:(UITableView *)tableView {
    if (isShow) {
        tableView.tableFooterView = self.emptyView;
        _emptyView.hidden = NO;
    } else {
        tableView.tableFooterView = nil;
        _emptyView.hidden = YES;
    }
}

- (void)addBackButton:(NSString *)image {
//    UIBarButtonItem *item = [[self class]initItemWithImage:image target:self action:@selector(backViewController)];
//    UIButton *button = (UIButton *)item.customView;
//    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    self.navigationItem.leftBarButtonItem = item;
}

- (void)addNavigaitonRightItemWithImage:(NSString *)image action:(SEL)action {
//    UIBarButtonItem *item = [[self class]initItemWithImage:image target:self action:action];
//    self.navigationItem.rightBarButtonItem = item;
}
- (void)addNavigaitonRightItemWithTitle:(NSString *)title action:(SEL)action {
//    UIBarButtonItem *item = [[self class]initItemWithTitle:title font:KNornalFont(16) color:XKColor.xk_color33 target:self action:action];
//    self.navigationItem.rightBarButtonItem = item;
}

- (void)addNavigaitonLeftItemWithTitle:(NSString *)title action:(SEL)action {
//    UIBarButtonItem *item = [[self class]initItemWithTitle:title font:KNornalFont(16) color:XKColor.xk_color33 target:self action:action];
//    self.navigationItem.leftBarButtonItem = item;
}
/**
 *  路由跳转
 */
- (void)routerEvent:(NSString *)url href:(NSString *)href linkType:(XKMediatorLinkType)linkType {
//    [[XKHandleMediator shareInstance] routerEvent:url href:href linkType:linkType];
}
#pragma mark - getter
- (XKLoadFailureView *)failureView {
    if (!_failureView) {
        _failureView = [XKLoadFailureView addToView:self.view show:NO];
        [self addFailureView:self.view];
    }
    return _failureView;
}
- (void)addFailureView:(UIView *)view {
    if (_failureView && _failureView.superview) {
        [_failureView removeFromSuperview];
    }
    [view addSubview:_failureView];
    [_failureView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
}
- (XKEmptyView *)emptyView{
    if (!_emptyView) {
        _emptyView = [[XKEmptyView alloc] initWithFrame:self.view.bounds];
        [_emptyView setHidden:YES];
        _emptyView.baseYPadding = 65;
        _emptyView.label.font = KNornalFont(16);
        _emptyView.label.textColor = XKColor.xk_color99;
    }
    
    return _emptyView;
}

- (CGFloat)viewContentHeight {
    return SCREEN_HEIGHT - [XKPulbicViewTool getStatusBarHeight] - self.navigationHeight;
}
- (CGFloat)navigationHeight {
    CGFloat height = CGRectGetHeight(self.navigationController.navigationBar.frame);
    return height == 0 ? 44:height;
}
- (CGFloat)tabbarHeight {
    return KAPPConfig.tabbarHeight;
}
- (CGFloat)tabbarHomeHeight {
    return [XKPulbicViewTool viewSafeBottom];
}

- (void)addCustomeNavigationView {
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.navigationHeight + XKPulbicViewTool.getStatusBarHeight)];
    self.customeNavigationView = navigationView;
    navigationView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navigationView];
    [self.view.superview bringSubviewToFront:navigationView];
    
    UILabel *navTitleLabel = [UILabel labelWithText:@"" textColor:[UIColor whiteColor] font:KMediumFont(18)];
    self.customNavTitleLabel = navTitleLabel;
    [navigationView addSubview:navTitleLabel];
    [navTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(navigationView);
        make.bottom.mas_offset(-12);
    }];
    
    XKMaxAreaButton *backBtn = [XKMaxAreaButton buttonWithType:UIButtonTypeCustom];
    self.customBackBtn = backBtn;
    [backBtn setImage:[UIImage imageNamed:@""] forState:0];
    [navigationView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.bottom.mas_offset(-12);
    }];
    
    XKMaxAreaButton *rightNavigationBtn = [XKMaxAreaButton buttonWithType:UIButtonTypeCustom];
    self.customRightNavigationBtn = rightNavigationBtn;
    [rightNavigationBtn setImage:[UIImage imageNamed:@""] forState:0];
    [navigationView addSubview:rightNavigationBtn];
    [rightNavigationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.bottom.mas_offset(-12);
    }];
}

- (void)addCustomeNavigationTitle:(NSString *)title {
    self.customNavTitleLabel.text = title;
}
- (void)addCustomeNavigationLeftBtnImageName:(NSString *)imgName action:(SEL)action {
    [self.customBackBtn setImage:[UIImage imageNamed:imgName] forState:0];
    [self.customBackBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}
- (void)addCustomeNavigationRightBtnImageName:(NSString *)imgName action:(SEL)action {
    [self.customRightNavigationBtn setImage:[UIImage imageNamed:imgName] forState:0];
    [self.customRightNavigationBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    DLog(@"%@:已经回收", NSStringFromClass([self class]));
}

@end
