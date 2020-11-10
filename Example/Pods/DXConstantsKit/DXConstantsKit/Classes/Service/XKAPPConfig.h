//
//  XKAPPConfig.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/22.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef XKAPPConfig_h
#define XKAPPConfig_h



//服务器地址
#ifdef DEBUG
static NSString * const KSERVER_URL = @"https://test.index.meisuitd.cn";
static NSString * const KSERVER_CERNAME = @"ctesta.data";
static NSString * const KSERVER_CERTYPE = nil;
static NSString * const KSERVER_P12NAME = @"clitestent.data";
static NSString * const KSERVER_P12TYPE = nil;


static NSString * const kShare_Absolute_URL = @"http://web.test.actumtech.com:8765/";
static NSString * const kUser_Absolute_URL = @"http://web.test.actumtech.com:8765/";
static NSString * const kHome_Absolute_URL = @"http://index.demo.actumtech.com:8899/meisuindex/";

#else
static NSString * const KSERVER_URL = @"https://index.pod.meisuizhibo.com";
static NSString * const KSERVER_CERNAME = @"cformala.data";
static NSString * const KSERVER_CERTYPE = nil;
static NSString * const KSERVER_P12NAME = @"cliformalent.data";
static NSString * const KSERVER_P12TYPE = nil;


//static NSString * const kShare_Absolute_URL = @"https://web.prod.dccentury.com/";
static NSString * const kShare_Absolute_URL = @"https://web.prod.yuaizb.com/";
static NSString * const kUser_Absolute_URL = @"https://web.prod.yuaizb.com/";
static NSString * const kHome_Absolute_URL = @"https://index.prod.actumtech.com:4321/meisuindex/";


#endif

#define xieyi_URL                         @"https://web.prod.yuaizb.com/xieyi-xk.html"
#define policy_URL                        @"https://web.prod.yuaizb.com/privacy-policy-xk.html"



//渠道号
static NSString * const KAPPCANCLE = @"0014";
static NSString * const KAPPID = @"02";


//----------------------熊客直播 相关字段定义 begin----------------------//

static NSString * const KXKProfitswitch = @"profitswitch";
static NSString * const KAPPStoreCheck_deadLine = @"2017-06-03";
// 友盟
static NSString * const KUmengAppKey = @"5ec501150cafb2984c000415";
//apple id
static NSString * const KAppleId= @"1514585576";
//微信
static NSString * const KWXAppId= @"wx086f3e6b3733c7be";
static NSString * const KWXScrect= @"3e65cc9f4f21fdfb4ee7e95bb5873b12";
static NSString * const KUniversalLink= @"https://www.yuaizb.com/";
//直播
static NSString * const KLiveLicenceKey = @"96237744350dd0c630c8111912ce6c42";
static NSString * const KLiveLicenceUrl= @"http://license.vod2.myqcloud.com/license/v1/ca2836d4f80788139656e0e2a0f67dea/TXLiveSDK.licence";
//闪验
static NSString * const KShanYanId= @"WGLL0JML";
static NSString * const KShanYanKey= @"TcKm3dNU";

static NSString * const KBaiDuKey = @"2zEe8EAtNm0mG9GBGbbTrWU1ZIqTUZR4";

static NSString * const KQQId = @"101866295";
static NSString * const KQQScrect = @"6c0c8e4ee3329289aaee3f7631338451";


#endif /* XKAPPConfig_h */
