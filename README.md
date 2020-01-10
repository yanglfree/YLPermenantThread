# YLPermenantThread
封装了一个可以方便使用的线程


YLPermenantThread
内部自动创建了一个thread 并且添加到Runloop中，循环开始运行。

需要工作时，直接调用excuteTask方法

不需要工作时，保持休眠状态

适用于需要频繁启动子线程的场景

对象销毁时，自动停止runloop并释放thread线程
