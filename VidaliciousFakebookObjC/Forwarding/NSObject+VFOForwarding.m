//
//  NSObject+VFOForwarding.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/8.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import "NSObject+VFOForwarding.h"

@implementation NSObject (VFOForwarding)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    //方法签名
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"NSObject+CrashLogHandle---在类:%@中 未实现该方法:%@",NSStringFromClass([anInvocation.target class]),NSStringFromSelector(anInvocation.selector));
}

@end
