//
//  NSData+FMRouterTrans.h
//  MyStoryTest
//
//  Created by 陈炜来 on 15/11/30.
//  Copyright © 2020年 陈炜来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (FMRouterTrans)
+ (NSArray*)XK_arrayWithJSONData:(NSData*)data;
+ (NSDictionary*)XK_dictionaryWithJSONData:(NSData*)data;
@end
@interface NSObject(FMRouterDataConvert)
/**
 *  @brief  data 或者  string 转 jsonObject
 */
-(id)XK_jsonObject;

/**
 *  @brief jsonObject to json data
 */
-(NSData*)XK_jsonData;

/**
 *  @brief jsonObject  to json string
 */
-(NSString*)XK_jsonString;

@end
