//
//  VFDefines.h
//  Pods
//
//  Created by vidalicious on 2018/8/13.
//

#ifndef VFDefines_h
#define VFDefines_h

#import <AvailabilityMacros.h>

#undef  UIColorRGBA
#define UIColorRGBA(r, g, b, a)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#undef  UIColorRGB
#define UIColorRGB(r, g, b)             UIColorRGBA(r, g, b, 1.0)

#undef  UIColorHex
#define UIColorHex(X)                   [UIColor colorWithHexString:X]

#undef  UIColorHexA
#define UIColorHexA(X,a)                [UIColor colorWithHexString:X alpha:a]


#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]

#define colorHex(hex) [UIColor colorWithRed:((hex>>16)&0xFF)/255.0 green:((hex>>8)&0xFF)/255.0 blue:((hex)&0xFF)/255.0 alpha:1.0]


//fequal() and fequalzro() from http://stackoverflow.com/a/1614761/184130
#define fequal(a,b) (fabs((a) - (b)) < FLT_EPSILON)
#define fequalzero(a) (fabs(a) < FLT_EPSILON)


#define VFMethodNotImplemented() \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
userInfo:nil]

#endif /* VFDefines_h */
