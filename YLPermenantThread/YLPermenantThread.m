//
//  YLAutoThread.m
//  YLAutoThread
//
//  Created by yl on 2020/1/10.
//  Copyright © 2020 yl. All rights reserved.
//

#import "YLPermenantThread.h"

@interface YLPermenantThread()

@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, assign, getter=isStopped) BOOL stopped; //runloop停止的标记

@end

@implementation YLPermenantThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stopped = NO;
         __weak typeof(self) weakSelf = self;
        self.thread = [[NSThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
                   while (weakSelf && !weakSelf.isStopped) {
                       [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
                   }
        }];
        [self.thread start];
    }
    return self;
}

/**
 stop runloop
 */
- (void)stop
{
    if (!self.thread) return;
    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)__stop
{
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

/**
 执行线程任务
 */
- (void)excuteTask:(ThreadExcutedTask)task
{
    if (!self.thread || !task) return;
    [self performSelector:@selector(doTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}

- (void)doTask:(ThreadExcutedTask)task
{
    task();
}

- (void)dealloc
{
    [self stop];
}

@end
