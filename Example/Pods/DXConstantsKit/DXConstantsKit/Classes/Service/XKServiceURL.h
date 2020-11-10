//
//  FMServiceURL.h
//  XiongKeLive
//
//  Created by chw on 16/6/6.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKServiceURL_h
#define XKServiceURL_h



//home部分域名
#define Home_URL_Prefix(x)      [XKDomainIPManager getHomeModuleUrl:x]

//gift部分域名
#define Gift_URL_Prefix(x)      [XKDomainIPManager getGiftModuleUrl:x]

//社区部分域名
#define Community_URL_Prefix(x) [XKDomainIPManager getCommunityModuleUrl:x]

//用户部分域名
#define User_URL_Prefix(x)      [XKDomainIPManager getUserModuleUrl:x]

//订单部分域名
#define Order_URL_Prefix(x)    [XKDomainIPManager getOrderModuleUrl:x]


//分享部分域名

#define Share_URL_Prefix(x)    [XKDomainIPManager getShareModuleUrl:x]


#define Api_URL_Prefix(x)      [XKDomainIPManager getApiModuleUrl:x]




/********************************* 首页 ***********************************/

#define XK_URL_HOME_SQUARE_TOP_GETGUARD_LIST    Home_URL_Prefix(@"top/getguardlist")          //守护榜单	榜单
#define XK_URL_Live_GetPk_LIST                  Home_URL_Prefix(@"square/getpklist")          //守护榜单    榜单



/********************************* 我的 ***********************************/
#define XK_URL_USER_GETPROFITSWITCH             User_URL_Prefix(@"account/getprofitswitch")


#define XK_URL_USER_QUICK_LOGIN                 Api_URL_Prefix(@"oauth2/common/loginService/login")                 //一键登录
#define XK_URL_USER_GET_USER_INFO               User_URL_Prefix(@"user/getuserinfo")                //获取我的信息
#define XK_URL_USER_UPDATE_USER_INFO            User_URL_Prefix(@"user/update")                     //修改用户信息
#define XK_URL_USER_BIND                        User_URL_Prefix(@"user/bind")                       //绑定账号

#define XK_URL_USER_GET_PHONE                   Api_URL_Prefix(@"oauth2/common/loginService/getPhone")                   // 获取手机号
#define XK_URL_USER_BIND_PHONE                  User_URL_Prefix(@"user/bindPhone")                   // 绑定手机号



//消息
#define XK_URL_MESSAGE_GET_LIST                 Home_URL_Prefix(@"push/getall")                 //获取推送消息
#define XK_URL_MESSAGE_UPDATA_STATU             Home_URL_Prefix(@"push/upush")
#define XK_URL_MESSAGE_GET_COUNT                Home_URL_Prefix(@"push/getcount")
#define XK_URL_MESSAGE_UPDATA_ALL_STATU         Home_URL_Prefix(@"push/uallpush")


#define XK_URL_USER_GET_SHAREANCHOR_URL         Home_URL_Prefix(@"anchor/getShareAnchorUrl")                //获得直播间分享链接接口
#define XK_URL_USER_GET_TATTENTION_LIST         User_URL_Prefix(@"user/getattentionlist")                //我的关注列表
#define XK_URL_USER_GET_FANS_LIST               User_URL_Prefix(@"user/getfanslist")                //一、	我的粉丝列表
#define XK_URL_USER_TATTENTION                  User_URL_Prefix(@"user/attention")                //一、	关注/取消关注
#define XK_URL_USER_GET_ANCHOR_LIST             User_URL_Prefix(@"user/getanchorlist")                //我的页面-我的直播时间


//虫套餐
#define XK_URL_ACCOUNT_GETCHANGE_LIST           Order_URL_Prefix(@"pay/common/userInfo/getChangeList")  // 我的账户虫套餐接口息
#define XK_URL_ACCOUNT_GETDETAIL_LIST           Order_URL_Prefix(@"pay/common/userInfo/getUserDetail")  // 	账户明细页接口

#define XK_URL_ACCOUNT_ORDER_APPLEFLOWER           Order_URL_Prefix(@"pay/common/order/createPay")              //苹果花
#define XK_URL_ACCOUNT_ORDER_APPLEFLOWER_NOTIFY    Order_URL_Prefix(@"pay/common/appleOrder/iosApplePayNotify")              //苹果花回调



//	我的收益
#define XK_URL_ACCOUNT_GETEARNING_LIST          User_URL_Prefix(@"user/getearning")  // 我的收益

#define XK_URL_ACCOUNT_GET_PRIVATE_EARNING_LIST          User_URL_Prefix(@"user/getvirtualearning")  // 我的私密播收益

#define XK_URL_ACCOUNT_GETLEVEL_LIST            User_URL_Prefix(@"user/getlevel")  // 我的等级
#define XK_URL_ACCOUNT_GETLEVELDETAIL_LIST      User_URL_Prefix(@"user/getleveldetail")  // 我的等级详情
//我的守护列表详情
#define XK_URL_ACCOUNT_GUARD_LIST      User_URL_Prefix(@"user/getmyanchorguardlist")  // 守护列表

#define XK_URL_ACCOUNT_GUARD_CHANGE_LIST    Home_URL_Prefix(@"guard/getchangelist")  // 守护套餐

#define XK_URL_ACCOUNT_GUARD_SET    Home_URL_Prefix(@"guard/set")  // 守护改成用钻石花


//开屏
#define XK_URL_HOME_STAR_SCREEN                 Home_URL_Prefix(@"config/getkaiping")           //获取开屏广告


/********************************* 其他 ***********************************/
#define XK_URL_LIVE_GET_HOST_CARD               User_URL_Prefix(@"user/getanchordetail")        //获取主播卡片信息
#define XK_URL_LIVE_GET_USER_CARD               User_URL_Prefix(@"user/getuserdetail")          //获取观众卡片信息
#define XK_URL_LIVE_REPORT_USER                 User_URL_Prefix(@"user/reportuser")             //举报
#define XK_URL_USER_BLACK_LIST                  User_URL_Prefix(@"user/getblacklist")
#define XK_URL_LIVE_GET_TOP_Guard               Home_URL_Prefix(@"top/getnewguardlist")        //获取主播守护列表
#define XK_URL_LIVE_GET_OnlineUser_LIST         User_URL_Prefix(@"user/getonlineuserlist")        //获取在线用户列表

#define XK_URL_HOME_GET_ACTIVITY_LIST      Home_URL_Prefix(@"anchor/getActivityList") // 获取直播间活动列表
#define XK_URL_Home_UPDATE_LIVE_TITLE       Home_URL_Prefix(@"anchor/updateTitle") // 主播修改直播间标题
#define XK_URL_HOME_GET_ANCHOR_INFO         Home_URL_Prefix(@"anchor/getAnchorInfo") // 获取主播最新标题

/********************************* 红包 ***********************************/
#define XK_URL_HOME_GET_ANCHOR_REDPACKET_DETAIL         Home_URL_Prefix(@"anchor/getAnchorRedPacketDetail") // 获取主播房间红包详情接口
#define XK_URL_HOME_GET_ANCHOR_REDPACKET_LIST         Home_URL_Prefix(@"anchor/getPrizeRecord") // 获取个人红包获得记录
#define XK_URL_HOME_GET_ANCHOR_REDPACKET_CLICK         Share_URL_Prefix(@"redpackage/rob") // 点击抢红包

#define XK_URL_SET_Control              User_URL_Prefix(@"user/setcontrol")
//设置为场控
#define XK_URL_SET_ADMIN              User_URL_Prefix(@"user/setadmin")
//设置为房管



/********************************* 商城 ***********************************/
#define XK_URL_MALL_LIST                        Home_URL_Prefix(@"shop/getlist")                //商城首页列表
#define XK_URL_MALL_PRODUCT_INFO                Home_URL_Prefix(@"shop/getproduct")             //商城获取商品详情
#define XK_URL_MALL_PRODUCT_EXCHANGE_CONFIRM    Order_URL_Prefix(@"exchange/confirm")           //确认换
#define XK_URL_MALL_PRODUCT_EXCHANGE_SUBMIT     Order_URL_Prefix(@"exchange/submit")            //提交钥匙花
#define XK_URL_MALL_RECORD_LIST                 Order_URL_Prefix(@"exchange/getlist")           //兑换记录列表
#define XK_URL_MALK_RECORD_INFO                 Order_URL_Prefix(@"exchange/getdetail")         //兑换记录详情

/********************************* PK大乱斗 ***********************************/
#define MS_URL_PK_RESULT                    Home_URL_Prefix(@"pk/getresult")
#define MS_URL_PK_TIME                      Home_URL_Prefix(@"anchor/pktimeList")           //获取连麦时间参数



/********************************* 座驾商城 ***********************************/
#define XK_URL_HOME_CARSHOP_LIST            Home_URL_Prefix(@"shop/getShopIndex") // 座驾商城首页
#define XK_URL_HOME_CARSHOP_BUY             Home_URL_Prefix(@"shop/buy") // 座驾购买
#define XK_URL_HOME_CARSHOP_CHECKisBUY      Home_URL_Prefix(@"shop/checkIsBuy") // 查看座驾是否已经购买
#define XK_URL_USER_GETBYFUID               User_URL_Prefix(@"user/getUserByFuid") // 根据房间号获取用户信息



/********************************* 我的礼物 ***********************************/
#define XK_URL_GET_MYGIFT_LIST              User_URL_Prefix(@"user/userGiftList") // 获取我的礼物列表
#define XK_URL_GET_MYGIFT_DETAIL_LIST       User_URL_Prefix(@"user/giftListDetail")   // 获取我的礼物明细列表
#define XK_URL_MYGIFT_CheckIsUse            User_URL_Prefix(@"user/checkIsUse")   // 检查该礼物是否被使用中
#define XK_URL_MYGIFT_USE                   User_URL_Prefix(@"user/useGift")   // 使用礼物
#define XK_URL_MYGIFT_ReceiveGift           User_URL_Prefix(@"shop/common/userPackage/receiveGift")   // 领取背包礼物

#endif /* FMServiceURL_h */
