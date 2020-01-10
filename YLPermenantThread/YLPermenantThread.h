//
//  YLAutoThread.h
//  YLAutoThread
//
//  Created by yl on 2020/1/10.
//  Copyright © 2020 yl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ThreadExcutedTask)(void);

/**
 easy to manage a thread , easy to run ,excute task  and stop
 */
@interface YLPermenantThread : NSObject

/**
 excute task
 */
- (void)excuteTask:(ThreadExcutedTask)task;

/**
 stop runloop
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
