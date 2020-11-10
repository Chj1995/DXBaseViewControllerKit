//
//  FMDataBaseManager.m
//  XiongKeLive
//
//  Created by chw on 16/9/08.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//
#import "XKDataBaseManager.h"
#import "SandboxFile.h"
#import "GVUserDefaults+XKProperties.h"
@implementation XKDataBaseManager

+ (void)constructDataBase {
    //拷贝地址信息数据库
    NSString *documentsDirectory = [SandboxFile GetDocumentPath];
    NSString *dbPath =[documentsDirectory stringByAppendingPathComponent:@"addressInfo.db"];

    //BOOL isExit = [SandboxFile IsFileExists:dbPath];
    if ([GVUserDefaults standardUserDefaults].isNeedRecreateAddressDB && [SandboxFile IsFileExists:dbPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:dbPath error:nil];
    }
    if (![SandboxFile IsFileExists:dbPath]) {
        NSString *addressInfoPath = [[NSBundle mainBundle] pathForResource:@"addressInfo" ofType:@"db"];
        if (!addressInfoPath) {
            NSLog(@"读取地址信息数据失败");
        }
        else {
            NSError *error = nil;
            [[NSFileManager defaultManager] copyItemAtPath:addressInfoPath toPath:dbPath error:&error];
            if (error) {
                NSLog(@"拷贝地址信息数据库失败，错误信息：%@",error);
            }
            else {
                NSLog(@"拷贝地址信息：%@",dbPath);
                [GVUserDefaults standardUserDefaults].isNeedRecreateAddressDB = NO;
            }
        }
    }
}

@end
