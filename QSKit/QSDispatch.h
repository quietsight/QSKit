//
//  QSDispatch.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSObject.h"
#import "QSKit_Helper.h"

@class QSDispatch;

typedef enum {
    QSDispatch_High = 0,
    QSDispatch_Normal = 1,
    QSDispatch_Low = 2,
    QSDispatch_Background = 3
} QSDispatch_Priority;


typedef void (^DispatchBlock)(void);
typedef void (^DispatchCompletionHandler)(QSDispatch *dispatch, BOOL completed);

@interface QSDispatch : QSObject
@property (nonatomic, readonly) dispatch_queue_t queue;
@property (nonatomic, readonly) QSDispatch_Priority priority;
@property (nonatomic, strong, readonly) NSString *queueName;
@property (nonatomic, copy) DispatchCompletionHandler completionHandler;

+ (void)dispatchDelay:(double_t)delay block:(void (^)(void))block;


- (void)addDispatchBlock:(DispatchBlock)block;
- (void)addDispatchBlockRun:(DispatchBlock)block;
- (void)removeDispatchBlock:(DispatchBlock)block;

- (void)run;


/**
 *  Initalizers
 */
+ (id)dispatchWithQueueName:(NSString *)queueName;
- (id)initWithQueueName:(NSString *)queueName;
+ (id)dispatchWithQueuePriority:(QSDispatch_Priority)priority;
- (id)initWithQueuePriority:(QSDispatch_Priority)priority;


@end
