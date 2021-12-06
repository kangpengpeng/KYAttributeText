//
//  NSAttributedString+KYAttribute.m
//  KYAttributeText
//
//  Created by 康鹏鹏 on 2021/7/23.
//

#import "NSMutableAttributedString+KYAttribute.h"

//#define WEAK_SELF(self) __weak typeof((self)) weakSelf = (self)
//#define STRONG_SELF(weakSelf)

@implementation NSMutableAttributedString (KYAttribute)

/// 初始化
+ (NSMutableAttributedString *)ky_getInstance:(NSString *)string addAttribute:(KYAttributedStringAddBlock)addBlock {
    NSMutableAttributedString *absString = [[NSMutableAttributedString alloc] initWithString:string];
    __weak typeof(absString) weakAbsString = absString;
    addBlock(weakAbsString);
    return weakAbsString;
}
/// 初始化
+ (NSMutableAttributedString * _Nonnull (^)(NSString * _Nonnull string))ky_getInstance {
    __weak typeof(self) weakSelf = self;
    return ^id(NSString * _Nonnull string) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        return [[strongSelf alloc] initWithString:string];
    };
}

/// 添加文本格式
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull, NSAttributedStringKey _Nonnull))ky_addAttributedValueForKey {
    __weak typeof(self) weakSelf = self;
    return ^id(id value, NSAttributedStringKey key) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (key != nil && value != nil) {
            [strongSelf addAttribute:key value:value range:NSMakeRange(0, strongSelf.string.length)];
        }
        return strongSelf;
    };
}
/// 拼接富文本
- (NSMutableAttributedString * _Nonnull (^)(NSMutableAttributedString * _Nonnull))ky_appendAttributedString {
    __weak typeof(self) weakSelf = self;
    return ^id(NSMutableAttributedString *attributedString) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (attributedString.string.length > 0) {
            [strongSelf appendAttributedString:attributedString];
        }
        return strongSelf;
    };
}

- (NSMutableAttributedString * _Nonnull (^)(NSTextAttachment * _Nonnull))ky_appendTextAttachment {
    __weak typeof(self) weakSelf = self;
    return ^id(NSTextAttachment *textAttachment) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (textAttachment == nil) {
            return strongSelf;
        }
        NSAttributedString *tmpAtt = [NSAttributedString attributedStringWithAttachment:textAttachment];
        [strongSelf appendAttributedString:tmpAtt];
        return strongSelf;
    };
}

/// 文本字体
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_fontAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:UIFont.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSFontAttributeName);
    };
}
/// 段落风格（首行、行间距、段落）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_paragraphStyleAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSParagraphStyle.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSParagraphStyleAttributeName);
    };
}
/// 文本颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_foregroundColorAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:UIColor.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSForegroundColorAttributeName);
    };
}

/// 文本背景色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_backgroundColorAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:UIColor.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSBackgroundColorAttributeName);
    };
}

/// 文本连体
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_ligatureAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSLigatureAttributeName);
    };
}
/// 字符间隔，文本间距
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_kernAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSKernAttributeName);
    };
}
/// 字符间隔（效果同上）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_trackingAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSTrackingAttributeName);
    };
}
/// 删除线
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_strikethroughStyleAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSStrikethroughStyleAttributeName);
    };
}
/// 下划线
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_underlineStyleAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSUnderlineStyleAttributeName);
    };
}
/// 文本描边颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_strokeColorAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:UIColor.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSStrokeColorAttributeName);
    };
}
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_strokeWidthAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSStrokeWidthAttributeName);
    };
}
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_shadowAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSShadow.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSShadowAttributeName);
    };
}
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_textEffectAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSTextEffectLetterpressStyle.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSTextEffectAttributeName);
    };
}
/// 超链接
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_linkAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSURL.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSLinkAttributeName);
    };
}
/// 偏移量
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_baselineOffsetAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSBaselineOffsetAttributeName);
    };
}
/// 下划线颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_underlineColorAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:UIColor.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSUnderlineColorAttributeName);
    };
}
/// 删除线颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_strikethroughColorAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:UIColor.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSStrikethroughColorAttributeName);
    };
}
/// 字体倾斜，正值右倾，负值左倾
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_obliquenessAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSObliquenessAttributeName);
    };
}

/// 字体横向拉伸
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_expansionAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSExpansionAttributeName);
    };
}

/// 文本书写方向
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_writingDirectionAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        /**
         typedef NS_ENUM(NSInteger, NSWritingDirection) {
             NSWritingDirectionNatural       = -1,   // Determines direction using the Unicode Bidi Algorithm rules P2 and P3
             NSWritingDirectionLeftToRight   = 0,    // Left to right writing direction
             NSWritingDirectionRightToLeft   = 1     // Right to left writing direction
         }
         
         typedef NS_ENUM(NSInteger, NSWritingDirectionFormatType) {
             NSWritingDirectionEmbedding     = (0 << 1),
             NSWritingDirectionOverride      = (1 << 1)
         }
         
         NSArray of NSNumbers representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.  The control characters can be obtained by masking NSWritingDirection and NSWritingDirectionFormatType values.  LRE: NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding, RLE: 0 | 0 = 0 NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding, LRO: 1 | 0 = 1 NSWritingDirectionLeftToRight|NSWritingDirectionOverride, RLO:  0 | 2 = 2 NSWritingDirectionRightToLeft|NSWritingDirectionOverride,       1 | 2 = 3
         */
        return strongSelf.ky_addAttributedValueForKey(@[value], NSWritingDirectionAttributeName);
    };
}

/// 排版方向
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull))ky_verticalGlyphFormAttributeName {
    __weak typeof(self) weakSelf = self;
    return ^id(id value) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (![value isKindOfClass:NSNumber.class]) {
            return strongSelf;
        }
        return strongSelf.ky_addAttributedValueForKey(value, NSVerticalGlyphFormAttributeName);
    };
}
@end
