//
//  XKGlobalConfigHttpManager.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/24.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKGlobalConfigHttpManager.h"

static NSString * const kGlobalConfigModelSaveKey = @"GlobalConfigModelSaveKey";
static NSString * const kAppVersionInfoSaveKey    = @"AppVersionInfoSaveKey";

static NSString * const kDefaultProductImageUrl = @"https://img.prod.yuaizb.com/";
static NSString * const kDefaultPhotoImageUrl = @"https://img.prod.yuaizb.com/";
@interface XKGlobalConfigHttpManager ()
{
    NSInteger _maxHttpLoopConfigCount;
    BOOL _isHasNetworkIP;
    BOOL _isLoadingIP;
    BOOL _isHasConfig;
    BOOL _isLoadingConfig;
    BOOL _isHasVersion;
    BOOL _isLoadingVersion;
}
@property (nonatomic, weak) XKReachability *reachability;
@end
@implementation XKGlobalConfigHttpManager

+ (instancetype)shareInstance {
    static XKGlobalConfigHttpManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XKGlobalConfigHttpManager alloc] init];
    });
    return instance;
}
- (instancetype)init {
    if (self = [super init]) {
        [self getGlobalConfigModel];
        [self networkNotice];
    }
    return self;
}

/// 开启网络监听
- (void)networkNotice {
    self.reachability = [XKReachability shareInstance];
    if ([self.reachability networkEnable]) {
        [self performSelector:@selector(getHasNetworkData) afterDelay:1.5];
    }else {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChange) name:KXKReachabilityChangedNotification object:nil];
    }
}
- (void)getGlobalConfigModel {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:kGlobalConfigModelSaveKey];
    if (data) {
        self.configModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    }else {
        self.configModel = [[XKGlobalConfigModel alloc] init];
        self.configModel.starLaunchImageUrl =nil;
        self.configModel.shopImageUrlPrefix = kDefaultProductImageUrl;
        self.configModel.photoUrlPrefix = kDefaultPhotoImageUrl;
    }
}
- (void)setupTempToken {
    [[XKNetworkManager shareInstance]setupTempToken:self.configModel.tempToken];
}
/// 网络变化通知
- (void)networkChange {
    if ([self.reachability networkEnable]) {
        [self getHasNetworkData];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:KXKReachabilityChangedNotification object:nil];
    }
}
- (void)getHasNetworkData {
    if (!_isHasNetworkIP && !_isLoadingIP) {
        _isLoadingIP = YES;
        [self getNetworkIPAddress];
    }
    if (!_isHasConfig && !_isLoadingConfig) {
        _isLoadingConfig = YES;
        [self getConfigofServer];
    }
    [self performSelector:@selector(doSomeThing) withObject:nil afterDelay:3.0];
        
#if !TARGET_OS_SIMULATOR
        [self performSelector:@selector(getAppVersionData) withObject:nil afterDelay:1.5];//更新版本
#endif
}
#pragma mark - 配置
- (void)getConfigofServer {
    @weakify(self)
    [super getHttpWithLoginState:NO urlString:[XKDomainIPManager getHomeModuleUrl:kConfigServiceAPI] params:nil callBack:^(XKHttpResponseStatus status, id  _Nonnull object) {
        @strongify(self)
        self->_isLoadingConfig = NO;
        if (status == XKHttpResponseStatus_success) {
            self->_isHasConfig = YES;
            [self handleConfigResult:object];
        }else if(status == XKHttpResponseStatus_NetworkError){
            [self configReload];
        }
    }];
}
- (void)configReload {
    _maxHttpLoopConfigCount ++;
    if (_maxHttpLoopConfigCount < 5) {
        @weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self)
            if ([self.reachability networkEnable]) {
                [self getConfigofServer];
            }
        });
    }
}
- (void)handleConfigResult:(NSDictionary *)data {
    _maxHttpLoopConfigCount = 0;
    self.configModel.profitswitch = NO;
    NSArray *array = (NSArray *)[data objectForKey:@"sysconfig"];
    __block BOOL temp = NO;
    @weakify(self)
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self)
        NSDictionary *dic = (NSDictionary*)obj;
        NSString *keyString = [dic objectForKey:@"attribute"];
        NSString *value = [dic objectForKey:@"values"];
        if ([@"spic" isEqualToString:keyString]) {
            self.configModel.starLaunchImageUrl = value;
        }else if ([@"productpic" isEqualToString:keyString]) {
            self.configModel.shopImageUrlPrefix = value;
        }else if ([@"userheadpic" isEqualToString:keyString]) {
            self.configModel.photoUrlPrefix = value;
        } else if ([@"yuliu1" isEqualToString:keyString]) {
            self.configModel.des3IV = value;
        } else if ([keyString isEqualToString:@"yuliu2"]){
            self.configModel.des3Key = value;
        } else if ([keyString isEqualToString:@"areaupdate"]) {
            NSTimeInterval newTime = [value doubleValue]/1000;
            if (newTime > self.configModel.areaupdateTime) {
                self.configModel.areaupdateTime = newTime;
            }
        } else  if ([keyString isEqualToString:@"headqnt"]) {
            self.configModel.photoUploadToken = value;
        } else  if ([keyString isEqualToString:@"cardqnt"]) {
            self.configModel.cardUploadToken = value;
        } else  if ([keyString isEqualToString:@"evaluateqnt"]) {
            //上传评论照片的
            self.configModel.evaluateSubmitToken = value;
        } else  if ([keyString isEqualToString:@"faqurl"]) {
            self.configModel.goodsDetailFAQUrl = value;
        } else  if ([keyString isEqualToString:@"shareurl"]) {
            self.configModel.shareUrlPrefix = value;
        } else  if ([keyString isEqualToString:@"thridswitch"]) {
            //是否显示第三方登录、分享按钮
            self.configModel.shouldThirdLogin = [value boolValue];
        }else  if ([keyString isEqualToString:@"profitswitch"]) {
            self.configModel.profitswitch = [value boolValue];
        } else  if ([keyString isEqualToString:@"is_pop"]) {
            self.configModel.is_pop = [value boolValue];
        } else if ([keyString isEqualToString:@"ztake"]) {
            self.configModel.profitswitch = YES;
        } else if ([keyString isEqualToString:@"index_bg_pic"]) {
            self.configModel.index_bg_pic = value;
        } else if ([keyString isEqualToString:@"index_bg_pic2"]) {
            self.configModel.index_bg_pic2 = value;
        }else if ([keyString isEqualToString:@"is_check"]) {
            self.configModel.isSign = [value boolValue];
            [self getIsSign];
        } else  if ([keyString isEqualToString:@"shoppingrecommend"]) {
             //是否有推荐位
            self.configModel.hadShoppingRecommend = [value boolValue];
        }  else  if ([keyString isEqualToString:@"foreign_ip"]) {
            //是否是国外IP
            self.configModel.foreignIp = [value boolValue];
        } else if ([keyString isEqualToString:@"t1"]) {
            if (!KISString(self.configModel.tempToken)) {
                self.configModel.tempToken = value;
                [[XKNetworkManager shareInstance]setupTempToken:value];
            }
        } else if ([keyString isEqualToString:@"service"]) {
            self.configModel.serviceWXNo = value;
        } else if ([keyString isEqualToString:@"invite_show"]) {
            self.configModel.canShowInvite = [value boolValue];
        } else if ([keyString isEqualToString:@"invite_code_switch"]) {
            self.configModel.canShowRegisterInvite = [value boolValue];
        } else if ([keyString isEqualToString:@"dial_is_show"]) {
            self.configModel.dial_is_show = [value boolValue];
        } else if ([keyString isEqualToString:@"rtmp_url"]) {
            self.configModel.rtmpUCloudUrl = value;
        } else if ([keyString isEqualToString:@"is_login_auto"]) {
            // 是否一键登录
            NSInteger isLogin = [value integerValue];
            if (isLogin == 0) {
                self.configModel.shouldShanYanLogin = YES;
            } else if (isLogin == 1) {
                self.configModel.shouldShanYanLogin = NO;
            }
        } else if ([keyString isEqualToString:@"backgroud_pic"]) {
            // 登陆背景图片
            self.configModel.backgroud_pic = value;
            XK_POST_NOTIFY(KXKLoginViewBackgroundImageChangeNotification);
        } else if ([keyString isEqualToString:@"im_pic"]) {
            self.configModel.im_pic = value;
        } else if ([keyString isEqualToString:KAPPShortVersion]) {
            temp = YES;
            self.configModel.isGuardInLivehidden = [value boolValue];
        }else if ([keyString isEqualToString:@"lipstick"]) {
             self.configModel.lipstick = value;
        } else if ([keyString isEqualToString:@"levelupinfo"]) {
            self.configModel.levelupinfo = value;
        }
    }];
    if (!temp) {
        self.configModel.isGuardInLivehidden = NO;
    }
    self.configModel.shouldThirdLogin = YES;
    [self saveConfigModel];
    dispatch_async(dispatch_get_main_queue(), ^{
        @strongify(self)
        [self performSelector:@selector(getUserInfoRequest) withObject:nil afterDelay:1.5];
    });
#if !TARGET_OS_SIMULATOR
    dispatch_async(dispatch_get_main_queue(), ^{
        @strongify(self)
        [self performSelector:@selector(uploadUserDeviceInfo) withObject:nil afterDelay:10.0];//上传用户手机信息
    });
#endif
}

- (void)saveConfigModel {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.configModel];
    [userDefaults setObject:data forKey:kGlobalConfigModelSaveKey];
    [userDefaults synchronize];
}

#pragma mark - 网络相关
/// 获取IP地址
- (void)getNetworkIPAddress {
       AFHTTPSessionManager *amanager = [AFHTTPSessionManager manager];
       AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
       [amanager setResponseSerializer:responseSerializer];
       @weakify(self)
       [amanager GET:@"https://myip.ipip.net" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
           
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           @strongify(self)
           self->_isHasNetworkIP = YES;
           self->_isLoadingIP = NO;
           NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingUTF8);
           NSString* strdata = [[NSString alloc]initWithData:responseObject encoding:enc];
           self.configModel.ipaddress = strdata;
           [amanager.session finishTasksAndInvalidate];
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           [amanager.session finishTasksAndInvalidate];
           @strongify(self)
           self->_isLoadingIP = NO;
       }];
}
- (void)getAppVersionData {
    if (!_isHasVersion && !_isLoadingVersion) {
        @weakify(self)
        [super getHttpWithLoginState:NO urlString:[XKDomainIPManager getHomeModuleUrl:kVersionInfoAPI] params:nil callBack:^(XKHttpResponseStatus status, id  _Nonnull object) {
            @strongify(self)
            self->_isLoadingVersion = NO;
            if (status == XKHttpResponseStatus_success) {
                self->_isHasVersion = YES;
                BOOL is_update = [[object objectForKey:@"is_update"] boolValue];
                if (is_update) {
                    XK_POST_NOTIFY_WITH_INFO(KXKVersionUpdateNotification, object);
                }
            }
        }];
    }
}

#pragma mark - 其他事件
- (void)doSomeThing {
    //初始化美颜参数
    GVUserDefaults *defaults = [GVUserDefaults standardUserDefaults];
    if (!defaults.isSetupDefaultOfMeiYan) {
        defaults.isSetupDefaultOfMeiYan = YES;
        defaults.selectedItem              = @"noitem";
        defaults.selectedFilter            = @"origin";
        defaults.selectedFilterLevel       = 0.5 ;
    
        defaults.skinDetectEnable          = YES ;
        defaults.blurShape                 = 0 ;
        defaults.blurLevel                 = 0.7 ;
        defaults.whiteLevel                = 0.5 ;
        defaults.redLevel                  = 0.5 ;
        
        defaults.eyelightingLevel          = 0.7 ;
        defaults.beautyToothLevel          = 0.7 ;
        
        defaults.faceShape                 = 4 ;
        defaults.enlargingLevel            = 0.4 ;
        defaults.thinningLevel             = 0.4 ;
        defaults.enlargingLevel_new        = 0.4 ;
        defaults.thinningLevel_new         = 0.4 ;
        
        defaults.jewLevel                  = 0.3 ;
        defaults.foreheadLevel             = 0.3 ;
        defaults.noseLevel                 = 0.5 ;
        defaults.mouthLevel                = 0.4 ;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserInfoRequest) name:KXKUserNeedGetInfoNotification object:nil];
        
        //延期执行的SDK初始化
        //清除7天前的缓存
        [[YYCache shareInstance].diskCache trimToAge:60 * 60 * 24 * 7 withBlock:^{
            
        }];
        //数据库
#warning mark - 数据库
        [XKDataBaseManager constructDataBase];
}
- (void)getIsSign {
//    [XKUserHttpManager sharedInstance].userModel.isSign = self.configModel.isSign;
}
- (void)getUserInfoRequest {
//    if ([KUserConfig isLogin]) {
//        [KUserConfig getUserInfoDetail:^{
//            XK_POST_NOTIFY(KXKUserInfoRefreshNotification);
//        }];
//    }
}
- (void)uploadUserDeviceInfo {
//    NSString *uuid = self.configModel.deviceToken;
//
//    //获取广告id
//    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    //获取设备机型
//    NSString *code = [XKPublicMethodTool getDeviceType];
//    //获取设备版本号
//    NSString *phoneVersion = [UIDevice currentDevice].systemVersion;
//    //获取运营商名称
//    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = [info subscriberCellularProvider];
//    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
//    //手机分辨率CGFloat
//    NSString *resolution = [NSString stringWithFormat:@"%.0fX%.0f", [UIScreen mainScreen].scale*[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].scale*[UIScreen mainScreen].bounds.size.height];
//
//    //获取网络类型
//    NSString *networkType = [XKPublicMethodTool getNetworkType];
//    NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithCapacity:10];
//    [params setObject:[OpenUDID value]?:@"" forKey:@"driveid"];
//    [params setObject:code forKey:@"mobile_model"];
//    [params setObject:@"iPhone" forKey:@"mobile_brand"];
//    [params setObject:phoneVersion forKey:@"system_version"];
//    [params setObject:idfa forKey:@"idfa"];
//    [params setObject:mCarrier forKey:@"apn"];
//    [params setObject:resolution forKey:@"resolution"];
//    if(self.configModel.ipaddress) {
//        [params setObject:self.configModel.ipaddress forKey:@"ipaddress"];
//    }
//    if (networkType) {
//        [params setObject:networkType forKey:@"network"];
//    }
//    [params setObject:uuid?:@"" forKey:@"udid"];
//    [super postHttpWithLoginState:NO urlString:[XKDomainIPManager getHomeModuleUrl:kDeviceInfoAPI] params:params callBack:^(XKHttpResponseStatus status, id  _Nonnull object) {
//    }];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
