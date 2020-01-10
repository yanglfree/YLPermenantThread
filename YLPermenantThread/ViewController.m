//
//  ViewController.m
//  YLAutoThread
//
//  Created by yl on 2020/1/10.
//  Copyright © 2020 yl. All rights reserved.
//

#import "ViewController.h"
#import "YLPermenantThread.h"

@interface ViewController ()

@property (nonatomic, strong) YLPermenantThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thread = [[YLPermenantThread alloc] init];
}

- (IBAction)stop:(id)sender
{
    [self.thread stop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.thread excuteTask:^{
        NSLog(@"执行子线程任务-------");
    }];
    NSLog(@"%@---- 屏幕被点击了", [NSThread currentThread]);
}

- (void)dealloc
{
    NSLog(@"vc被销毁了 %@", [NSThread currentThread]);
}

@end
