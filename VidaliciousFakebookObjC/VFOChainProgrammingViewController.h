//
//  VFOChainProgrammingViewController.h
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/7.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFOChainProgrammingViewController : UIViewController

@end

typedef NSDictionary *_Nullable(^dictionary_appending)(id);

@interface NSDictionary (Chain)

/************************** chain support Attributes **************************/
//NSFontAttributeName
- (dictionary_appending)appendAttributeFont;
//NSParagraphStyleAttributeName
- (dictionary_appending)appendAttributeParagraphStyle;
//NSForegroundColorAttributeName
- (dictionary_appending)appendAttributeForegroundColor;
//NSBackgroundColorAttributeName
- (dictionary_appending)appendAttributeBackgroundColor;
//NSLigatureAttributeName
- (dictionary_appending)appendAttributeLigature;
//NSKernAttributeName
- (dictionary_appending)appendAttributeKern;
//NSStrikethroughStyleAttributeName
- (dictionary_appending)appendAttributeStrikethroughStyle;
//NSUnderlineStyleAttributeName
- (dictionary_appending)appendAttributeUnderlineStyle;
//NSStrokeColorAttributeName
- (dictionary_appending)appendAttributeStrokeColor;
//NSStrokeWidthAttributeName
- (dictionary_appending)appendAttributeStrokeWidth;
//NSShadowAttributeName
- (dictionary_appending)appendAttributeShadow;
//NSTextEffectAttributeName
- (dictionary_appending)appendAttributeTextEffect;
//NSAttachmentAttributeName
- (dictionary_appending)appendAttributeAttachment;
//NSLinkAttributeName
- (dictionary_appending)appendAttributeLink;
//NSBaselineOffsetAttributeName
- (dictionary_appending)appendAttributeBaselineOffset;
//NSUnderlineColorAttributeName
- (dictionary_appending)appendAttributeUnderlineColor;
//NSStrikethroughColorAttributeName
- (dictionary_appending)appendAttributeStrikethroughColor;
//NSObliquenessAttributeName
- (dictionary_appending)appendAttributeObliqueness;
//NSExpansionAttributeName
- (dictionary_appending)appendAttributeExpansion;
//NSWritingDirectionAttributeName
- (dictionary_appending)appendAttributeWritingDirection;
//NSVerticalGlyphFormAttributeName
- (dictionary_appending)appendAttributeVerticalGlyphForm;

- (NSDictionary *(^)(NSString *, id))append;

@end

NS_ASSUME_NONNULL_END
