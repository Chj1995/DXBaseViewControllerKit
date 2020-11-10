//
//  XKDomainIPManager.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/22.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKDomainIPManager.h"
#import <DXConstantsKit/DXConstantsKit.h>
#ifdef DEBUG
static NSString *User_Module_Url = @"http://user.test.actumtech.com:8765/meisuiuser/";
static NSString *Home_Module_Url = @"http://index.test.actumtech.com:8765/meisuindex/";
static NSString *Order_Module_Url = @"http://paycallback.dev.dccentury.com:8765/";
static NSString *Gift_Module_Url = @"http://api.test.actumtech.com:8765/";
static NSString *Community_Module_Url = @"http://sns.test.actumtech.com:8765/meisuicommunity/";
static NSString *Share_Module_Url = @"http://share.test.actumtech.com:8765/meisuishare/";
static NSString *Api_Module_Url = @"http://api.test.actumtech.com:8765/";
static NSString *Family_Module_Url = @"http://api.test.actumtech.com:8765/";
static NSString *Badge_Module_Url = @"http://api.test.actumtech.com:8765/badge/";
static NSString *IM_Module_Url = @"http://api.test.actumtech.com:8765/";
static NSString *IM_Module_Url1 = @"http://api.test.actumtech.com:8765/";
static NSString *IM_APP_Url = @"http://172.22.1.131:1234";
static NSString *Grade_Module_Url = @"http://api.test.actumtech.com:8765/oauth2/";
static NSString *UserTitle_Module_Url = @"http://api.test.actumtech.com:8765/";
static NSString *UserTitle_Price_Module_Url = @"http://api.test.actumtech.com:8765/";
#else

static NSString *User_Module_Url = @"https://user.prod.actumtech.com:4321/meisuiuser/";
static NSString *Home_Module_Url = @"https://index.prod.actumtech.com:4321/meisuindex/";
static NSString *Order_Module_Url = @"https://api.prod.actumtech.com:4321/";
static NSString *Gift_Module_Url = @"https://api.prod.actumtech.com:4321/";
static NSString *Community_Module_Url = @"https://sns.prod.actumtech.com:4321/meisuicommunity/";
static NSString *Share_Module_Url = @"https://share.prod.actumtech.com:4321/meisuishare/";
static NSString *Api_Module_Url = @"https://api.prod.actumtech.com:4321/";
static NSString *Family_Module_Url = @"https://api.prod.actumtech.com:4321/";
static NSString *Badge_Module_Url = @"https://api.prod.actumtech.com:4321/badge/";
static NSString *IM_Module_Url = @"https://api.prod.actumtech.com:4321/";
static NSString *IM_Module_Url1 = @"https://api.prod.actumtech.com:4321/";
static NSString *IM_APP_Url = @"http://imapp.prod.actumtech.com:8765";
static NSString *Grade_Module_Url = @"https://api.prod.actumtech.com:4321/oauth2/";
static NSString *UserTitle_Module_Url = @"https://api.prod.actumtech.com:4321/";
static NSString *UserTitle_Price_Module_Url = @"https://api.prod.actumtech.com:4321/";
#endif

@implementation XKDomainIPManager
+ (NSString *)getHomeModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Home_Module_Url,url);
}

+ (NSString *)getUserModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",User_Module_Url,url);
}
+ (NSString *)getCommunityModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Community_Module_Url,url);
}

+ (NSString *)getGiftModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Gift_Module_Url,url);
}
+ (NSString *)getOrderModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Order_Module_Url,url);
}
+ (NSString *)getShareModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Share_Module_Url,url);
}
+ (NSString *)getApiModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Api_Module_Url,url);
}
+ (NSString *)getFamilyModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Family_Module_Url,url);
}
+ (NSString *)getIMModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",IM_Module_Url,url);
}
+ (NSString *)getIMModuleUrl1:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",IM_Module_Url1,url);
}
+ (NSString *)getBadgeModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Badge_Module_Url,url);
}
+ (NSString *)getIMAPPUrl {
    return IM_APP_Url;
}
+ (NSString *)getGradeModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",Grade_Module_Url,url);
}
+ (NSString *)getUserTitleModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",UserTitle_Module_Url,url);
}
+ (NSString *)getUserTitlePriceModuleUrl:(NSString *)url {
    return KSTRING_FORMAT(@"%@%@",UserTitle_Price_Module_Url,url);
}
@end
