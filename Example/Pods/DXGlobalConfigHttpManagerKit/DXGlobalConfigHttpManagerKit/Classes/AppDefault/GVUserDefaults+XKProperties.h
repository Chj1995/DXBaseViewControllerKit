//
//  GVUserDefaults+XKProperties.h
//  XiongKeLive
//
//  Created by shaokailin on 2020/4/26.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>

NS_ASSUME_NONNULL_BEGIN

@interface GVUserDefaults (XKProperties)

#pragma mark - 数据库
@property (nonatomic, assign) BOOL isNeedRecreateAddressDB; //是否需要重新构建地址数据库

#pragma mark - 其他相关

@property (nonatomic, assign) BOOL hadShowStartLiveTip;    //是否同意过开播协议

@property (nonatomic, assign) BOOL hadShowPersonTip;//是否显示过个人引导


#pragma mark - 美颜参数(相芯)
@property (nonatomic, assign) BOOL isSetupDefaultOfMeiYan;  //是否初始化过
@property (nonatomic, assign) BOOL skinDetectEnable ;   // 精准美肤
@property (nonatomic, assign) NSInteger blurShape;      // 美肤类型 (0、1、) 清晰：0，朦胧：1
@property (nonatomic, assign) double blurLevel;         // 磨皮(0.0 - 6.0)
@property (nonatomic, assign) double whiteLevel;        // 美白
@property (nonatomic, assign) double redLevel;          // 红润
@property (nonatomic, assign) double eyelightingLevel;  // 亮眼
@property (nonatomic, assign) double beautyToothLevel;  // 美牙

@property (nonatomic, assign) NSInteger faceShape;        // 脸型 (0、1、2) 女神：0，网红：1，自然：2， 自定义：4
@property (nonatomic, assign) double enlargingLevel;      /**大眼 (0~1)*/
@property (nonatomic, assign) double thinningLevel;       /**瘦脸 (0~1)*/

@property (nonatomic, assign) double enlargingLevel_new;      /**新版大眼 (0~1)*/
@property (nonatomic, assign) double thinningLevel_new;       /**新版瘦脸 (0~1)*/

@property (nonatomic, assign) double jewLevel;            /**下巴 (0~1)*/
@property (nonatomic, assign) double foreheadLevel;       /**额头 (0~1)*/
@property (nonatomic, assign) double noseLevel;           /**鼻子 (0~1)*/
@property (nonatomic, assign) double mouthLevel;          /**嘴型 (0~1)*/

@property (nonatomic, strong) NSString *selectedFilter; /* 选中的滤镜 */
@property (nonatomic, assign) double selectedFilterLevel; /* 选中滤镜的 level*/

@property (nonatomic, strong) NSString *selectedItem;     /**选中的道具名称*/


@property (nonatomic,copy)NSString *mTitle;

@property (nonatomic,copy)NSString *mParam;

@property (nonatomic,assign)float mValue;

/* 双向的参数  0.5是原始值*/
@property (nonatomic,assign) BOOL iSStyle101;

/* 默认值用于，设置默认和恢复 */
@property (nonatomic,assign)float defaultValue;


@property (nonatomic,copy)NSString *beautyParam; //
@property (nonatomic,assign)float beautyValue; //


@end

NS_ASSUME_NONNULL_END
