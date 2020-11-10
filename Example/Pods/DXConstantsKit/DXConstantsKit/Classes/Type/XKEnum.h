//
//  XKEnum.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/23.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKEnum_h
#define XKEnum_h

#define FMGameVersionLowerTip @"请更新至最新版本，才能进入此游戏间！"

//直播房间类型
typedef NS_ENUM(NSInteger, XKLiveRoomType) {
    XKLiveRoomType_Show     = 0,           //秀场
    XKLiveRoomType_Game     = 1,           //游戏
    XKLiveRoomType_Vedio    = 2,           //视频
};

//首页 内容样式
typedef NS_ENUM(NSInteger, XKHomeListType) {
    XKHomeListType_Hot          = 0,            //热门
    XKHomeListType_New          = 1,            //新人
    XKHomeListType_Normal       = 2,            //普通直播
    XKHomeListType_FlowerFee    = 3,            //充充充充直播
    XKHomeListType_Private      = 4,            //私人直播
    XKHomeListType_Follow       = 5,            //我的关注列表
};
typedef NS_ENUM(NSInteger, XKAnchorLiveState) {
    XKAnchorLiveState_Off   = 0,//0休息
    XKAnchorLiveState_On    = 1,//1直播
    XKAnchorLiveState_Ban   = 2,//2禁播
    
};
//直播类型 0普通 1pk大乱斗 2连麦
typedef NS_ENUM(NSInteger, XKAnchorStype) {
    XKAnchorStype_Normal      = 0,
    XKAnchorStype_Pk          = 1,
    XKAnchorStype_Mcrae       = 2,           
};

typedef NS_ENUM(NSInteger, XKGradientType) {
    XKGradientType_TopToBottom = 1,            //从上到下
    XKGradientType_LeftToRight,                //从做到右
    XKGradientType_LeftTopToRightBottom,       //从上到下
    XKGradientType_LeftBottomToRightTop        //从上到下
};

typedef NS_ENUM(NSInteger, XKRankingType) {
    XKRankingType_Starlight     = 0,  //星光榜
    XKRankingType_RickMan       = 1,  //土豪榜
    XKRankingType_Gif           = 2,  // 送礼榜
    XKRankingType_Guardian      = 3,  //守护榜
    XKRankingType_Live_Gift     = 100 // 直播间送礼榜
};

typedef NS_ENUM(NSInteger, XKBadgeRankingType) {
    XKBadgeRankingType_Common     = 0,  //玩家
    XKBadgeRankingType_Anchor       = 1,  //主播
    XKBadgeRankingType_Family           = 2,  //家族
};

typedef NS_ENUM(NSInteger, XKRankingListType) {
    XKRankingListType_CharmWeek        = 0,           //0魅力周榜
    XKRankingListType_RichWeek         = 1,            // 1土豪周榜
    XKRankingListType_CharmTotal       = 2,           //2魅力总榜
    XKRankingListType_RichTotal        = 3,            //3土豪总榜
    XKRankingListType_GuardianList     = 9,            //守护榜
    XKRankingListType_CharmDay         = 4,           //0魅力日榜
    XKRankingListType_RichDay          = 5,            // 1土豪日榜
    XKRankingListType_Gift             = 10,            // 1土豪日榜
    
    XKRankingListType_CharmMonth       = 6,            // 魅力(星光)月榜
    XKRankingListType_RichMonth        = 7,            // 土豪月榜

};
//游戏的种类
typedef NS_ENUM(NSInteger, XKGameType) {
    XKGameType_Niuniu    = 0,            //开心牛仔
    XKGameType_GoldFlower,               //智勇三张
    XKGameType_CatMouse,                 //猫鼠乱斗
    XKGameType_PirateCaptain,            //海盗船长
    XKGameType_Rotary,                   //转转乐
    XKGameType_Max,                      //
};
typedef NS_ENUM(NSInteger, XKLiveAccountType) {
    XKLiveAccountType_Anchor = 1,
    XKLiveAccountType_RoomManager = 2,
    XKLiveAccountType_Audience = 3,
    XKLiveAccountType_SuperManager = 4,
};
typedef NS_ENUM(NSInteger, XKGender) {
    XKGender_Boy = 0,
    XKGender_Girl
};
typedef NS_ENUM(NSUInteger, XKShareType) {
    XKShareType_WXFriend=0,    //微信好友
    XKShareType_WXZone,        //微信朋友圈
    XKShareType_WB,
    XKShareType_QQ,
    XKShareType_QQZone,
    KShareType_QrCode,           //二维码
    KShareType_QrCodeDownLoad    //二维码下载
};

// 任务积分领取状态
typedef NS_ENUM(NSUInteger, XKTaskPointState) {
    XKTaskPointState_NO,       // 未领取但是不可领取
    XKTaskPointState_YES,      // 未领取可领取
    XKTaskPointState_complete, // 已领取
};

// 任务类型
typedef NS_ENUM(NSUInteger, XKTaskType) {
    XKTaskType_punch        = 1,        // 打卡
    XKTaskType_watchLive    = 2,        // 看直播
    XKTaskType_sendGift     = 3         // 送礼
};
typedef NS_ENUM(NSInteger , ForbitLevelType) {
    ForbitLevelType_Forbit = 1,
    ForbitLevelType_CancelForbit = 2,
    ForbitLevelType_ForbitShort = 3,
    ForbitLevelType_ForbitLong = 4,
    ForbitLevelType_ForbitGlobal = 5,
    ForbitLevelType_ForbitForever = 6,
    
};
// 入场特效
typedef NS_ENUM(NSUInteger, XKEnterEffect) {
    XKEnterEffect_qilin,        // 包月守护 麒麟
    XKEnterEffect_che,          // 包季守护 车
    XKEnterEffect_feiting,      // 终身守护 飞艇
    XKEnterEffect_ceshi,
    XKEnterEffect_FaLaLi,       // 座驾商城 法拉利
    XKEnterEffect_MaiKaiLun,    // 座驾商城 迈凯伦
    XKEnterEffect_LaoSiLaiSi,   // 座驾商城 劳斯莱斯
    XKEnterEffect_LanBoJiNi,    // 座驾商城 兰博基尼
};

// 礼物类型
typedef NS_ENUM(NSInteger, TechnologyType) {
    TechnologyType_Lottie = 0,  // lottie
    TechnologyType_Game,     // 骨骼
    TechnologyType_Nornal,     // 普通
    TechnologyType_Svga     // svga
};
typedef NS_ENUM(NSInteger, XKMyProfitType)
{
    XKMyProfitType_Live     = 0,  //xing
    XKMyProfitType_Private  = 1,  //xin
    XKMyProfitType_OBO      = 2,
};
typedef NS_ENUM(NSInteger,XKRightDrawerType) {
    XKRightDrawerType_DefinitionDefault = 0,
    XKRightDrawerType_DefinitionHight,
    XKRightDrawerType_ToolTool,
    XKRightDrawerType_ToolTalk,
    XKRightDrawerType_ToolBarrage,
    XKRightDrawerType_ToolShare,
    XKRightDrawerType_ToolPan,        //大转盘
    XKRightDrawerType_ToolLipstick        //口红机
};
//0佳人, 1粉黛, 2蛾眉, 3玉人, 4璧人, 5佼人, 6丽人, 7伊人, 8玉女, 9淑女, 10尤物, 11娇娃, 12西施, 13青娥'
typedef NS_ENUM(NSInteger, XKPKLV) {
    PKLV1 = 0,
    PKLV2 = 1,
    PKLV3 = 2,
    PKLV4 = 3,
    PKLV5 = 4,
    PKLV6 = 5,
    PKLV7 = 6,
    PKLV8 = 7,
    PKLV9 = 8,
    PKLV10 = 9,
    PKLV11 = 10,
    PKLV12 = 11,
    PKLV13 = 12,
    PKLV14 = 13,
};

// 全服飘屏类型
typedef NS_ENUM(NSUInteger, XKTopMessageType) {
    XKTopMessageType_Horn = 5,       // 喊话
    XKTopMessageType_LuckDraw = 6,   // 转盘抽奖
    FXKTopMessageType_RedPacket = 7,  // 红包
    FXKTopMessageType_Level = 8,  // 等级
    FXKTopMessageType_lotteryPool = 9, // 彩池爆奖
    FXKTopMessageType_halloween = 10 // 万圣节
};

typedef NS_ENUM(NSUInteger, XKMediatorLinkType) {
    // 0不跳转 1内链 2外链
    XKMediatorLinkType_None = 0,
    XKMediatorLinkType_In   =1,
    XKMediatorLinkType_Out  =2,
    XKMediatorLinkType_Max  =10000
};
// pk 哪一方
typedef NS_ENUM(NSInteger,PkUserItemViewType) {
    PkUserItemViewTypeLeft = 1,
    PkUserItemViewTypeRight,
};
typedef NS_ENUM(NSInteger, XKMLoginType) {
    XKMLoginType_None     =   -1,     //未登录
    XKMLoginType_WeiBo    =   0,      //微博登录
    XKMLoginType_QQ,                  //QQ登录
    XKMLoginType_WeChat,              //微信登录
    XKMLoginType_AP,                  //支登录
    XKMLoginType_Mobile,              //手机号登录
};
typedef NS_ENUM(NSInteger, XKMarryState) {
    XKMarryState_No  = 0,            //未婚
    XKMarryState_Had,                //已婚
    XKMarryState_Unknown,            //未知
};


//首页 内容样式
typedef NS_ENUM(NSInteger, XKHallType) {
    XKHallType_Hot          = 0,            //热门
    XKHallType_New          = 1,            //新人
    XKHallType_Normal       = 2,            //普通直播
    XKHallType_FlowerFee       = 3,            //充充充充直播
    XKHallType_Private      = 4,            //私人直播
    XKHallType_Follow       = 5,            //我的关注列表
};
typedef NS_ENUM(NSInteger, XKHallLiveType) {
    XKHallLiveType_None          = 0,            //休息
    XKHallLiveType_Live          = 1,            //直播
};
typedef NS_ENUM(NSInteger, XKHallLiveStype) {
    XKHallLiveStype_Normal      = 0,            //直播类型 0普通 1pk大乱斗 2连麦
    XKHallLiveStype_Pk          = 1,            //pk
    XKHallLiveStype_Mcrae       = 2, //连麦
};
//排行榜

typedef NS_ENUM(NSInteger, XKRankListType) {
    XKRankListType_CharmWeek        = 0,           //0魅力周榜
    XKRankListType_RichWeek         = 1,            // 1土豪周榜
    XKRankListType_CharmTotal       = 2,           //2魅力总榜
    XKRankListType_RichTotal        = 3,            //3土豪总榜
    XKRankListType_GuardianList     = 9,            //守护榜
    XKRankListType_CharmDay         = 4,           //0魅力日榜
    XKRankListType_RichDay          = 5,            // 1土豪日榜
    XKRankListType_Gift             = 10,            // 1土豪日榜
    
    XKRankListType_CharmMonth       = 6,            // 魅力(星光)月榜
    XKRankListType_RichMonth        = 7,            // 土豪月榜

};

//0魅力周榜 1土豪周榜 2魅力总榜 3土豪总榜

//直播房间类型
typedef NS_ENUM(NSInteger, XKAnchorRoomType) {
    XKAnchorRoomType_Show     = 0,           //秀场
    XKAnchorRoomType_Game     = 1,           //游戏
    XKAnchorRoomType_Vedio    = 2,           //视频

};

typedef NS_ENUM(NSInteger, XKAnchorState) {
    XKAnchorState_off   = 0,//0休息
    XKAnchorState_on    = 1,//1直播
    XKAnchorState_ban   = 2,//2禁播
    
};

typedef NS_ENUM(NSInteger, XKBottomLineColorStyle){
    XKBottomLineColorStyleLight = 0,            //浅色[XK_FMColor XK_fmColor_Line1]
    XKBottomLineColorStyleDark,                 //深色[XK_FMColor XK_fmColor_Line2]
    XKBottomLineColorStyleWhite,
    XKBottomLineColorStyleBlack,   //0x999999
};

typedef NS_ENUM(NSUInteger, XKShareTargetType) {
    XKShareTargetTypeweChatFriend=0,    //微信好友
    XKShareTargetTypeweChatRound,       //微信朋友圈
    XKShareTargetTypeWeibo,
    XKShareTargetTypeQQ,
    XKShareTargetTypeQQZone,
    XKShareTargetTypeCopyURL,
};


typedef NS_ENUM(NSInteger, XKRankType)
{
    XKRankType_starlight     = 0,  //星光榜
    XKRankType_rickMan  = 1,  //土豪榜
    XKRankType_gif      = 2,  // 送礼榜
    XKRankType_guardian = 3,  //守护榜
    
    XKRankListType_Live_Gift        = 100,           // 直播间送礼榜
};



// 我的礼物
typedef NS_ENUM(NSUInteger, XKMyGiftType) {
    XKMyGiftType_receive, // 收礼
    XKMyGiftType_give,    // 送礼
};



typedef NS_ENUM(NSInteger, XKBeautyType) {
    XKBeautyTypeSkin,
    XKBeautyTypeShape,
    XKBeautyTypeFilter,
};


#endif /* XKEnum_h */
