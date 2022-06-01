# KYAttributeText

[![CI Status](https://img.shields.io/travis/kangpengpeng/KYAttributeText.svg?style=flat)](https://travis-ci.org/kangpengpeng/KYAttributeText)
[![Version](https://img.shields.io/cocoapods/v/KYAttributeText.svg?style=flat)](https://cocoapods.org/pods/KYAttributeText)
[![License](https://img.shields.io/cocoapods/l/KYAttributeText.svg?style=flat)](https://cocoapods.org/pods/KYAttributeText)
[![Platform](https://img.shields.io/cocoapods/p/KYAttributeText.svg?style=flat)](https://cocoapods.org/pods/KYAttributeText)

## Example

使用方式一：
    NSMutableAttributedString.ky_getInstance(@"这是一个首行缩进的效果")
    .ky_firstLineHeadIndent(@30)
    .ky_foregroundColorAttributeName([UIColor whiteColor])
    .ky_fontAttributeName([UIFont systemFontOfSize:30])
    .ky_underlineColorAttributeName([UIColor greenColor])
    .ky_underlineStyleAttributeName(@2);

使用方式二：
    NSMutableAttributedString *bodyAtt = [NSMutableAttributedString ky_getInstance:@"窗前明月光\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
        attributedString.ky_foregroundColorAttributeName([UIColor greenColor]);
        attributedString.ky_fontAttributeName([UIFont systemFontOfSize:16]);
    }]
    .ky_appendAttributedString([NSMutableAttributedString ky_getInstance:@"疑似地上霜\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
    attributedString
        .ky_underlineColorAttributeName([UIColor greenColor])
        .ky_underlineStyleAttributeName(@2)
        .ky_foregroundColorAttributeName([UIColor whiteColor])
        .ky_fontAttributeName([UIFont systemFontOfSize:FONTSIZE_BODY]);
    }])
    .ky_paragraphStyleAttributeName(style);

## Requirements

## Installation

KYAttributeText is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KYAttributeText', '~> 0.1.0'
```

## Author

kangpengpeng, 353327533@qq.com, kangpp@163.com

## License

KYAttributeText is available under the MIT license. See the LICENSE file for more info.
