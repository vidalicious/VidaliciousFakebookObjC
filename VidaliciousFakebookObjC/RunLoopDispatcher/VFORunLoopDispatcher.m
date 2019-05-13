//
//  VFORunLoopDispatcher.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/7.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import "VFORunLoopDispatcher.h"
#import <objc/runtime.h>

@interface VFORunLoopDispatcher ()

@property (nonatomic, strong) NSMutableArray *keys;
@property (nonatomic, strong) NSMutableArray *tasks;

@end

@implementation VFORunLoopDispatcher

+ (instancetype)sharedDispatcher {
    static VFORunLoopDispatcher *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = self.new;
        [self _registerRunLoopDispatcherAsMainRunloopObserver:_sharedInstance];
    });
    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.maxQueueCount = 300;
        self.keys = @[].mutableCopy;
        self.tasks = @[].mutableCopy;
    }
    return self;
}

- (void)addTaskWithKey:(id)key task:(BOOL(^)(void))task {
    NSAssert(key, @"invalid key");
    NSAssert(task, @"invalid task");
    [self.keys addObject:key];
    [self.tasks addObject:task];
    if (self.keys.count > self.maxQueueCount) {
        [self.keys removeObjectAtIndex:0];
        [self.tasks removeObjectAtIndex:0];
    }
}

- (void)removeAllTasks {
    [self.keys removeAllObjects];
    [self.tasks removeAllObjects];
}

+ (void)_registerRunLoopDispatcherAsMainRunloopObserver:(VFORunLoopDispatcher *)runLoopDispatcher {
    static CFRunLoopObserverRef defaultModeObserver;
    _registerObserver(kCFRunLoopBeforeWaiting, defaultModeObserver, NSIntegerMax - 999, kCFRunLoopDefaultMode, (__bridge void *)runLoopDispatcher, &_defaultModeRunLoopDispatcherCallback);
}

static void _registerObserver(CFOptionFlags activities, CFRunLoopObserverRef observer, CFIndex order, CFStringRef mode, void *info, CFRunLoopObserverCallBack callback) {
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext context = {
        0,
        info,
        &CFRetain,
        &CFRelease,
        NULL
    };
    observer = CFRunLoopObserverCreate(NULL,
                                       activities,
                                       YES,
                                       order,
                                       callback,
                                       &context);
    CFRunLoopAddObserver(runLoop, observer, mode);
    CFRelease(observer);
}

static void _defaultModeRunLoopDispatcherCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    VFORunLoopDispatcher *dispatcher = (__bridge VFORunLoopDispatcher *)info;
    if (dispatcher.tasks.count == 0) {
        return;
    }
    BOOL result = NO;
    while (result == NO && dispatcher.tasks.count) {
        BOOL(^task)(void)  = dispatcher.tasks.firstObject;
        result = task();
        [dispatcher.tasks removeObjectAtIndex:0];
        [dispatcher.keys removeObjectAtIndex:0];
    }
}

@end

@implementation UITableViewCell (VFORunLoopDispatcher)

- (NSIndexPath *)currentIndexPath {
    NSIndexPath *indexPath = objc_getAssociatedObject(self, @selector(currentIndexPath));
    return indexPath;
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    objc_setAssociatedObject(self, @selector(currentIndexPath), currentIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
