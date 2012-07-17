//
//  QSDispatch.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSObject.h"
#import "QSKit_Helper.h"


/// QSDispatch is a wrapper around GCD
@class QSDispatch;

/* Dispatch priority. */
typedef enum {
    QSDispatch_High = 0,
    QSDispatch_Normal = 1,
    QSDispatch_Low = 2,
    QSDispatch_Background = 3
} QSDispatch_Priority;

// Forward declaration of DispatchBlock
typedef void (^DispatchBlock)(void);
// Forward declaration of DispatchCompletionHandler
typedef void (^DispatchCompletionHandler)(QSDispatch *dispatch, BOOL completed);

@interface QSDispatch : QSObject



#pragma mark - Properties

/** Dispatch queue
 
 This is the queue that the blocks will be dispatched on
 */
@property (nonatomic, readonly) dispatch_queue_t queue;

/** Priority
 
 The priority that the queue will have
 */
@property (nonatomic, readonly) QSDispatch_Priority priority;

/** name of the queue
 
 This will show in crashlogs and what not...
 
 Reverse domain style is sugested
 */
@property (nonatomic, strong, readonly) NSString *queueName;

/** Completion Handler
 
 This will be called after every block is called.  If it's the last block to be dispatched the passed BOOL will be true
 */
@property (nonatomic, copy) DispatchCompletionHandler completionHandler;



#pragma mark - Instance Methods

/** Add dispatch block to queue
 
 @param block declared as `typedef void (^DispatchBlock)(void);`
 
 */
- (void)addDispatchBlock:(DispatchBlock)block;

/** Add a block to the queue and run the queue
 
 @param block declared as `typedef void (^DispatchBlock)(void);`
 
 */
- (void)addDispatchBlockRun:(DispatchBlock)block;

/** Remove a block from the queue
 
 @param block declared as `typedef void (^DispatchBlock)(void);`
 
 */
- (void)removeDispatchBlock:(DispatchBlock)block;

/** Run the queue
 
 This adds all the queued blocks to the queue.  If the queue is the main thread these opperations will be blocking.
 */
- (void)run;



#pragma mark - Class methods

/** Dispatch Delay
 
 Run the passed block after the passed delay
 */
+ (void)dispatchDelay:(double_t)delay block:(void (^)(void))block;

/** <#Description#>
 
 <#Discussion#>
 */
+ (void)dispatchMainQueue:(DispatchBlock)block;


#pragma mark - Initializers

/** Get a dispatch object with a queue name
 
 */
+ (id)dispatchWithQueueName:(NSString *)queueName;

/** Initalize dispatch queue name
 
 */
- (id)initWithQueueName:(NSString *)queueName;

/** Get a dispatch object with queue priority
 
 */
+ (id)dispatchWithQueuePriority:(QSDispatch_Priority)priority;

/** Initalize dispatch queue priority
 
 */
- (id)initWithQueuePriority:(QSDispatch_Priority)priority;

/** <#Description#>
 
 */
- (id)initWithQueue:(dispatch_queue_t)queue;


@end
