//
//  LiveDefine.h
//  XiongKeLive
//
//  Created by 王俊翔 on 16/3/14.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#ifndef LiveDefine_h
#define LiveDefine_h

//主播开播状态 0休息（结束）， 1正常，2禁播
typedef enum : int {
    LiveAnchorStatusEnd = 0,
    LiveAnchorStatusNormal = 1,
    LiveAnchorStatusForForbidden = 2,

} LiveAnchorStatus;


//禁言的几种级别
typedef NS_ENUM(NSInteger , ForbitSendMsgOperateType) {
    ForbitSendMsgOperateTypeForbit = 1,
    ForbitSendMsgOperateTypeCancelForbit = 2,
    ForbitSendMsgOperateTypeForbitShort = 3,
    ForbitSendMsgOperateTypeForbitLong = 4,
    ForbitSendMsgOperateTypeForbitGlobal = 5,
    ForbitSendMsgOperateTypeForbitForever = 6,
    
};

#define LiveFollowListUpdateNotication @"LiveFollowListUpdateNotication"

#define LiveUserTicketId [XKUserHttpManagerUtil getToken]

#define LiveCommonPaddingLeft (XKFixWidth(10))

//礼物界面高度，也是游戏界面高度
#define LiveCommonGiftViewHeight (XKFixWidth(200))

#define kCheerViewBottomOffset  (XKFixWidth(59))
#define kCheerViewRightOffset   (XKFixWidth(-10))
#define kCheerViewWidth         (XKFixWidth(70))
#define kCheerViewHeight        (XKFixWidth(445))
#define kCheerViewAnimationTotalDuration 2.8
#define kCheerViewAnimationFadeOutDuration 1
#define kCheerViewAnimationScaleDuration 0.6
#define kCheerViewAnimationFadeInDuration 0.5
#define kCheerDurationEachMessage 10
#define kCheerViewCheerMaxHeight (XKFixWidth(266))
#define kCheerViewBigCheerMaxHeight (XKFixWidth(445))

#endif /* LiveDefine_h */
