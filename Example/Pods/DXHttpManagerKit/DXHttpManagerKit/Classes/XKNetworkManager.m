//
//  XKNetworkManager.m
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/22.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKNetworkManager.h"

@interface XKNetworkManager ()
{
//记录是否使用json请求解析，发动态需要用到json请求解析，其余用http请求
    BOOL _isJsonRequest;
}

@end

@implementation XKNetworkManager
static __strong XKNetworkManager *shareInstance = nil;
+ (XKNetworkManager *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[XKNetworkManager alloc]init];
    });
    return shareInstance;;
}
- (instancetype)init {
    if (self = [super init]) {
        _isJsonRequest = NO;
        _isTokenSet = NO;
        _headerData = [NSMutableDictionary dictionaryWithCapacity:4];
        [self setupHeaderData];
        [self setupSerializer];
        [self setupResponseSerializer];
        [self setupSecurityPolity];
        [self checkSecurityPolity];
    }
    return self;
}
#pragma mark - public method
- (NSURLSessionDataTask *)getMethodRequestWithUrl:(NSString *)URLString params:(NSDictionary *)params success:(XKResponseSuccess)success failure:(XKResponseFailure)failure {
    if (_isJsonRequest) {
        _isJsonRequest = NO;
        [self setupSerializer];
    }
    return [self.httpManager GET:URLString parameters:params headers:self.headerData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}
- (NSURLSessionDataTask *)postMethodRequestWithUrl:(NSString *)URLString params:(id)params isJson:(BOOL)isJson success:(XKResponseSuccess)success failure:(XKResponseFailure)failure {
    BOOL isData = [params isKindOfClass:[NSData class]];
    if (isJson && !_isJsonRequest) {
        _isJsonRequest = YES;
    }else if (!isJson && _isJsonRequest) {
        _isJsonRequest = NO;
    }
    NSMutableURLRequest *req = [self.httpManager.requestSerializer requestWithMethod:@"POST" URLString:URLString parameters:!isData?params:nil error:nil];
    for (NSString *key in self.headerData.allKeys) {
        [req setValue:[self.headerData objectForKey:key] forHTTPHeaderField:key];
    }
    req.timeoutInterval = 30;
    if (isJson) {
        [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
    }
    if (isData) {
        [req setHTTPBody:params];
    }
    
    NSURLSessionDataTask *dataTask = [self.httpManager dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            success(nil, responseObject);
        } else {
            failure(nil, error);
        }
    }];
    [dataTask resume];
    return dataTask;
}
- (NSURLSessionDataTask *)postMethodToBodyRequestWithUrl:(NSString *)URLString data:(NSData *)data success:(XKResponseSuccess)success failure:(XKResponseFailure)failure {
   return [self postMethodRequestWithUrl:URLString params:data isJson:YES success:success failure:failure];
}

#pragma mark - private method
- (void)setupSerializer {
    AFHTTPSessionManager *manager = (AFHTTPSessionManager*)self.httpManager;
    AFHTTPRequestSerializer *serializer = nil;
    if(_isJsonRequest) {
        serializer = [AFJSONRequestSerializer serializer];
    } else {
        serializer = [AFHTTPRequestSerializer serializer];
    }
    serializer.timeoutInterval = 30;
    [manager setRequestSerializer:serializer];
}
- (void)setupHeaderData {
    [self.headerData setObject:[[self class] setupHttpRequestHeaderField] forKey:@"h"];
    NSString *openUUID = [OpenUDID value];
    [self.headerData setObject:openUUID forKey:@"driveid"];
    [self setupUserToken];
    [self setupDeviceUDID];
}
- (void)setupResponseSerializer {
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/plain",@"text/json",@"text/javascript", nil];
    [self.httpManager setResponseSerializer:responseSerializer];
}
- (void)setupSecurityPolity {
    NSData *cerData = nil;
#ifdef DEBUG
    cerData = [self loadLocalUnarchiverCer:KSERVER_CERNAME type:KSERVER_CERTYPE];

#else
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"ca" ofType:@"p12"];
    cerData = [NSData dataWithContentsOfFile:cerPath];
#endif
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[NSSet setWithObject:cerData]];

    /// 是否允许使用自签名证书
    securityPolicy.allowInvalidCertificates = YES;
    /// 是否需要验证域名
    securityPolicy.validatesDomainName = YES;

    self.httpManager.securityPolicy = securityPolicy;
    self.httpManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
}
- (void)checkSecurityPolity {
     @weakify(self)
    [self.httpManager setSessionDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession*session, NSURLAuthenticationChallenge *challenge, NSURLCredential *__autoreleasing*_credential) {
            
        NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
            __autoreleasing NSURLCredential *credential =nil;
                SecIdentityRef identity = NULL;
                SecTrustRef trust = NULL;
        @strongify(self)
            NSData *p12Data = nil;
        #ifdef DEBUG
            p12Data = [self loadLocalUnarchiverCer:KSERVER_P12NAME type:KSERVER_P12TYPE];
        #else
            NSString *p12 = [[NSBundle mainBundle] pathForResource:@"prodappclient" ofType:@"p12"];
            p12Data = [NSData dataWithContentsOfFile:p12];
        #endif
        if (!p12Data) {
            DLog(@"client.p12:not exist");
        }else {
            if ([[self class] extractIdentity:&identity andTrust:&trust fromPKCS12Data:p12Data]) {
                SecCertificateRef certificate = NULL;
                SecIdentityCopyCertificate(identity, &certificate);
                const void*certs[] = {certificate};
                CFArrayRef certArray =CFArrayCreate(kCFAllocatorDefault, certs,1,NULL);
                credential =[NSURLCredential credentialWithIdentity:identity certificates:(__bridge  NSArray*)certArray persistence:NSURLCredentialPersistencePermanent];
                disposition =NSURLSessionAuthChallengeUseCredential;
                CFRelease(certArray);
            }
        }
            *_credential = credential;
            return disposition;
        }];
}
- (id)loadLocalUnarchiverCer:(NSString *)name type:(NSString *)type {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:name ofType:type]];
}
#pragma mark - getter
- (AFHTTPSessionManager *)httpManager {
    if (!_httpManager) {
        _httpManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:KSERVER_URL]];
    }
    return _httpManager;;
}
#pragma mark - - headerfield操作
//设置用户的token
- (void)setupUserToken {
//    NSString *string = [KUserConfig getToken];
//    if (KISString(string)) {
//        [self.headerData setObject:string forKey:@"t"];
//        self.isTokenSet = YES;
//    }
}

- (void)setupTempToken:(NSString *)token {
//    NSString *string = nil;
//    if (!KISString(token)) {
//        string = KAPPConfig.configModel.tempToken;
//    } else {
//        string = token;
//    }
//    if (KISString(string)) {
//        [self.headerData setObject:string forKey:@"t1"];
//
//    }
}
- (void)removeUserToken {
//    [self.headerData removeObjectForKey:@"t"];
//    self.isTokenSet = NO;
}
- (void)setupDeviceUDID {
//    NSString *string = KAPPConfig.configModel.deviceToken;
//    if (KISString(string)) {
//        [self.headerData setObject:string forKey:@"udid"];
//    }
}

+ (NSString *)setupHttpRequestHeaderField {
//    NSMutableString *headerField = [NSMutableString string];
//    [headerField appendString:KAPPID];
//    [headerField appendString:[[self class] getClientId]];
//    [headerField appendString:[[self class] getAppVersionNumber]];
//    [headerField appendString:KAPPCANCLE];
    return @"";
}
/**
 *  @return 获取平台Id
 */
+ (NSString *)getClientId {
//    if ([MobClick isJailbroken]) {
//        return @"11";//越狱包
//    }
    return @"10";//iOS普通包
}
/**
 *  @return 标识应用的版本号
 */
+ (NSString *)getAppVersionNumber {
//    NSString *version = KAPPShortVersion;
//    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:@"." ];
//    NSArray *sepArray = [version componentsSeparatedByCharactersInSet:cs];
//    NSMutableArray *finalArray = [sepArray mutableCopy];
//    if (sepArray.count > 0) {
//        NSString *str = [sepArray firstObject];
//        if (str.length == 1) {//首位大本号是 两位，所以不足要补零
//            str = [NSString stringWithFormat:@"0%@",str];
//            [finalArray replaceObjectAtIndex:0 withObject:str];
//        }
//    }
//    for (int i = 0 ;i < (3 - finalArray.count);i++) {//不足3阶 版本号补零
//        [finalArray addObject:@"0"];
//    }
//    //4.3.6=>0436
//    NSString *filtered = [finalArray componentsJoinedByString:@""];
//    return filtered;
    return @"";
}
///为什么用 id 类型呢，因为返回结果有可能是 NSData ，也可能是 NSArray， 也可能是 NSDictionary 完全取决于当初你加密之前是什么类型的。

//void xorString(unsigned char *str, unsigned char key)
//{
//    unsigned char *p = str;
//    while( ((*p) ^=  key) != '\0')  p++;
//}
/**
 **加载PKCS12证书，pfx或p12
 **
 **/
+ (BOOL)extractIdentity:(SecIdentityRef *)outIdentity andTrust:(SecTrustRef *)outTrust fromPKCS12Data:(NSData *)inPKCS12Data {
//    OSStatus securityError = errSecSuccess;
//
//#ifdef DEBUG
//
//
//    unsigned char str[] = {(XOR_KEY ^ '1'),//welcome
//        (XOR_KEY ^ '2'),
//        (XOR_KEY ^ '3'),
//        (XOR_KEY ^ '4'),
//        (XOR_KEY ^ '5'),
//        (XOR_KEY ^ '6'),
//        (XOR_KEY ^ '\0')};
//    xorString(str, XOR_KEY);
//    static unsigned char result[6];
//    memcpy(result, str, 6);
//
//    NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%s",result]
//                                                                  forKey:(__bridge id)kSecImportExportPassphrase];
//
//#else
//
//        unsigned char str[] = {(XOR_KEY ^ 'A'),//welcome
//        (XOR_KEY ^ 'c'),
//        (XOR_KEY ^ 't'),
//        (XOR_KEY ^ 'i'),
//        (XOR_KEY ^ 'o'),
//        (XOR_KEY ^ 'n'),
//        (XOR_KEY ^ 'V'),
//        (XOR_KEY ^ 'a'),
//        (XOR_KEY ^ 'n'),
//        (XOR_KEY ^ 'k'),
//        (XOR_KEY ^ 'e'),
//        (XOR_KEY ^ '8'),
//        (XOR_KEY ^ '1'),
//        (XOR_KEY ^ '3'),
//        (XOR_KEY ^ '\0')};
//    //    ActionVanke813
//        xorString(str, XOR_KEY);
//        static unsigned char result[14];
//        memcpy(result, str, 14);
//
//        NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%s",result]
//                                                                      forKey:(__bridge id)kSecImportExportPassphrase];
//#endif
//
//
//    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
//    securityError = SecPKCS12Import((__bridge CFDataRef)inPKCS12Data,(__bridge CFDictionaryRef)optionsDictionary,&items);
//
//    if(securityError == 0) {
//        CFDictionaryRef myIdentityAndTrust =CFArrayGetValueAtIndex(items,0);
//        const void*tempIdentity = NULL;
//        tempIdentity= CFDictionaryGetValue (myIdentityAndTrust,kSecImportItemIdentity);
//        *outIdentity = (SecIdentityRef)tempIdentity;
//        const void*tempTrust = NULL;
//        tempTrust = CFDictionaryGetValue(myIdentityAndTrust,kSecImportItemTrust);
//        *outTrust = (SecTrustRef)tempTrust;
//        CFRelease(items);
//
//    } else {
//        NSLog(@"Failedwith error code %d",(int)securityError);
//        CFRelease(items);
//        return NO;
//    }
    return YES;
}
@end
