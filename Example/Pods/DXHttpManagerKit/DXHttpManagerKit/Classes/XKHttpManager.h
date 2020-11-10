//
//  XKHttpManager.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XKNetworkManager.h"
#import "XKMaintenanceView.h"//维护模式

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, XKHttpResponseStatus) {
    XKHttpResponseStatus_FailureServer      = 0,// 服务端逻辑错误
    XKHttpResponseStatus_success,
    XKHttpResponseStatus_Notice,
    XKHttpResponseStatus_NeedLogin,       //需要重新登录
    XKHttpResponseStatus_PhoneISUsed,     //手机号已被注册
    XKHttpResponseStatus_EqulaOldData,    //获取成功，但是和旧数据一致，无修改
    XKHttpResponseStatus_NetworkError,    //网络异常
    XKHttpResponseStatus_NoNet,           //未连接网络
    XKHttpResponseStatus_Undefine,        //未知结果
    XKHttpResponseStatus_NoStock,             //没有库存了
    XKHttpResponseStatus_NotEnoughKey,        //钥匙不够
    XKHttpResponseStatus_UserInfoMiss,        //个人资料不全
    XKHttpResponseStatus_NoDiamond,           //钻石不足
    XKHttpResponseStatus_NeedInviteCode,      //需要填写邀请码
    XKHttpResponseStatus_AppleFlowerTips,        //当天通过了3次需要提醒
    XKHttpResponseStatus_EditThanLevel,       //个人等级不超过30级需要花费费用的
    XKHttpResponseStatus_NotBindPhoneNumber,       //第三方登录未绑定手机号码
    XKHttpResponseStatus_FrozenUser,          //账号被封，退出登录
    XKHttpResponseStatus_MaintenanceStatus,   //维护状态
};
typedef void (^XKHttpManagerBlock)(XKHttpResponseStatus status ,id _Nullable object);
@interface XKHttpManager : NSObject

/// get方法请求
/// @param isNeedLogin 是否需要登录
/// @param urlString 请求地址
/// @param patams 请求参数
/// @param callBack 回调
- (NSURLSessionDataTask *)getHttpWithLoginState:(BOOL)isNeedLogin
                                     urlString:(NSString *)urlString
                                        params:(NSDictionary * _Nullable)patams
                                      callBack:(XKHttpManagerBlock)callBack;


- (NSURLSessionDataTask *)postHttpWithLoginState:(BOOL)isNeedLogin
                                       urlString:(NSString *)urlString
                                          params:(NSDictionary * _Nullable)patams
                                        callBack:(XKHttpManagerBlock)callBack;

//body参数请求
- (NSURLSessionDataTask *)postBodyHttpWithLoginState:(BOOL)isNeedLogin
                                           isAddWish:(BOOL)isAddWish
                                           urlString:(NSString *)urlString
                                              params:(id _Nullable)patams
                                            callBack:(XKHttpManagerBlock)callBack;

//获取失败，判断接口之前是否存在数据
@property(nonatomic,assign)BOOL isHasContent;
- (void)handleResponseWithObject:(NSDictionary *)responseObject codeKey:(NSString *)codeKey dataKey:(NSString *)dataKey msgKey:(NSString *)msgKey callBack:(XKHttpManagerBlock)callBack;
@end

NS_ASSUME_NONNULL_END
