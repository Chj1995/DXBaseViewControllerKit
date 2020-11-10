//
//  XKGlobalConfigModel.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKGlobalConfigModel : NSObject<NSCoding>

///启动图片
@property (nonatomic, strong, nullable) NSString *starLaunchImageUrl;

///商城图片前缀
@property (nonatomic, copy)NSString *shopImageUrlPrefix;

///用户头像图片前缀
@property (nonatomic, copy)NSString *photoUrlPrefix;

///上传头像token
@property (nonatomic, copy) NSString *photoUploadToken;

///上传身份证token
@property (nonatomic, copy) NSString *cardUploadToken;

///上传评价token
@property (nonatomic, copy) NSString *evaluateSubmitToken;

//区域更新时间
@property (nonatomic, assign) NSTimeInterval areaupdateTime;

/// 商品详情页地址
@property (nonatomic, copy) NSString *goodsDetailFAQUrl;

///分享的地址前缀
@property (nonatomic, copy) NSString *shareUrlPrefix;
///有活动就会在live box 前面加个框
@property (nonatomic, copy) NSString *index_bg_pic;
@property (nonatomic, copy) NSString *index_bg_pic2;

//3des加密的iv和key
@property (nonatomic, strong) NSString *des3IV;
@property (nonatomic, strong) NSString *des3Key;

//消息推送的token
@property (nonatomic, strong) NSString *deviceToken;

//显示第3方登录
@property (nonatomic, assign) BOOL shouldThirdLogin;

///是否有推荐位
@property (nonatomic, assign) BOOL hadShoppingRecommend;

/// 是否显示收益
@property (nonatomic, assign) BOOL profitswitch;

/// 是否已经签到
@property (nonatomic, assign) BOOL isSign;

/// 是否需要弹出公告
@property (nonatomic, assign) BOOL is_pop;

/// 临时token
@property (nonatomic, copy) NSString *tempToken;

/// 1是国外ip 0否
@property (nonatomic, assign) BOOL foreignIp;

///版本更新提示
@property (nonatomic, assign) BOOL shouldUpdateVersion;

/// 微信服务号
@property (nonatomic, copy) NSString *serviceWXNo;
@property (nonatomic, copy) NSString *wxAppId;
/// ucloud推流地址
@property (nonatomic, copy) NSString *rtmpUCloudUrl;

/// 0为一键登录  1为正常登陆
@property (nonatomic, assign) BOOL shouldShanYanLogin;
/// 登陆页面的背景图
@property (nonatomic, copy) NSString *backgroud_pic;
/// 聊天公屏尾灯
@property (nonatomic, copy) NSString *im_pic;
/// 用户ip地址
@property (nonatomic, strong) NSString *ipaddress;

/// 0为不显示邀请码页填写  1为显示
@property (nonatomic, assign) BOOL canShowInvite;

/// 0为不显示注册页邀请码框填写  1为显示
@property (nonatomic, assign) BOOL canShowRegisterInvite;

///抽奖是否显示0为不显示1为显示
@property (nonatomic, assign) BOOL dial_is_show;

/// 是否隐藏直播间的守护榜 yes ： 隐藏 ，  no ： 显示
@property (nonatomic, assign) BOOL isGuardInLivehidden;
@property (nonatomic, copy) NSString *lipstick;

@property (nonatomic, copy) NSString *levelupinfo; // 如何快速提升等级页面
@end

NS_ASSUME_NONNULL_END
