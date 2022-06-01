//
//  KYViewController.m
//  KYAttributeText
//
//  Created by kangpengpeng on 12/07/2021.
//  Copyright (c) 2021 kangpengpeng. All rights reserved.
//

#import "KYViewController.h"
#import <KYAttributeText/NSMutableAttributedString+KYAttribute.h>

// 标题字号
#define FONTSIZE_TITLE  25
// 正文字号
#define FONTSIZE_BODY   20

@interface KYViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;
@end

@implementation KYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.textView.center = self.view.center;
    [self.view addSubview:self.textView];
    
    //self.textView.attributedText = [self getAttributedString_01];
    self.textView.attributedText = [self getAttributedString_02];
    self.textView.delegate = self;
    self.textView.backgroundColor = [UIColor redColor];
}

/// 简单富文本效果
- (NSAttributedString *)getAttributedString_01 {
    return
    NSMutableAttributedString.ky_getInstance(@"这是一个首行缩进的效果")
    .ky_firstLineHeadIndent(@30)
    .ky_foregroundColorAttributeName([UIColor whiteColor])
    .ky_fontAttributeName([UIFont systemFontOfSize:30])
    .ky_underlineColorAttributeName([UIColor greenColor])
    .ky_underlineStyleAttributeName(@2);
}

/// 复杂富文本效果，建议使用该方式分段实现进行拼接
- (NSAttributedString *)getAttributedString_02 {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    style.lineSpacing = 30;
    
    NSMutableAttributedString *titleAtt = [NSMutableAttributedString ky_getInstance:@"静夜思\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
        attributedString.ky_addAttributedValueForKey(style, NSParagraphStyleAttributeName);
        attributedString.ky_addAttributedValueForKey([UIFont boldSystemFontOfSize:FONTSIZE_TITLE], NSFontAttributeName);
    }];
    
    NSMutableAttributedString *bodyAtt = [NSMutableAttributedString ky_getInstance:@"窗前明月光\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
        attributedString.ky_foregroundColorAttributeName([UIColor greenColor]);
        attributedString.ky_fontAttributeName([UIFont systemFontOfSize:FONTSIZE_BODY]);
    }]
    .ky_appendAttributedString([NSMutableAttributedString ky_getInstance:@"疑似地上霜\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
        attributedString
            .ky_underlineColorAttributeName([UIColor greenColor])
            .ky_underlineStyleAttributeName(@2)
            .ky_foregroundColorAttributeName([UIColor whiteColor])
            .ky_fontAttributeName([UIFont systemFontOfSize:FONTSIZE_BODY]);
    }])
    .ky_appendAttributedString([NSMutableAttributedString ky_getInstance:@"举头望明月\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
        
    }])
    .ky_appendAttributedString([NSMutableAttributedString ky_getInstance:@"低头思故乡\n" addAttribute:^(NSMutableAttributedString * _Nonnull attributedString) {
        attributedString.ky_linkAttributeName([NSURL URLWithString:@"https://github.com/kangpengpeng/KYAttributeText"]);
    }])
    .ky_paragraphStyleAttributeName(style)
    .ky_fontAttributeName([UIFont systemFontOfSize:FONTSIZE_BODY]);
    
    
    return titleAtt.ky_appendAttributedString(bodyAtt);
}

#pragma mark: - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"富文本超链接 => %@", URL.absoluteString);
    return NO;
}
@end
