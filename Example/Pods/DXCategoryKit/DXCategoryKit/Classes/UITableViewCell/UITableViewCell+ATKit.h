//
//  UITableViewCell+ATKit.h
//  Postre
//
//  Created by CoderLT on 2017/5/23.
//  Copyright © 2020年 CoderLT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ATKit)
+ (CGFloat)cellHeight;

+ (instancetype)cellForTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath;
+ (instancetype)cellForTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath
                          config:(void (^NS_NOESCAPE)(__kindof UITableViewCell *cell))config;
+ (instancetype)cellForTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath
                      identifier:(NSString *)identifier
                          config:(void (^NS_NOESCAPE)(__kindof UITableViewCell *cell))config;
@end
