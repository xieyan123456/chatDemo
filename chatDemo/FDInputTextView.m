//
//  FDInputTextView.m
//  chatDemo
//
//  Created by xieyan on 2016/12/9.
//  Copyright © 2016年 Fruitday. All rights reserved.
//

#import "FDInputTextView.h"

//刚好可以显示5行
#define maxHeight 98
@implementation FDInputTextView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    self.layer.borderWidth = 1.0;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = [[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0] CGColor];
    self.showsVerticalScrollIndicator = NO;
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(inputTextViewDidChange) name:UITextViewTextDidChangeNotification object:nil];
    self.delegate = self;
}

#pragma mark - UITextViewDelegate

-(void)textViewDidChange:(UITextView *)textView{
    static CGFloat originalHeight = 0;
    if ([self.changeDelegate respondsToSelector:@selector(inputTextViewDidChange:)]) {
        [self.changeDelegate inputTextViewDidChange:self];
    }
    //根据输入文本算高度
    CGFloat curHeight = textView.contentSize.height;
    //传出去的高度
    CGFloat fHeight = curHeight > maxHeight ? maxHeight : curHeight;
    //如果此次高度与上次一样直接返回
    if (originalHeight == fHeight) return;
           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               if ([self.changeDelegate respondsToSelector:@selector(inputTextView:heightDidChange:)]) {
                   [self.changeDelegate inputTextView:self heightDidChange:fHeight];
                   originalHeight = fHeight;
               }
    });
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return [self.changeDelegate inputTextView:self shouldChangeTextInRange:range replacementText:text];
}


@end
