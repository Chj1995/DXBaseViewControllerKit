//
//  ServiceApi.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/25.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef ServiceApi_h
#define ServiceApi_h

//全局配置
static NSString * const kConfigServiceAPI = @"config/initialize";
//上传设备信息
static NSString * const kDeviceInfoAPI = @"config/add";
//版本更新
static NSString * const kVersionInfoAPI = @"config/getversionupdate";
//直播分享地址
static NSString * const kLiveShareUrlAPI = @"anchor/getShareAnchorUrl";
//公共详情
static NSString * const kNoticeInfoAPI = @"pop/detail";

//打卡
static NSString * const kSignInfoAPI = @"signin/getSignInfo";
static NSString * const kSignActionAPI = @"signin/signIn";

//首页
//榜单列表
static NSString * const kRankListnAPI = @"top/getlist";
//首页列表接口
static NSString * const kHomeListActionAPI = @"square/getindex";
//首页分享banner
static NSString * const kHomeShareBannerAPI = @"share/getbannerinfo";
//首页关注列表
static NSString * const kAttentionAnchorListAPI = @"square/getAnchorListByStarlight";
static NSString * const kAttentionMayLikeAnchorAPI = @"square/getAnchorListByPostTime";
//礼物列表
static NSString * const kRankGiftListnAPI = @"top/getgiftlist";


//static NSString * const kSignActionAPI = @"";
//用户信息
static NSString * const kUserInfoAPI = @"user/getuserinfo";
static NSString * const kSendInviteCodeAPI = @"user/invitecode";
static NSString * const kGetCodeAPI = @"oauth2/common/loginService/getValidate";
static NSString * const kUserLoginAPI = @"oauth2/common/loginService/login";
static NSString * const kThirdLoginAPI = @"oauth2/common/loginService/login";
static NSString * const kUserBindListAPI = @"user/bindlist";
static NSString * const kUserBindAPI = @"user/bind";
static NSString * const kUserUpdateAPI = @"user/update";
static NSString * const kUserUpdateRealAPI = @"user/updatereal";
static NSString * const kUserBindCodeAPI = @"oauth2/common/loginService/getBindCode";
static NSString * const kShareInviteAPI = @"share/getinvite";
static NSString * const kUserInviteAPI = @"user/getinvite";
static NSString * const kChechCodeAPI = @"oauth2/common/loginService/checkBindCode";
static NSString * const kUnbingCodeAPI = @"user/getCodeByUnBind";
static NSString * const kReplaceUnbingCodeAPI = @"user/checkUnBindCode";

//关注
//给的推荐
static NSString * const kSearchHotForMeAPI = @"square/getAnchorListByPostTime";
static NSString * const kAttentionActionAPI = @"user/attention";
//我的关注列表
static NSString * const kAttentionListAPI = @"user/getattentionlist";

//直播
//创建直播
static NSString * const kCreateAnchorAPI = @"anchor/create";
static NSString * const kAnchorAutoInfoAPI = @"anchor/applyinfo";
static NSString * const kCheckAnchorAutoAPI = @"post/checkRealName";
static NSString * const kAnchorFeeLimitAPI = @"anchor/getfeelimit";
static NSString * const kGetAnchorSecretAPI = @"anchor/getmysecret";
//巡警
static NSString * const KXKRoomBlockedUserAPI = @"user/control/blocked";//封号
static NSString * const KXKRoomCloseRoomUserAPI = @"user/control/closeRoom";//关闭直播
static NSString * const KXKRoomWarningUserAPI = @"user/control/warning";//警告用户/主播
//主播
static NSString * const KXKRoomForbidUserAPI = @"user/forbiduser";
static NSString * const KXKRoomBlackUserAPI = @"user/black";
static NSString * const KXKRoomUserGiftListAPI = @"gift/getlist";
static NSString * const KXKRoomUserIsAbleSendGiftAPI = @"gift/isAbleSendGift";
static NSString * const kAnchorCountInviteLiveWatchAPI = @"anchor/countInviteLiveWatch";//查询剩余邀请次数
static NSString * const kAnchorInviteLiveWatchAPI = @"anchor/inviteLiveWatch";//开播提醒
static NSString * const kGetInviteLiveWatchAPI = @"anchor/getInviteLiveWatch";//开播提醒-查询邀请信息
static NSString * const KXKRoomSendGiftAPI = @"gift/common/gift/send";
static NSString * const KXKRoomGiftBatterAPI = @"gift/common/gift/batter"; // 连击
static NSString * const KXKRoomGiftListAPI = @"gift/getGiftPackage";
static NSString * const KXKAnchorCardInoAPI = @"user/getanchordetail";
static NSString * const KXKAudienceDetailAPI = @"user/getuserdetail";
static NSString * const KXKRoomReportAPI = @"oauth2/common/complainService/complain";
static NSString * const KXKRoomSetControlAPI = @"user/setcontrol";

static NSString * const KXKRoomAdminAPI = @"user/setadmin";
static NSString * const KXKRoomSafeListAPI = @"top/getnewguardlist";
static NSString * const KXKRoomLineUserListAPI = @"user/getonlineuserlist";
static NSString * const KXKRoomActivityListAPI = @"anchor/getActivityList";
static NSString * const KXKRoomChangeTitleAPI = @"anchor/updateTitle";
static NSString * const KXKRoomNewTitleAPI = @"anchor/getAnchorInfo";
static NSString * const KXKRoomRedPacketDetailAPI = @"anchor/getAnchorRedPacketDetail";
static NSString * const KXKRoomUserRedListAPI = @"anchor/getPrizeRecord";
static NSString * const KXKRoomClickRedAPI = @"redpackage/rob";
static NSString * const KXKRoomInfoAPI = @"anchor/getdetail";
static NSString * const KXKSquareList1API = @"square/getall";
static NSString * const KGiftSendAPI = @"gift/send";
static NSString * const KXKShareCallbackAPI = @"share/callback";
static NSString * const KXKSecretRoomShareInfoAPI = @"anchor/getshareinfo";
static NSString * const KXKShouHuListAPI = @"top/getguardlist";
static NSString * const KXKPKListAPI = @"square/getpklist";
static NSString * const KXKPKTimeAPI = @"anchor/pktimeList";
static NSString * const KXKPKResultAPI = @"pk/getresult";

static NSString * const KXKAddWishAPI = @"wishingwell/addWishingWell";
static NSString * const KXKGetWishListAPI = @"wishingwell/getWishingWellListByFuuid";
static NSString * const KXKDelWishListAPI = @"wishingwell/delWishingWellById";
static NSString * const KXKResetWishListAPI = @"wishingwell/resetWishingWell";

//// 搜索
//NSString * const kSeekNewMainAPI = @"v251/getsearch";
//NSString * const kSeekNewKeyworkAPI = @"v251/searchdetail";
//NSString * const kSeekNewMoreUserAPI = @"v251/searchuser";
//NSString * const kSeekNewMoreAnchorAPI = @"v251/searchanchor";

// 发现
static NSString * const KXKSquareListAPI = @"post/getlist";//社区列表
static NSString * const KXKSquareDetailAPI = @"post/getdetail";
static NSString * const KXKDeleteSquareAPI = @"post/delPost";
static NSString * const KXKZanSquareAPI = @"post/zan";
static NSString * const KXKShareSquareAPI = @"post/share";
static NSString * const KXKCommentSquareAPI = @"post/comment";
static NSString * const KXKAttenSquareAPI = @"square/getPostByAttention";
static NSString * const KXKSquareUserListAPI = @"post/getlistwithuser";
static NSString * const KXKDeleteCommentAPI = @"post/deletecomment";
static NSString * const KXKPostLifeAPI = @"square/sendHost";
static NSString * const KXKCommentListAPI = @"post/getcomment";

//家族
static NSString * const KXKFamilySquareAPI = @"family/common/family/familysquare";//家族baner（刚进来那一层）
static NSString * const KXKFamilyTopAPI = @"family/common/family/familytop";//家族荣耀值排行榜单 周榜、最新
static NSString * const KXKMyFamilyAPI = @"family/common/family/myfamily"; // 我的家族信息
static NSString * const KXKDailyTaskListAPI = @"family/common/familyDailyTask/getDailyTaskList"; // 查询家族每日任务列表
static NSString * const KXKCompleteDailyTaskAPI = @"family/common/familyDailyTask/completeDailyTask"; // 领取家族“每日任务”
static NSString * const KXKFamilyApplyAPI = @"family/common/familyApp/apply"; // 申请加入家族
static NSString * const KXKFamilydetailAPI = @"family/common/family/familydetail"; // 我的家族页面--家族排名和家族贡献值排名
static NSString * const KXKFamilyMemberAPI = @"family/common/family/familymember";//家族成员
static NSString * const KXKFamilyGetUserAPI = @"family/common/familyMemService/getUser2"; //邀请成员列表
static NSString * const KXKFamilyInviteMemberAPI = @"family/common/familyMemService/inviteMember2"; //发起邀请
static NSString * const KXKFamilyQuitAPI = @"family/common/familyApp/secede"; //用户主动退出家族
static NSString * const KXKFamilyAdministratorAPI = @"family/common/familyMemService/familyAdministrator"; //配置管理员
static NSString * const KXKFamilyHotAnchorAPI = @"family/common/familyApp/hotAnchor"; //设为热门主播
static NSString * const KXKFamilykickAPI = @"family/common/familyApp/kick"; //将用户踢出家族
static NSString * const KXKFamilyGetDynamicListAPI = @"family/common/familyApp/getDynamicList"; //获取家族内动态圈
static NSString * const KXKFamilyJinyanAPI = @"imfamily/common/shutup/jinyan"; //禁言
static NSString * const KXKFamilyJinyanStatusAPI = @"imfamily/common/shutup/status"; //禁言状态


//我的消息
static NSString * const KXKTotalInviteMessageAPI = @"family/common/familyMemService/totalInviteMessage";//我的消息-邀请消息(一级界面)
static NSString * const KXKMyMessageAPI = @"family/common/familyMemService/myMessage";//我的消息(二级消息界面)
static NSString * const KXKSecondReadAPI = @"family/common/familyMemService/secondRead";//二级界面已读接口
static NSString * const KXKLevelThreeMessageAPI = @"family/common/familyMemService/levelThreeMessage";//我的消息(三级消息界面)
static NSString * const KXKMyHaveReadMessageAPI = @"family/common/familyMemService/myHaveReadMessage";//全部已读
static NSString * const KXKSecondDelAPI = @"family/common/familyMemService/secondDel";//单个删除
static NSString * const KXKMyDelMessageAPI = @"family/common/familyMemService/myDelMessage";//全部删除
static NSString * const KXKMyIgnoreMessageAPI = @"family/common/familyMemService/myIgnoreMessage2";//忽略
static NSString * const KXKMyAcceptInviteAPI = @"family/common/familyMemService/myAcceptInvite2";//接受邀请

static NSString * const kIMConversationHistory = @"imhistory/common/mghistory/getHistoryMessage";//拉取历史消息
static NSString * const kIMConversationDeleteTalkingMessage = @"imhistory/common/messageService/deleteTalkingMessage";//根据聊天对象和偏移量删除聊天列表
static NSString * const kIMConversationDeleteTalkingMessages = @"imhistory/common/messageService/deleteTalkingMessages";//批量删除聊天列表
static NSString * const kAllIMConversationUser = @"imfamily/common/familymember/getAll";//（群聊）群聊家族全部成员

//任务
static NSString * const KXKTaskListAPI = @"user/getIntegral";

static NSString * const KXKTaskFinishAPI = @"user/finshTask";
static NSString * const KXKTaskDetailAPI = @"user/getUserIntegralDetail";

//shop
static NSString * const KXKShopHomeAPI = @"shop/getShopIndex";
static NSString * const KXKShopBuyAPI = @"shop/buy";
static NSString * const KXKShopCheckIsBuyAPI = @"shop/checkIsBuy";
static NSString * const KUserInfoWithFuuid  = @"user/getUserByFuid"; // 根据房间号获取用户信息

//ipa
static NSString * const kAppleCreateOrderAPI = @"createPay";
static NSString * const kApplePayCallbackAPI = @"appPayNotify";

static NSString * const KShopOrderAppleFowerAPI = @"pay/common/vehicleOrder/vehiclePay";  //苹果花座驾
static NSString * const KShopOrderAppleCallbackAPI = @"pay/common/appleOrder/vehicleApplePayNotify";

static NSString * const KAccountChangeList = @"getChangeList"; // 我的账户虫套餐接口息

//我的背包
static NSString * const KMyPackageListAPI = @"user/getMyPackage";
static NSString * const KChangeBagCarAPI = @"user/changeIsUse";
static NSString * const KUserUpdatePicAPI = @"user/updatepic";
//mycount
static NSString * const kProfitsSwitch = @"account/getprofitswitch";

static NSString * const kGetRewardAPI = @"task/receivereward";

static NSString * const kGetDayRewardAPI = @"dayreward/receive";
static NSString * const kDayTaskListAPI = @"task/getlist";

// 徽章
static NSString * const kBadgeAchievementPointAPI = @"common/achievement/point";
static NSString * const kBadgeListAPI = @"common/badge/list";
static NSString * const kBadgeDetailAPI = @"common/badge/detail";
static NSString * const kBadgeLightUpAPI = @"common/badge/lightUp";
static NSString * const kBadgeLeaderBoardAPI = @"common/achievement/leaderBoard";
static NSString * const kBadgeCardAPI = @"common/badgeOther/badgeCard";

static NSString * const kBadgeCommentListAPI = @"common/badgeComment/list";
static NSString * const kBadgeCommentChildrenAPI = @"common/badgeComment/children";
static NSString * const kBadgeCommentPublishAPI = @"common/badgeComment/publish";
static NSString * const kBadgeCommentLikeAPI = @"common/badgeComment/like";
static NSString * const kBadgeCommentUnLikeAPI = @"common/badgeComment/unlike";

static NSString * const kBadgeBarrageListAPI = @"common/badgeBarrage/list";
static NSString * const kBadgeBarragePublishAPI = @"common/badgeBarrage/publish";

// 等级特权
static NSString * const kGradePrivilegeListAPI = @"common/businessService/getLevelPrivilegeInfoList";
static NSString * const kGradePrivilegeDetailAPI = @"common/businessService/getLevelPrivilegeInfoById";
static NSString * const kShareSuccessAPI = @"common/businessService/shareSuccess";
//称号
static NSString * const kUserTitleListAPI = @"family/common/titleApp/getTitleList";//称号列表
static NSString * const kUserTitleDetailsAPI = @"family/common/titleApp/getTitleDetails";//称号详情
static NSString * const kUserTitleWearTitleAPI = @"family/common/titleApp/wearTitle";//称号佩戴
static NSString * const kUserTitleZanTitleAPI = @"family/common/titleApp/zan";//称号点赞
static NSString * const kUserTitlePriceListAPI = @"family/common/familyUserTitle/getusertitle";//续费价格列表
static NSString * const kUserTitleGoodsRenewalAPI = @"family/common/familyUserTitle/goodsRenewal";//续费
static NSString * const kUserTitleTopListAPI = @"family/common/titleApp/titleTop";//称号排行榜

// 暴奖彩池
static NSString * const kLotteryOpenBoxAPI = @"consumer/common/explodelottery/openBox";//开宝箱
static NSString * const kLotteryCloseBoxAPI = @"consumer/common/explodelottery/closeBox";//关宝箱

// 花好月圆
static NSString * const kLotteryFestivalOpenBoxAPI = @"consumer/common/midautumn/lottery";//开宝箱

// 相思信
static NSString * const kLoveLetterGetNoReadLetterAPI = @"consumer/common/midautumn/getNoReadLetter"; //获取未读相思信接口
static NSString * const kLoveLetterReadLetterAPI = @"consumer/common/midautumn/isRead"; //设置相思信已读状态

// 商城
static NSString * const kGetShopHomeAPI = @"shop/common/shop/getShopHome"; // 商城首页
static NSString * const kGetShopDetailAPI = @"shop/common/shop/getShopDetail"; // 详情
static NSString * const kShopBuyAPI = @"shop/common/shop/buy"; // 购买商城道具
static NSString * const kUserPackageItemAPI = @"shop/common/userPackage/item"; // 直播间外背包
static NSString * const kUserPackageInnerItemAPI = @"shop/common/userPackage/innerItem"; // 直播间内背包
static NSString * const kUserPackageChangeNicknameAPI = @"shop/common/userItem/changeNickname"; // 道具卡-更改昵称
static NSString * const kUserPackageUseItemAPI = @"shop/common/userItem/use"; // 道具卡-使用道具
static NSString * const kUserPackageReceiveGiftAPI = @"shop/common/userPackage/receiveGift"; // 领取背包礼物
static NSString * const kUserPackageGetGiftListAPI = @"shop/common/userPackage/getGiftList"; // 背包-我的礼物

//装扮
static NSString * const kDressListAPI = @"shop/common/dress/dressList"; // 装扮列表
static NSString * const kDressActionAPI = @"shop/common/dress/dress"; // 佩戴接口

// 万圣节
static NSString * const kHalloweenGetActivityProgressAPI = @"consumer/common/halloween/getActivityProgress"; // 获取万圣节活动进度
static NSString * const kHalloweenCanGetBoxAPI = @"consumer/common/halloween/getBox"; // 万圣节活动领取宝箱

// 爆奖彩池活动开关
static NSString * const kAnchorexplodeAPI = @"consumer/common/explodelottery/anchorexplode"; // 获取主播直播的爆奖状态
static NSString * const kExplodeswitchAPI = @"consumer/common/explodelottery/explodeswitch"; // app在直播间内开启或关闭爆奖开关

#endif /* ServiceApi_h */
