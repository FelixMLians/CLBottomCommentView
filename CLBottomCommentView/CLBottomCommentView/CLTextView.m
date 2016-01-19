//
//  CLTextView.m
//  CLBottomCommentView
//
//  Created by YuanRong on 16/1/19.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import "CLTextView.h"
#import "CLBottomCommentViewConfig.h"

static CGFloat const kCommentTextViewHeight = 168.0;
static CGFloat const kMininumKeyboardHeight = 216.0;

@interface CLTextView ()<UITextViewDelegate>

@property (nonatomic, strong) UIVisualEffectView *backgroundView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewConstraintHeight;

@end

@implementation CLTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"CLTextView" owner:self options:nil];
        [self.contentView setFrame:CGRectMake(0, 0, cl_ScreenWidth, cl_ScreenHeight)];
        [self addSubview:self.contentView];
        
        [self configure];
    }
    return self;
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        [self.sendButton setTitleColor:kColorTextMain forState:UIControlStateNormal];
    } else {
        [self.sendButton setTitleColor:kColorTextTime forState:UIControlStateNormal];
    }
    
    if ([self.delegate respondsToSelector:@selector(cl_textViewDidChange:)]) {
        [self.delegate cl_textViewDidChange:self];
    }
}

#pragma mark - Event Response

- (IBAction)cancelAction:(UIButton *)sender {
    [self.commentTextView resignFirstResponder];
    [self dismissCommentTextView];
}

- (IBAction)sendAction:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(cl_textViewDidEndEditing:)]) {
        [self.delegate cl_textViewDidEndEditing:self];
    }
    
    [self.commentTextView resignFirstResponder];
    [self dismissCommentTextView];
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    [self.commentTextView resignFirstResponder];
    
    [self dismissCommentTextView];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        [self.commentTextView resignFirstResponder];
        [self dismissCommentTextView];
    }
}

#pragma mark - Private Method

- (void)configure {
    self.commentTextView.layer.borderColor = kColorLineCellSeperator.CGColor;
    self.commentTextView.layer.borderWidth = 0.5;
    self.commentTextView.delegate = self;
    
    [self.sendButton setTitleColor:kColorTextTime forState:UIControlStateNormal];
    [self.sendButton setTitleColor:kColorTextMain forState:UIControlStateHighlighted];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    UISwipeGestureRecognizer *swipeGr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    [swipeGr setDirection:UISwipeGestureRecognizerDirectionDown];
    self.gestureRecognizers = @[tapGr, swipeGr];
    
    [self insertSubview:self.backgroundView atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
}

- (void)dismissCommentTextView {
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    
    if (kbSize.height > kMininumKeyboardHeight) {
        self.containerViewConstraintHeight.constant = kCommentTextViewHeight + 20 + kbSize.height;
    } else {
        self.containerViewConstraintHeight.constant = kCommentTextViewHeight + 20 + kMininumKeyboardHeight;
    }
}

#pragma mark - Accessor

- (UIVisualEffectView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, 0, cl_ScreenWidth, cl_ScreenHeight)];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.5;
        _backgroundView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    }
    return _backgroundView;
}

@end
