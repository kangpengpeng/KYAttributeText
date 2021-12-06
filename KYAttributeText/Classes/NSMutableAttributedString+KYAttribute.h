//
//  NSAttributedString+KYAttribute.h
//  KYAttributeText
//
//  Created by 康鹏鹏 on 2021/7/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NSMutableAttributedString;
typedef void(^KYAttributedStringAddBlock)(NSMutableAttributedString *attributedString);

@interface NSMutableAttributedString (KYAttribute)

/// 获取一个实例
+ (NSMutableAttributedString * _Nonnull)ky_getInstance:(NSString *)string addAttribute:(KYAttributedStringAddBlock)addBlock;

/// 获取一个实例
+ (NSMutableAttributedString * _Nonnull (^)(NSString * _Nonnull string))ky_getInstance;

/// 添加文本格式
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value, NSAttributedStringKey _Nonnull key))ky_addAttributedValueForKey;

/// 拼接富文本
- (NSMutableAttributedString * _Nonnull (^)(NSMutableAttributedString *attributedString))ky_appendAttributedString;

/// 拼接图文混排文本
- (NSMutableAttributedString * _Nonnull (^)(NSTextAttachment *textAttachment))ky_appendTextAttachment;

/// 设置 文本字体
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_fontAttributeName;

/// 设置 段落风格（首行、行间距、段落）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_paragraphStyleAttributeName;

/// 设置 文本颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_foregroundColorAttributeName;

/// 设置文本背景色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_backgroundColorAttributeName;

/// 设置文本连体（类似艺术字，需要设置特殊字体，且并非所以字都支持连体）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_ligatureAttributeName;

/// 设置字符间隔，文本间距
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_kernAttributeName;

/// 设置字符间隔，文本间距（效果与 kernAttributeName 基本相同）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_trackingAttributeName;

/// 设置删除线
/// （设置枚举值NSUnderlineStyle。
/// 如果设置数字，0：无线，1-7：依次加粗单线，9-15依次加粗双线，8或8的整倍数：无线）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_strikethroughStyleAttributeName;

/// 设置下划线
/// （设置枚举值NSUnderlineStyle。
/// 如果设置数字，0：无线，1-7：依次加粗单线，9-15依次加粗双线，8或8的整倍数：无线）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_underlineStyleAttributeName;

/// 设置文本描边颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_strokeColorAttributeName;

/// 设置文本描边宽度（正值描边效果，负值镂空效果）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_strokeWidthAttributeName;

/// 设置文本阴影
/// value是NSShadow对象，如果设置了其他属性，如删除线、下划线等，会一并产生阴影效果
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_shadowAttributeName;

/// 设置图版印刷效果（仅有 NSTextEffectLetterpressStyle 一种类型可设置）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_textEffectAttributeName;

/// 设置超链接文本
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_linkAttributeName;

/// 设置偏移（0不偏移，正值上偏，负值下偏）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_baselineOffsetAttributeName;

/// 设置下划线颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_underlineColorAttributeName;

/// 设置删除线颜色
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_strikethroughColorAttributeName;

/// 设置字体倾斜度（正值右倾，负值左倾）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_obliquenessAttributeName;

/// 设置字体横向拉伸（正值拉宽，负值拉窄）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_expansionAttributeName;

/// 设置文本书写方向（value==3 从右——>左）
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_writingDirectionAttributeName;

/// 设置文本排版方向
/// TODO: 暂未测出实际效果
- (NSMutableAttributedString * _Nonnull (^)(id _Nonnull value))ky_verticalGlyphFormAttributeName;

@end

NS_ASSUME_NONNULL_END


