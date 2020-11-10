//
//  XKNotifacionKey.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKNotifacionKey_h
#define XKNotifacionKey_h

//网络变更通知
static NSString * const KXKReachabilityChangedNotification = @"Reachability_Changed_Notification";
//登录背景替换
static NSString * const KXKLoginViewBackgroundImageChangeNotification = @"Login_View_Background_Change";
//版本通知更新
static NSString * const KXKVersionUpdateNotification = @"Version_Update_Notification";


static NSString * const KXKHomeTabChangeToHotNotification = @"Home_Tab_Change_ToHot";


//用户需要登录通知
static NSString * const KXKUserNeedToLoginNotification   =   @"User_Need_To_Login";
static NSString * const KXKUserLoginOutNotification = @"Login_Out_Notification";
static NSString * const KXKUserLoginSuccessNotification = @"User_Login_Success";
//用户信息更新
static NSString * const KXKUserInfoRefreshNotification = @"UserInfo_Need_Refresh";
//用户信息需要获取
static NSString * const KXKUserNeedGetInfoNotification = @"User_Need_Get_Info";
//关注修改通知
static NSString * const KXKAttentionChangeNotification = @"Attention_Change_Notification";
// 通知关注刷新
static NSString *const KXKAttentionNeedRequestNotication = @"Attention_Need_Request_Notication";

// 分享通知
static NSString * const KXKShareNotificattion = @"Share_Push";
static NSString * const KXKShareHiddenViewNotificattion = @"Share_Hidden_View";
// 显示签到通知
static NSString * const KXKShowSignViewNotificattion = @"Show_SignView";
static NSString * const KXKCloseSignViewNotificattion = @"Close_SignView";

//首页数据更新
static NSString * const KXKHomeHotListRefreshNotification = @"Home_Hot_List_Refresh_Notification";

// Live
//隐藏最小化视图
static NSString * const KXKLiveClickFloatDismissNotification = @"Live_Click_Float_Dismiss_Notification";
static NSString * const KXKLiveClickFloatShowNotification = @"Live_Click_Float_Show_Notification";
static NSString * const KXKLiveClickFloatPauseNotification = @"Live_Click_Float_tPause_Notification";
static NSString * const KXKLiveClickFloatResumeNotification = @"Live_Click_Float_tResume_Notification";
static NSString * const KXKLiveClickFloatCloseNotification = @"Live_Click_Float_close_Notification";
// 排行榜
static NSString * const KXKHomeRankGiftNotification = @"Home_Rank_Gift_Notification";


// web
static NSString * const KXKPushDiamondNotification = @"Push_Diamond_Notification";
static NSString * const KXKPushRotaryDiamondNotification = @"KXKPushRotaryDiamondNotification"; // 针对大转盘钻石不足

//关注推送
static NSString * const KXKChangeUserToRefreshDynamicNotification = @"ChangeUserToRefreshDynamic_Notification";
//发现数据刷新
static NSString * const KXKSqareDynamicRefreshNotification = @"SqareDynamicRefreshNotification";

//发布动态后刷新数据
static NSString * const KXKSqareRefreshOfDyminicAddNotification = @"SqareRefreshOfDyminicAddNotification";

//车购买通知
static NSString * const KXKCarBuyNotification = @"CarBuyNotification";

//
static NSString * const KXKFolloWNeedRequestNotification = @"FolloWNeedRequestNotification";

static NSString * const KXKDownloadGiftPackageProgressNotification = @"DownloadGiftPackageProgressNotification";
//通知有完成的任务未领取奖励
static NSString * const KXKHaveDoneTaskNotification = @"HaveDoneTaskNotification";

static NSString * const KXKHostLiveDropOneMinuteNotification = @"HostLiveDropOneMinuteNotification";

static NSString * const KXKAudiencePlayIngNotification = @"AudiencePlayIngNotification";

static NSString * const KXKOnlineUserClickCloseNofitication = @"OnlineUserClickCloseNofitication";
static NSString * const KXKTellPeopleNotification = @"TellPeopleNotification";

static NSString * const KXKShowNoRedPacketNotification = @"ShowNoRedPacketNotification";
static NSString * const KXKHideGuardAnimateRedPacketNotification = @"HideGuardAnimateRedPacketNotification";

static NSString * const KXKWishHelpSendGiftNotification = @"WishHelpSendGiftNotification";

static NSString * const KXKDownloadNewGiftNotification = @"DownloadNewGiftNotification";

static NSString * const KXKEndLiveCloseGuardRankNotification = @"EndLiveCloseGuardRankNotification";

static NSString * const KXKMusicCloseNotification = @"MusicCloseNotification";
static NSString * const KXKMusicParseNotification = @"MusicParseNotification";
static NSString * const KXKMusicContinueNotification = @"MusicContinueNotification";

static NSString * const KXKEndLiveCloseOnLineUserViewNotification = @"EndLiveCloseOnLineUserView";

static NSString * const KXKUserRefreshAttentionNotification = @"UserRefreshAttentionNotification";

static NSString * const KXKLiveViewClickChangeCameraNotification = @"LiveViewClickChangeCameraNotification";
static NSString * const KXKLiveAnchorConfigureMeiYanOpenNotification = @"LiveAnchorConfigureMeiYanOpenNotification";
static NSString * const KXKLiveAnchorConfigureMeiYanCloseNotification = @"LiveAnchorConfigureMeiYanCloseNotification";
//static NSString * const KXKLiveAnchorConfigureMeiYanCloseNotification = @"LiveAnchorConfigureMeiYanCloseNotification";

static NSString * const KXKUpdateGiftBoxNotification = @"UpdateGiftBoxNotification";

static NSString * const KXKGiftButtonAddProcessViewNotification = @"GiftButtonAddProcessViewNotification";

static NSString * const KXKEndLiveCloseTopCircleViewNotification = @"EndLiveCloseTopCircleViewNotification";

static NSString * const KXKPKSocketHandlerCompleteNotification = @"PKSocketHandlerCompleteNotification";

static NSString * const KXKPKProressHengViewRelativeBoundsFrameNotification = @"PKProressHengViewRelativeBoundsFrameNotification";


static NSString * const KXKCloseMusicNotification = @"CloseMusicNotification";
static NSString * const KXKPauseMusicNotification = @"PauseMusicNotification";
static NSString * const KXKOpenMusicNotification = @"OpenMusicNotification";

static NSString * const KXKLiveViewHostHadLeftNotification = @"LiveViewHostHadLeftNotification";

static NSString * const KXKLiveViewHostKickingNotification = @"LiveViewHostKickingNotification";
static NSString * const KXKLiveViewHostAnchorKickingNotification = @"LiveViewHostAnchorKickingNotification";
static NSString * const KXKAudiencePlayIngSwitchStreamNotification = @"AudiencePlayIngSwitchStreamNotification";

static NSString * const KXKGameRoomNeedShowGiftViewGuideNotification = @"GameRoomNeedShowGiftViewGuideNotification";

static NSString * const KXKLiveViewClickFloatCloseNotification = @"LiveViewClickFloatCloseNotification";

static NSString * const KXKLiveViewClickFloatShowNotification = @"LiveViewClickFloatShowNotification";

static NSString * const KXKAnchorOnLinePushNotification = @"AnchorOnLinePushNotification";

static NSString * const KXKPersonTabBarRedPointNotification = @"PersonTabBarRedPointNotification";

static NSString * const KXKHostCreateLiveNotification = @"HostCreateLiveNotification";

static NSString * const FMLiveViewClickChatNicknameNotification = @"FMLiveViewClickChatNicknameNotification";
static NSString * const FMLiveViewClickLevelWearUserTitleNotification = @"FMLiveViewClickLevelWearUserTitleNotification";//提升等级，佩戴称号

static NSString * const KXKClarmRefreshNotification = @"KXKClarmRefreshNotification"; // 直播间送礼榜刷新
static NSString * const KXFamilyDetailVCEndRefreshNotification = @"Family_DetailVC_EndRefresh"; //家族详情结束刷新
static NSString * const KXFamilyMemberRefreshNotification = @"Family_UserInfo_NeedRefresh"; //家族成员列表更新
static NSString * const KXFamilyDelectMemberRefreshNotification = @"FamilyDelectMemberRefreshNotification"; //家族成员列表更新
static NSString * const KXFamilyJoinRefreshNotification = @"FamilyJoinRefreshNotification"; //家族成员列表更新

static NSString * const KXkBadgeLevelUpgradeNotification = @"KXkBadgeLevelUpgradeNotification"; // 用户等级升级通知
static NSString * const KXkBadgeObtainOrGradeUpNotification = @"KXkBadgeObtainOrGradeUpNotification"; // 获得徽章通知/徽章等级升级通知
static NSString * const KXkAnchorLiveWatchInviteNotification = @"KXkAnchorLiveWatchInviteNotification"; // 开播提醒通知
static NSString * const KXkAnchorLiveWatchInviteClickNotification = @"KXkAnchorLiveWatchInviteClickNotification"; // 从通知栏点击开播通知
static NSString * const KXkGetLoveLetterParamsNotification = @"KXkGetLoveLetterParamsNotification"; // 相思信通知(从通知进来带参数)
static NSString * const KXkGetLoveLetterNotification = @"KXkGetLoveLetterNotification"; // 相思信通知

static NSString * const KXkCustomerserviceNotification = @"CustomerserviceNotification"; // 联系客服通知
static NSString * const KXkGetExperienceNotification = @"GetExperienceNotification"; // 获取经验的通知
static NSString * const KXkUpdateExperienceNotification = @"UpdateExperienceNotification "; // 用户经验条-更新
static NSString * const KXkUpdateToolListNotification = @"KXkUpdateToolListNotification "; // 道具礼物-更新
static NSString * const KXkUpdateBarrageCountNotification = @"KXkUpdateBarrageCountNotification "; // 弹幕数-更新

static NSString * const KXkGotoSquareNotification = @"KXkGotoSquareNotification"; // 跳到发现页的广场选项
//商城
static NSString * const KXkGetShopDetailNotification = @"KXkGetShopDetailNotification"; // 显示商城物品详情接口
static NSString * const KXkShopBuyToOtherNotification = @"KXkShopBuyToOtherNotification"; // 赠送商城道具
static NSString * const KXkShopBuyNotification = @"KXkShopBuyNotification"; // 购买商城道具

//我的背包
static NSString * const KXkUserItemChangeNicknameNotification = @"KXkUserItemChangeNicknameNotification"; // 修改昵称
static NSString * const KXkUserItemUseNotification = @"KXkUserItemUseNotification"; // 使用道具
static NSString * const KXkUserItemUseForFragmentsNotification = @"KXkUserItemUseForFragmentsNotification"; // 合成碎片成功
static NSString * const KXkGoToDressUpVCNotification = @"KXkGoToDressUpVCNotification"; // 前往我的装扮
static NSString * const KXKUpdateGiftStoageNotification = @"KXKUpdateGiftStoageNotification"; // 刷新礼物背包

#endif /* XKNotifacionKey_h */
