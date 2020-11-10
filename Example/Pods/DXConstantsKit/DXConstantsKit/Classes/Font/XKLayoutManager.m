//
//  FMLayoutManager.m
//  XiongKeLive
//
//  Created by chw on 16/6/6.
//  Copyright © 2020年 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "XKLayoutManager.h"
#import "XKConstants.h"

@implementation XKLayoutManager

+(instancetype)shareInstance
{
    static XKLayoutManager* shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[XKLayoutManager alloc]init];
        [shareManager fmCurrentInit];
    });
    return shareManager;
}
-(void)fmDefault
{
    self.fmWidthBase  = 1;
    self.fmHeightBase = 1;
    self.fmFontBase   = 1;
    self.xkFont_8     = 8;
    self.xkFont_9     = 9;
    self.xkFont_10    = 10;
    self.xkFont_11    = 11;
    self.xkFont_12    = 12;
    self.xkFont_13    = 13;
    self.xkFont_14    = 14;
    self.xkFont_15    = 15;
    self.xkFont_16    = 16;
    self.xkFont_17    = 17;
    self.xkFont_18    = 18;
    self.xkFont_19    = 19;
    self.xkFont_20    = 20;
    self.xkFont_22    = 22;
    self.xkFont_23    = 23;
    self.xkFont_24    = 24;
    self.xkFont_27    = 27;
    self.xkFont_29    = 29;
    self.xkFont_30    = 30;
    self.xkFont_32    = 32;
    self.xkFont_36    = 36;
    self.xkFont_40    = 40;
    self.xkFont_50    = 50;
    self.xkFont_70    = 70;
    
    self.fmLeftMargin = 16;
    self.fmRightMargin = 16;
    
    if (IS_PhoneXAll)
    {
        self.fmStatusBarHeight = 44;
        self.fmTopBarHeight = 88;
        self.fmBottomBarHeight = 49+34;
        self.fmBottomBaseLineInset = 34;
    }
    else
    {
        self.fmStatusBarHeight = 20;
        self.fmTopBarHeight = 64;
        self.fmBottomBarHeight = 49;
        self.fmBottomBaseLineInset = 0;
    }
}

-(void)fmCurrentInit
{
    [self fmDefault];
    
    //默认用4.7寸屏布局
//    if(iPhone4)
//    {
//        self.fmWidthBase  = 1;
//        self.fmHeightBase = 1;
//        self.fmFontBase   = 1;
//    }
//    else if (iPhone5)
//    {
//        self.fmWidthBase  = 1;
//        self.fmHeightBase = 1;
//        self.fmFontBase   = 1;
//        
//    }
//    else
    if (iPhone6p)
    {
        self.fmWidthBase  = 1.104;
        self.fmHeightBase = 1.104;
        self.fmFontBase   = 1.104;
        
        self.fmLeftMargin *= 1.104;
        self.fmRightMargin *= 1.104;
    }
    self.xkFont_8 = floor(self.xkFont_8*self.fmFontBase);
    self.xkFont_9 = floor(self.xkFont_9*self.fmFontBase);
    self.xkFont_10 = floor(self.xkFont_10*self.fmFontBase);
    self.xkFont_11 = floor(self.xkFont_11*self.fmFontBase);
    self.xkFont_12 = floor(self.xkFont_12*self.fmFontBase);
    self.xkFont_13 = floor(self.xkFont_13*self.fmFontBase);
    self.xkFont_14 = floor(self.xkFont_14*self.fmFontBase);
    self.xkFont_15 = floor(self.xkFont_15*self.fmFontBase);
    self.xkFont_16 = floor(self.xkFont_16*self.fmFontBase);
    self.xkFont_17 = floor(self.xkFont_17*self.fmFontBase);
    self.xkFont_18 = floor(self.xkFont_18*self.fmFontBase);
    self.xkFont_19 = floor(self.xkFont_19*self.fmFontBase);
    self.xkFont_20 = floor(self.xkFont_20*self.fmFontBase);
    self.xkFont_22 = floor(self.xkFont_22*self.fmFontBase);
    self.xkFont_23 = floor(self.xkFont_23*self.fmFontBase);
    self.xkFont_24 = floor(self.xkFont_24*self.fmFontBase);
    self.xkFont_27 = floor(self.xkFont_27*self.fmFontBase);
    self.xkFont_29 = floor(self.xkFont_29*self.fmFontBase);
    self.xkFont_30 = floor(self.xkFont_30*self.fmFontBase);
    self.xkFont_32 = floor(self.xkFont_32*self.fmFontBase);
    self.xkFont_36 = floor(self.xkFont_36*self.fmFontBase);
    self.xkFont_40 = floor(self.xkFont_40*self.fmFontBase);
    self.xkFont_50 = floor(self.xkFont_50*self.fmFontBase);
    self.xkFont_70 = floor(self.xkFont_70*self.fmFontBase);
    
    self.fmNavTitleFont = [UIFont systemFontOfSize:self.xkFont_18 weight:UIFontWeightMedium];
    
    [self fmResetFont:nil];
}

-(void)fmResetFont:(NSString*)fontName
{
    if(fontName)
    {
        self.xkDefaultFont_8 = [UIFont fontWithName:fontName size:self.xkFont_8];
        self.xkDefaultFont_9 = [UIFont fontWithName:fontName size:self.xkFont_9];
        self.xkDefaultFont_10 = [UIFont fontWithName:fontName size:self.xkFont_10];
        self.xkDefaultFont_11 = [UIFont fontWithName:fontName size:self.xkFont_11];
        self.xkDefaultFont_12 = [UIFont fontWithName:fontName size:self.xkFont_12];
        self.xkDefaultFont_13 = [UIFont fontWithName:fontName size:self.xkFont_13];
        self.xkDefaultFont_14 = [UIFont fontWithName:fontName size:self.xkFont_14];
        self.xkDefaultFont_15 = [UIFont fontWithName:fontName size:self.xkFont_15];
        self.xkDefaultFont_16 = [UIFont fontWithName:fontName size:self.xkFont_16];
        self.xkDefaultFont_17 = [UIFont fontWithName:fontName size:self.xkFont_17];
        self.xkDefaultFont_18 = [UIFont fontWithName:fontName size:self.xkFont_18];
        self.xkDefaultFont_19 = [UIFont fontWithName:fontName size:self.xkFont_19];
        self.xkDefaultFont_20 = [UIFont fontWithName:fontName size:self.xkFont_20];
        self.xkDefaultFont_22 = [UIFont fontWithName:fontName size:self.xkFont_22];
        self.xkDefaultFont_23 = [UIFont fontWithName:fontName size:self.xkFont_23];
        self.xkDefaultFont_24 = [UIFont fontWithName:fontName size:self.xkFont_24];
        self.xkDefaultFont_27 = [UIFont fontWithName:fontName size:self.xkFont_27];
        self.xkDefaultFont_29 = [UIFont fontWithName:fontName size:self.xkFont_29];
        self.xkDefaultFont_32 = [UIFont fontWithName:fontName size:self.xkFont_32];
        self.xkDefaultFont_36 = [UIFont fontWithName:fontName size:self.xkFont_36];
        self.xkDefaultFont_40 = [UIFont fontWithName:fontName size:self.xkFont_40];
        self.xkDefaultFont_50 = [UIFont fontWithName:fontName size:self.xkFont_50];
        self.xkDefaultFont_70 = [UIFont fontWithName:fontName size:self.xkFont_70];
    }
    else
    {
        self.xkDefaultFont_8 = [UIFont systemFontOfSize:self.xkFont_8];
        self.xkDefaultFont_9 = [UIFont systemFontOfSize:self.xkFont_9];
        self.xkDefaultFont_10 = [UIFont systemFontOfSize:self.xkFont_10];
        self.xkDefaultFont_11 = [UIFont systemFontOfSize:self.xkFont_11];
        self.xkDefaultFont_12 = [UIFont systemFontOfSize:self.xkFont_12];
        self.xkDefaultFont_13 = [UIFont systemFontOfSize:self.xkFont_13];
        self.xkDefaultFont_14 = [UIFont systemFontOfSize:self.xkFont_14];
        self.xkDefaultFont_15 = [UIFont systemFontOfSize:self.xkFont_15];
        self.xkDefaultFont_16 = [UIFont systemFontOfSize:self.xkFont_16];
        self.xkDefaultFont_17 = [UIFont systemFontOfSize:self.xkFont_17];
        self.xkDefaultFont_18 = [UIFont systemFontOfSize:self.xkFont_18];
        self.xkDefaultFont_19 = [UIFont systemFontOfSize:self.xkFont_19];
        self.xkDefaultFont_20 = [UIFont systemFontOfSize:self.xkFont_20];
        self.xkDefaultFont_22 = [UIFont systemFontOfSize:self.xkFont_22];
        self.xkDefaultFont_24 = [UIFont systemFontOfSize:self.xkFont_24];
        self.xkDefaultFont_27 = [UIFont systemFontOfSize:self.xkFont_27];
        self.xkDefaultFont_29 = [UIFont systemFontOfSize:self.xkFont_29];
        self.xkDefaultFont_32 = [UIFont systemFontOfSize:self.xkFont_32];
        self.xkDefaultFont_36 = [UIFont systemFontOfSize:self.xkFont_36];
        self.xkDefaultFont_40 = [UIFont systemFontOfSize:self.xkFont_40];
        self.xkDefaultFont_50 = [UIFont systemFontOfSize:self.xkFont_50];
        self.xkDefaultFont_70 = [UIFont systemFontOfSize:self.xkFont_70];
        
        self.xkBlodFont_9=[UIFont boldSystemFontOfSize:self.xkFont_9];
        self.xkBlodFont_10=[UIFont boldSystemFontOfSize:self.xkFont_10];
        self.xkBlodFont_11=[UIFont boldSystemFontOfSize:self.xkFont_11];
        self.xkBlodFont_12=[UIFont boldSystemFontOfSize:self.xkFont_12];
        self.xkBlodFont_13=[UIFont boldSystemFontOfSize:self.xkFont_13];
        self.xkBlodFont_14=[UIFont boldSystemFontOfSize:self.xkFont_14];
        self.xkBlodFont_15=[UIFont boldSystemFontOfSize:self.xkFont_15];
        self.xkBlodFont_16=[UIFont boldSystemFontOfSize:self.xkFont_16];
        self.xkBlodFont_17=[UIFont boldSystemFontOfSize:self.xkFont_17];
        self.xkBlodFont_18=[UIFont boldSystemFontOfSize:self.xkFont_18];
        self.xkBlodFont_19=[UIFont boldSystemFontOfSize:self.xkFont_19];
        self.xkBlodFont_20=[UIFont boldSystemFontOfSize:self.xkFont_20];
        self.xkBlodFont_22=[UIFont boldSystemFontOfSize:self.xkFont_22];
        self.xkBlodFont_23=[UIFont boldSystemFontOfSize:self.xkFont_23];
        self.xkBlodFont_24=[UIFont boldSystemFontOfSize:self.xkFont_24];
        self.xkBlodFont_27=[UIFont boldSystemFontOfSize:self.xkFont_27];
        self.xkBlodFont_30=[UIFont boldSystemFontOfSize:self.xkFont_30];

    }
    
}

- (UIFont*)font1
{
    return self.xkDefaultFont_10;
}

- (UIFont*)font2
{
    return self.xkDefaultFont_12;
}

- (UIFont*)font3
{
    return self.xkDefaultFont_13;
}

- (UIFont*)font4
{
    return self.xkDefaultFont_14;
}

- (UIFont*)font5
{
    return self.xkDefaultFont_15;
}

- (UIFont*)font6
{
    return self.xkDefaultFont_16;
}

- (UIFont*)font7
{
    return self.xkDefaultFont_17;
}

- (UIFont*)font8
{
    return self.xkDefaultFont_18;
}

- (UIFont*)font9
{
    return self.xkDefaultFont_20;
}

- (UIFont*)font10
{
    return self.xkDefaultFont_22;
}

- (UIFont*)font11
{
    return self.xkDefaultFont_24;
}

- (UIFont*)font12
{
    return self.xkDefaultFont_30;
}

- (UIFont*)font13
{
    return self.xkDefaultFont_32;
}

- (UIFont*)font14
{
    return self.xkDefaultFont_36;
}

- (UIFont*)font15
{
    return self.xkDefaultFont_40;
}

- (UIFont*)font16
{
    return self.xkDefaultFont_50;
}

- (UIFont*)font17
{
    return self.xkDefaultFont_70;
}

@end
