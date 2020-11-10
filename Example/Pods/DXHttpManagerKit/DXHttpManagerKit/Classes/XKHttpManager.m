//
//  XKHttpManager.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKHttpManager.h"
#import <YYKit/YYKit.h>

@implementation XKHttpManager

#pragma mark - get method
- (NSURLSessionDataTask *)getHttpWithLoginState:(BOOL)isNeedLogin urlString:(NSString *)urlString params:(NSDictionary *)patams callBack:(XKHttpManagerBlock)callBack {
    if ([self shouldLogin:isNeedLogin callBack:callBack]) {
        return nil;
    }
    @weakify(self);
    return [[XKNetworkManager shareInstance]getMethodRequestWithUrl:urlString params:patams success:^(id  _Nullable requestTask, id  _Nonnull responseObject) {
        NSLog(@"【url】:%@ \n 【responseObject】:%@",urlString,[responseObject modelToJSONString]);
        @strongify(self);
        [self handleResponseWithObject:responseObject codeKey:@"sign" dataKey:@"d" msgKey:@"msg" callBack:callBack];
    } failure:^(id  _Nullable requestTask, NSError * _Nullable error) {
        NSLog(@"【url】:%@ \n 【error】:%@",urlString,error);
        @strongify(self);
        [self handleResponseFailure:error callback:callBack];
    }];
}


#pragma mark - post method
- (NSURLSessionDataTask *)postHttpWithLoginState:(BOOL)isNeedLogin urlString:(NSString *)urlString params:(NSDictionary *)patams callBack:(XKHttpManagerBlock)callBack {
    if ([self shouldLogin:isNeedLogin callBack:callBack]) {
        return nil;
    }
    @weakify(self);
    NSLog(@"【url】:%@ \n 【patams】:%@",urlString,[patams modelToJSONString]);
    return [[XKNetworkManager shareInstance]postMethodRequestWithUrl:urlString params:patams isJson:NO success:^(id  _Nullable requestTask, id  _Nonnull responseObject) {
        @strongify(self);
        NSLog(@"【url】:%@ \n 【responseObject】:%@",urlString,[responseObject modelToJSONString]);
        [self handleResponseWithObject:responseObject codeKey:@"sign" dataKey:@"d" msgKey:@"msg" callBack:callBack];
    } failure:^(id  _Nullable requestTask, NSError * _Nullable error) {
        @strongify(self);
        [self handleResponseFailure:error callback:callBack];
    }];
}

- (NSURLSessionDataTask *)postBodyHttpWithLoginState:(BOOL)isNeedLogin isAddWish:(BOOL)isAddWish urlString:(NSString *)urlString params:(id)patams callBack:(XKHttpManagerBlock)callBack {
    if ([self shouldLogin:isNeedLogin callBack:callBack]) {
           return nil;
       }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:patams options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        callBack(XKHttpResponseStatus_FailureServer, @"开发者上传错误！！！");
        return nil;
    }
    NSLog(@"【url】:%@ \n 【patams】:%@",urlString,[patams modelToJSONString]);
    @weakify(self);
    return [[XKNetworkManager shareInstance]postMethodToBodyRequestWithUrl:urlString data:jsonData success:^(id  _Nullable requestTask, id  _Nonnull responseObject) {
        NSLog(@"【url】:%@ \n 【responseObject】:%@",urlString,[responseObject modelToJSONString]);
        @strongify(self);
        if (isAddWish) {
            [self handleResponseWithObject:responseObject codeKey:@"sign" dataKey:@"d" msgKey:@"msg" callBack:callBack];
        }else {
            [self handleResponseWithObject:responseObject codeKey:@"resultCode" dataKey:@"resultData" msgKey:@"resultMsg" callBack:callBack];
        }
    } failure:^(id  _Nullable requestTask, NSError * _Nullable error) {
        NSLog(@"【url】:%@ \n 【error】:%@",urlString,error);
        @strongify(self);
        [self handleResponseFailure:error callback:callBack];
    }];
}
#pragma mark - private

- (BOOL)shouldLogin:(BOOL)isNeedLogin callBack:(XKHttpManagerBlock)callBack {
//    if (isNeedLogin && [@"" isEqualToString:[XKUserHttpManagerUtil getToken]]) {
//        callBack(XKHttpResponseStatus_NeedLogin, @"请登录");
//        XK_POST_NOTIFY(KXKUserNeedToLoginNotification);
//        return YES;
//    }
    return NO;
}
- (void)handleResponseFailure:(NSError *)error callback:(XKHttpManagerBlock)callback {
    if (callback) {
        callback(XKHttpResponseStatus_NetworkError, [error localizedDescription]);
    }
}
- (void)handleResponseWithObject:(NSDictionary *)responseObject codeKey:(NSString *)codeKey dataKey:(NSString *)dataKey msgKey:(NSString *)msgKey callBack:(XKHttpManagerBlock)callBack {
    if (!callBack) return;
    if (KISDictionary(responseObject)) {
        NSInteger code = [[responseObject objectForKey:codeKey] integerValue];
        NSDictionary *data = [responseObject objectForKey:dataKey];
        if (code == 1) {
            self.isHasContent=YES;
            NSString *msg = isnull([responseObject objectForKey:msgKey]);
            [[NSUserDefaults standardUserDefaults] setValue:msg forKey:msgKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
            callBack(XKHttpResponseStatus_success, data);
        }else {
            if (![data isKindOfClass:[NSDictionary class]]) {
                data = responseObject;
            }
            NSString *msg = [data objectForKey:msgKey];
            if (!KISString(msg)) {
                msg = [responseObject objectForKey:msgKey];
            }
            switch (code) {
                case 48484:
                {
                    callBack(XKHttpResponseStatus_FrozenUser, msg);
                    XK_POST_NOTIFY(KXKUserLoginOutNotification);
                    [[XKNetworkManager shareInstance] removeUserToken];
                    XK_POST_NOTIFY_WITH_INFO(KXKUserNeedToLoginNotification, @{@"isUserAnimate":@"isUserAnimate"});
                }
                    break;
                case 919:
                {
                    callBack(XKHttpResponseStatus_MaintenanceStatus, msg);
                    XKMaintenanceView *maintenanceView = [[XKMaintenanceView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                    maintenanceView.msg = msg;
                }
                    break;
                case 30004:
                    callBack(XKHttpResponseStatus_NoStock, msg);
                    break;
                case 30005:
                    callBack(XKHttpResponseStatus_NotEnoughKey, msg);
                    break;
                case 30006:
                    callBack(XKHttpResponseStatus_UserInfoMiss, msg);
                    break;
                case 20020:
                    callBack(XKHttpResponseStatus_NoDiamond, msg);
                    break;
                case 20031:
                    callBack(XKHttpResponseStatus_NeedInviteCode, msg);
                    break;
                case 17:
                    callBack(XKHttpResponseStatus_AppleFlowerTips, msg);
                    break;
                case 10040:
                    callBack(XKHttpResponseStatus_EditThanLevel, msg);
                    break;
                case 12345:
                    callBack(XKHttpResponseStatus_NotBindPhoneNumber, msg);
                    break;

                default:
                    callBack(XKHttpResponseStatus_FailureServer, msg);
                    break;
            }
        }
    }else {
        callBack(XKHttpResponseStatus_FailureServer, @"服务器数据传输格式错误！");
    }
}



-(NSString *)compoentCacheKeyWithBaseUrl:(NSString *)url params:(NSDictionary *)parameters
{
    
    NSDictionary *paramDict=parameters;
    //如果添加了公用参数，url中已经自动添加了公用参数，这里不需要在进行拼接打印
    NSString *className=NSStringFromClass(self.class);
    NSString *outPutUrl=[NSString stringWithFormat:@"forMan://%@",className];
    
    NSArray *urlArray=url.pathComponents;
    for (int i=0; i<url.pathComponents.count; i++) {
        if (i==0||i==1) {//http://vmeimei.user.meimeizhengxing.com/
            continue;//i==0 http:    i==1 vmeimei.user.meimeizhengxing.com
        }
        NSString *newPath=urlArray[i];
        outPutUrl=[NSString stringWithFormat:@"%@\%@",outPutUrl,newPath];
    }
    
    if([outPutUrl rangeOfString:@"?"].location ==NSNotFound)
    {//不带公共参数添加 ?     ?xx=xx&yy=yy&
        outPutUrl=[outPutUrl stringByAppendingString:@"?"];
    }
    else//如果带了公共参数添加&
    {
        outPutUrl=[outPutUrl stringByAppendingString:@"&"];
    }
    NSArray *allKeys = [paramDict allKeys];//对参赛进行了排序，保证顺序，链接的一致性
    allKeys = [allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    for (NSString *key in allKeys) {
        //    for (NSString *key in paramDict.keyEnumerator) {
        NSString *keyValue= [NSString stringWithFormat:@"%@=%@&",key,[paramDict objectForKey:key]];
        outPutUrl= [outPutUrl stringByAppendingString:keyValue];
    }
    outPutUrl=[outPutUrl substringToIndex:outPutUrl.length-1];
    //    NSString * encodingString = [outPutUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",encodingString);
    return outPutUrl;

//    return nil;
}
@end
