//
//  NSObject+HTBKVObservation.h
//  HTBKVO
//
//  Created by Haijiao on 15/6/17.
//  Copyright (c) 2015年 Pumptheory Pty Ltd. All rights reserved.
//

#import "HTBKVObservation.h"

@interface NSObject (HTBKVObservation)

- (void)observe:(id)object keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options callback:(void (^)(HTBKVObservation * observation, NSDictionary * changeDictionary))callbackBlock;

- (void)unobserve:(id)object keyPath:(NSString *)keyPath;

@end
