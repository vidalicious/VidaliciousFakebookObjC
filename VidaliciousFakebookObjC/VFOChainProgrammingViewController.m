//
//  VFOChainProgrammingViewController.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/7.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import "VFOChainProgrammingViewController.h"

static inline id _dictionaryWithValue(id dictionary, id value, NSString *key) {
    if ([dictionary isKindOfClass:[NSMutableDictionary class]]) {
        [dictionary setValue:value forKey:key];
        return dictionary;
    } else if ([dictionary isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        [mutableDic setValue:value forKey:key];
        return mutableDic;
    } else {
        return dictionary;
    }
}

@implementation NSDictionary (Brick)

//NSFontAttributeName
- (dictionary_appending)appendAttributeFont {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSFontAttributeName);
    };
}
//NSParagraphStyleAttributeName
- (dictionary_appending)appendAttributeParagraphStyle {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSParagraphStyleAttributeName);
    };
}
//NSForegroundColorAttributeName
- (dictionary_appending)appendAttributeForegroundColor {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSForegroundColorAttributeName);
    };
}
//NSBackgroundColorAttributeName
- (dictionary_appending)appendAttributeBackgroundColor {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSBackgroundColorAttributeName);
    };
}
//NSLigatureAttributeName
- (dictionary_appending)appendAttributeLigature {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSLigatureAttributeName);
    };
}
//NSKernAttributeName
- (dictionary_appending)appendAttributeKern {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSKernAttributeName);
    };
}
//NSStrikethroughStyleAttributeName
- (dictionary_appending)appendAttributeStrikethroughStyle {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSStrikethroughStyleAttributeName);
    };
}
//NSUnderlineStyleAttributeName
- (dictionary_appending)appendAttributeUnderlineStyle {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSUnderlineStyleAttributeName);
    };
}
//NSStrokeColorAttributeName
- (dictionary_appending)appendAttributeStrokeColor {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSStrokeColorAttributeName);
    };
}
//NSStrokeWidthAttributeName
- (dictionary_appending)appendAttributeStrokeWidth {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSStrokeWidthAttributeName);
    };
}
//NSShadowAttributeName
- (dictionary_appending)appendAttributeShadow {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSShadowAttributeName);
    };
}
//NSTextEffectAttributeName
- (dictionary_appending)appendAttributeTextEffect {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSTextEffectAttributeName);
    };
}
//NSAttachmentAttributeName
- (dictionary_appending)appendAttributeAttachment {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSAttachmentAttributeName);
    };
}
//NSLinkAttributeName
- (dictionary_appending)appendAttributeLink {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSLinkAttributeName);
    };
}
//NSBaselineOffsetAttributeName
- (dictionary_appending)appendAttributeBaselineOffset {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSBaselineOffsetAttributeName);
    };
}
//NSUnderlineColorAttributeName
- (dictionary_appending)appendAttributeUnderlineColor {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSUnderlineColorAttributeName);
    };
}
//NSStrikethroughColorAttributeName
- (dictionary_appending)appendAttributeStrikethroughColor {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSStrikethroughColorAttributeName);
    };
}
//NSObliquenessAttributeName
- (dictionary_appending)appendAttributeObliqueness {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSObliquenessAttributeName);
    };
}
//NSExpansionAttributeName
- (dictionary_appending)appendAttributeExpansion {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSExpansionAttributeName);
    };
}
//NSWritingDirectionAttributeName
- (dictionary_appending)appendAttributeWritingDirection {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSWritingDirectionAttributeName);
    };
}
//NSVerticalGlyphFormAttributeName
- (dictionary_appending)appendAttributeVerticalGlyphForm {
    return ^id(id attribute) {
        return _dictionaryWithValue(self, attribute, NSVerticalGlyphFormAttributeName);
    };
}

- (NSDictionary *(^)(NSString *, id))append {
    return ^id(NSString *key, id value) {
        return _dictionaryWithValue(self, value, key);
    };
}

@end

@interface VFOChainProgrammingViewController ()

@end

@implementation VFOChainProgrammingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    NSDictionary *dic = @{}.append(@"a", @"aa").append(@"b", @"bb").append(@"c", @"cc");
    NSLog(dic.description);
}



@end
