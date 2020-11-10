//
//  NSArray+FMSafe.h
//  XiongKe
//
//  Created by lsk on 2019/12/6.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (FMSafe)

- (id)objectSafeAtIndex:(NSUInteger)index;

- (NSArray *)mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                         fixedItemHeight:(CGFloat)fixedItemHeight
                                        fixedLineSpacing:(CGFloat)fixedLineSpacing
                                   fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                               warpCount:(NSInteger)warpCount
                                              topSpacing:(CGFloat)topSpacing
                                           bottomSpacing:(CGFloat)bottomSpacing
                                             leadSpacing:(CGFloat)leadSpacing
                                             tailSpacing:(CGFloat)tailSpacing;

@end

@interface NSMutableArray (FMSafe)

- (void)addSafeObject:(id)object;
- (void)removeSafeObjectAtIndex:(NSUInteger)index;

@end

@interface NSDictionary (FMSafe)

- (id)objectSafeForKey:(id)aKey;
- (void)setSafeValue:(id)anObject forKey:(id)key;

@end

@interface NSMutableDictionary (FMSafe)

- (void)setSafeObject:(id)anObject forKey:(id)aKey;

@end

NS_ASSUME_NONNULL_END
