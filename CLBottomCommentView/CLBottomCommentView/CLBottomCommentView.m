//
//  CLBottomCommentView.m
//  CLBottomCommentView
//
//  Created by YuanRong on 16/1/19.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import "CLBottomCommentView.h"

@implementation CLBottomCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"CLBottomCommentView" owner:self options:nil];
        [self.contentView setFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self addSubview:self.contentView];
        
        [self configure];
    }
    return self;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self addSubview:self.clTextView];
    
    if (textField.text.length > 4) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:textField.text];
        self.clTextView.commentTextView.text = [string substringFromIndex:4];
    }
    
    [self.clTextView.commentTextView becomeFirstResponder];
    [[UIApplication sharedApplication].keyWindow addSubview:self.clTextView];
    return NO;
}

#pragma mark - Event Response

- (IBAction)markAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(bottomViewDidMark:)]) {
        [self.delegate bottomViewDidMark:sender];
    }
}

- (IBAction)shareAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(bottomViewDidShare)]) {
        [self.delegate bottomViewDidShare];
    }
}

#pragma mark - Public Method

- (void)showTextView {
    [self.editTextField becomeFirstResponder];
}

- (void)clearComment {
    self.editTextField.text = @"";
    self.clTextView.commentTextView.text = @"";
    [self.clTextView.sendButton setTitleColor:kColorTextTime forState:UIControlStateNormal];
}

#pragma mark - Private Method

- (void)configure {
    self.editView.layer.cornerRadius = 15;
    self.editView.clipsToBounds = YES;
    self.editView.layer.borderColor = kColorLineCellSeperator.CGColor;
    self.editView.layer.borderWidth = 0.5;
    
    self.shareButton.layer.borderWidth = 0.5;
    self.shareButton.layer.borderColor = kColorLineCellSeperator.CGColor;
    self.shareButton.layer.cornerRadius = CGRectGetHeight(self.shareButton.frame) / 2;
    
    self.markButton.layer.borderWidth = 0.5;
    self.markButton.layer.borderColor = kColorLineCellSeperator.CGColor;
    self.markButton.layer.cornerRadius = CGRectGetHeight(self.markButton.frame) / 2;
    
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.5)];
    lineView.backgroundColor = kColorLineBarSeperator;
    [self.contentView addSubview:lineView];
    
    self.editTextField.delegate = self;
}

#pragma mark - Accessor

- (CLTextView *)clTextView  {
    if (!_clTextView) {
        _clTextView = [[CLTextView alloc] initWithFrame:CGRectMake(0, 0, cl_ScreenWidth, cl_ScreenHeight)];
        _clTextView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _clTextView;
}

@end
