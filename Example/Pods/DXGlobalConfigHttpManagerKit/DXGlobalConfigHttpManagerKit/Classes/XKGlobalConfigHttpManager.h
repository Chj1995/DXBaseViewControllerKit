//
//  XKGlobalConfigHttpManager.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKHttpManager.h"
#import "XKGlobalConfigModel.h"
#import "XKReachability.h"
#import <AFNetworking/AFNetworking.h>
#import "XKNetworkManager.h"
#import <AdSupport/AdSupport.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "OpenUDID.h"
#import "YYCache+XKEvent.h"
#import <DXHttpManagerKit/XKHttpManager.h>
#import <DXHttpManagerKit/XKDomainIPManager.h>
#import "GVUserDefaults+XKProperties.h"
#import "XKDataBaseManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface XKGlobalConfigHttpManager : XKHttpManager
+ (instancetype)shareInstance;
@property (nonatomic, assign) CGFloat tabbarHeight;
@property (nonatomic, strong) XKGlobalConfigModel *configModel;
@property (nonatomic, assign) CGFloat showFloatViewHeight;
// 获取版本号信息
- (void)getAppVersionData;
- (void)setupTempToken;

- (void)uploadUserDeviceInfo;

@property (nonatomic, assign) BOOL mixStream_isNoFirst;

@end

NS_ASSUME_NONNULL_END
