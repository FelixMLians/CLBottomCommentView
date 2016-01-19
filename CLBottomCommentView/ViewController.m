//
//  ViewController.m
//  CLBottomCommentView
//
//  Created by YuanRong on 16/1/19.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import "ViewController.h"
#import "CLBottomCommentView.h"
#import "CLProgressHUD.h"

static CGFloat const kBottomViewHeight = 46.0;

@interface ViewController ()<CLBottomCommentViewDelegate>

@property (nonatomic, strong) CLBottomCommentView *bottomView;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLBottomCommentViewDelegate

- (void)bottomViewDidShare {
    [CLProgressHUD showInView:self.view delegate:self title:@"正在分享中..." duration:3.0];
}

- (void)bottomViewDidMark:(UIButton *)markButton {
    [CLProgressHUD showInView:self.view delegate:self title:@"正在收藏中..." duration:2.0];
    
    [self performSelector:@selector(changeMarkButtonState:) withObject:markButton afterDelay:2.0];
}

- (void)cl_textViewDidChange:(CLTextView *)textView {
    if (textView.commentTextView.text.length > 0) {
        NSString *originalString = [NSString stringWithFormat:@"[草稿]%@",textView.commentTextView.text];
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:originalString];
        [attriString addAttributes:@{NSForegroundColorAttributeName: kColorNavigationBar} range:NSMakeRange(0, 4)];
        [attriString addAttributes:@{NSForegroundColorAttributeName: kColorTextMain} range:NSMakeRange(4, attriString.length - 4)];
        
        self.bottomView.editTextField.attributedText = attriString;
    }
}

- (void)cl_textViewDidEndEditing:(CLTextView *)textView {
    [CLProgressHUD showInView:self.view delegate:self title:@"正在发送评论中..." duration:2.0];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.bottomView clearComment];
    });
}

#pragma mark - Private Method

- (void)changeMarkButtonState:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark - Accessor

- (CLBottomCommentView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[CLBottomCommentView alloc] initWithFrame:CGRectMake(0, cl_ScreenHeight - kBottomViewHeight, cl_ScreenWidth, kBottomViewHeight)];
        _bottomView.delegate = self;
        _bottomView.clTextView.delegate = self;
    }
    return _bottomView;
}

@end
