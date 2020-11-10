//
//  NSURL+FMRURLParser.h
// 
//
//  Created by 陈炜来 on 15/11/29.
//  Copyright © 2020年 陈炜来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (FMRURLParser)

- (NSDictionary *)FMR_parseAsPathInfo;

- (NSDictionary *)FMR_parseAsQueryString;

@end
