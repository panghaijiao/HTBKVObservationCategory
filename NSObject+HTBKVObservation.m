//
//  NSObject+HTBKVObservation.m
//  HTBKVO
//
//  Created by Haijiao on 15/6/17.
//  Copyright (c) 2015年 Pumptheory Pty Ltd. All rights reserved.
//

#import "NSObject+HTBKVObservation.h"
#import <objc/runtime.h>

@implementation NSObject (HTBKVObservation)

- (void)observe:(id)object keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options callback:(void (^)(HTBKVObservation * observation, NSDictionary * changeDictionary))callbackBlock {
    HTBKVObservation *observation = [HTBKVObservation observe:object keyPath:keyPath options:options callback:callbackBlock];
    NSMutableArray *observations = [self KVOObservations];
    BOOL isExist = NO;
    for (HTBKVObservation *observe in observations.objectEnumerator) {
        if (observe.observedObject == observation.observedObject && [observe.keyPath isEqualToString:observation.keyPath]) {
            isExist = YES;
            continue;
        }
    }
    if (isExist) {
        return;
    }
    @synchronized(observations){
        [observations addObject:observation];
    }
}

- (void)unobserve:(id)object keyPath:(NSString *)keyPath {
    if (!object || keyPath.length < 1) {
        return;
    }
    NSMutableArray *observations = [self KVOObservations];
    for (HTBKVObservation *observation in observations.objectEnumerator) {
        if (observation.observedObject == object && [observation.keyPath isEqualToString:keyPath]) {
            [observation invalidate];
            @synchronized(observations){
                [observations removeObject:observation];
            }
            [self setKVOObservations:observations];
            break;
        }
    }
}

- (NSMutableArray *)KVOObservations {
    NSMutableArray *observations = objc_getAssociatedObject(self, @selector(KVOObservations));
    if (nil == observations) {
        observations = [NSMutableArray array];
        [self setKVOObservations:observations];
    }
    return observations;
}

- (void)setKVOObservations:(NSMutableArray *)KVOObservations {
    objc_setAssociatedObject(self, @selector(KVOObservations), KVOObservations, OBJC_ASSOCIATION_RETAIN);
}

@end
