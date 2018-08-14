#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ARSegmentControllerDelegate.h"
#import "ARSegmentPageController.h"
#import "ARSegmentPageControllerHeaderProtocol.h"
#import "ARSegmentPageHeader.h"
#import "ARSegmentView.h"

FOUNDATION_EXPORT double ARSegmentPagerVersionNumber;
FOUNDATION_EXPORT const unsigned char ARSegmentPagerVersionString[];

