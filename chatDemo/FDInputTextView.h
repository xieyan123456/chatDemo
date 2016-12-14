//
//  FDInputTextView.h
//  chatDemo
//
//  Created by xieyan on 2016/12/9.
//  Copyright © 2016年 Fruitday. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FDInputTextView;

@protocol FDInputTextViewDelegate <NSObject>

- (void)inputTextView:(FDInputTextView *)textView heightDidChange:(CGFloat)height;
- (BOOL)inputTextView:(FDInputTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)inputTextViewDidChange:(FDInputTextView *)textView;

@end

@interface FDInputTextView : UITextView<UITextViewDelegate>
@property (nonatomic, weak) id <FDInputTextViewDelegate>changeDelegate;
@end
