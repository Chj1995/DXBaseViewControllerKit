//
//  XKContants.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKContants_h
#define XKContants_h

#pragma mark - 字体大小
static const NSInteger kNavigationTitleFontSize = 18;

static const NSInteger kTabBarTitleFontSize = 11;

static const NSInteger kPageMaxLimit = 20;

static NSString * const kPhotoDefaultImageName = @"pic_default_image";
static NSString * const kNoDataImageName = @"no_data_icon";
static NSString * const kNavigationBackWhiteName = @"back_white";
static NSString * const kNavigationBackBlackName = @"back_black";

static NSString * const kWebRankListPath =  @"ms://leaderboard";  // 榜单排行榜 路由地址
static NSString * const kBadgeRouterPath =  @"jiutianapp://badge"; // 徽章
static NSString * const kMainRouterPath =  @"jiutianapp://index"; // 首页
static NSString * const kTaskRouterPath =  @"jiutianapp://taskcenter"; // 任务中心
static NSString * const kFamilySquareRouterPath =  @"jiutianapp://familysquare"; // 家族广场
static NSString * const kRechargeRouterPath =  @"jiutianapp://recharge"; // 充值
static NSString * const kLevelUpgradePath =  @"jiutianapp://levelupgrade"; // 等级升级
static NSString * const kBadgeObtainPath =  @"jiutianapp://badgeObtain"; // 获得徽章
static NSString * const kBadgeGradeUpPath =  @"jiutianapp://badgeGradeUp"; // 徽章升级
static NSString * const kAnchorLiveWatchInvitePath =  @"jiutianapp://anchorLiveWatchInvite"; // 开播提醒
static NSString * const kLoveLetterPath =  @"jiutianapp://getloveletter"; // 收到相思信

#define kGiftCodingCachPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"XiongKeGiftPackage.data"]

#define kGiftCachePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"XiongKeGiftPackage"]

#define kGiftTmpPath NSTemporaryDirectory()

#define K_WebView_RankList_path  @"ms://leaderboard"  // 榜单排行榜 路由地址

#define UserDefault [NSUserDefaults standardUserDefaults]
#define beautySkinSelect    @"beautySkinSelect"
#define beautyShapeSelect   @"beautyShapeSelect"
#define beautyFilterSelect  @"beautyFilterSelect"

#pragma mark -

#endif /* XKContants_h */
