//
//  XKNetworkManager.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/22.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "OpenUDID.h"
#import <YYKit/YYKit.h>
#import <DXConstantsKit/DXConstantsKit.h>
#import <DXCategoryKit/DXCategoryKit.h>
static const NSInteger XOR_KEY = 0xBB;
NS_ASSUME_NONNULL_BEGIN
typedef void(^XKResponseSuccess)(id _Nullable requestTask, id responseObject);
typedef void(^XKResponseFailure)(id _Nullable requestTask, NSError * _Nullable error);

@interface XKNetworkManager : NSObject

@property (nonatomic, assign) BOOL isTokenSet;
@property (nonatomic ,strong) AFHTTPSessionManager * httpManager;
@property (nonatomic, strong) NSMutableDictionary *headerData;

+ (XKNetworkManager *)shareInstance;


/// 设置登录token
- (void)setupUserToken;
/// 用户没有登录时候，设置默认的token
- (void)setupTempToken:(NSString*)token;
/// 退出登录，删除token
- (void)removeUserToken;

/// 请求提交设备的udid
- (void)setupDeviceUDID;


/// get请求
/// @param URLString 请求地址
/// @param params 请求参数
/// @param success 成功回调
/// @param failure 失败回调
- (NSURLSessionDataTask*)getMethodRequestWithUrl:(NSString *)URLString
                                          params:(NSDictionary *)params
                                         success:(XKResponseSuccess)success
                                         failure:(XKResponseFailure)failure;

/// post请求
/// @param URLString 请求地址
/// @param params 请求参数
/// @param isJson 是否json请求
/// @param success 成功回调
/// @param failure 失败回调
- (NSURLSessionDataTask *)postMethodRequestWithUrl:(NSString *)URLString
                                            params:(id)params
                                            isJson:(BOOL)isJson
                                           success:(XKResponseSuccess)success
                                           failure:(XKResponseFailure)failure;

/// post请求,json参数
/// @param URLString 请求地址
/// @param data json话data
/// @param success 成功回调
/// @param failure 失败回调
- (NSURLSessionDataTask *)postMethodToBodyRequestWithUrl:(NSString *)URLString
                                                    data:(NSData *)data
                                                 success:(XKResponseSuccess)success
                                                 failure:(XKResponseFailure)failure;

+ (NSString *)setupHttpRequestHeaderField;
@end

NS_ASSUME_NONNULL_END
