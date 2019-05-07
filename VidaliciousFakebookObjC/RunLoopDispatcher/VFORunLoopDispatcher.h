//
//  VFORunLoopDispatcher.h
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/7.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFORunLoopDispatcher : NSObject

@property (nonatomic, assign) NSUInteger maxQueueCount;

+ (instancetype)sharedDispatcher;

- (void)addTaskWithKey:(id)key task:(BOOL(^)(void))task;
- (void)removeAllTasks;

@end

@interface UITableViewCell (VFORunLoopDispatcher)

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end

NS_ASSUME_NONNULL_END
