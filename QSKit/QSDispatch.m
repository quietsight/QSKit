//
//  QSDispatch.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSDispatch.h"

@interface QSDispatch () {
    NSMutableSet *_dispatchBlocks;
}

@end

@implementation QSDispatch
@synthesize queue = _queue;
@synthesize priority = _priority;
@synthesize queueName = _queueName;
@synthesize completionHandler = _completionHandler;


+ (void)dispatchDelay:(double_t)delay block:(void (^)(void))block {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        block();
    });
}

+ (void)dispatchMainQueue:(DispatchBlock)block {
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

- (void)addDispatchBlock:(DispatchBlock)block {
    if (_dispatchBlocks == nil) {
        _dispatchBlocks = [NSMutableSet new];
    }
    [_dispatchBlocks addObject:block];
}
- (void)addDispatchBlockRun:(DispatchBlock)block {
    [self addDispatchBlockRun:block];
    [self run];
}
- (void)removeDispatchBlock:(DispatchBlock)block {
    if ([_dispatchBlocks containsObject:block]) {
        [_dispatchBlocks removeObject:block];
    }
}

- (void)run {
    NSArray *array = [_dispatchBlocks allObjects];
    __block NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; i++) {
        dispatch_async(_queue, ^{
            DispatchBlock block = [array objectAtIndex:i];
            block();
            if (_completionHandler != nil) {
                BOOL done = NO;
                if (count - 1 == i) {
                    done = YES;
                }
                _completionHandler(self, done);
            }
        });
    }
}

/**
 *  Initalizers
 */
+ (id)dispatchWithQueueName:(NSString *)queueName {
    QSDispatch *d = [[QSDispatch alloc] initWithQueueName:queueName];
    return d;
}
- (id)initWithQueueName:(NSString *)queueName {
    if (self = [super init]) {
        _queueName = queueName;
        _queue = dispatch_queue_create([_queueName cStringUsingEncoding:NSUTF8StringEncoding], 0ul);
    }
    return self;
}
+ (id)dispatchWithQueuePriority:(QSDispatch_Priority)priority {
    QSDispatch *d = [[QSDispatch alloc] initWithQueuePriority:priority];
    return d;
}
- (id)initWithQueuePriority:(QSDispatch_Priority)priority {
    if (self = [super init]) {
        _priority = priority;
        switch (_priority) {
            case QSDispatch_High:
                _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                break;
            case QSDispatch_Low:
                _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0ul);
                break;
            case QSDispatch_Normal:
                _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
                break;
            case QSDispatch_Background:
                _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0ul);
                break;
            default:
                break;
        }
    }
    return self;
}
- (id)initWithQueue:(dispatch_queue_t)queue {
    if (self = [super init]) {
        _queue = queue;
    }
    return self;
}


@end
