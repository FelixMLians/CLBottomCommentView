# CLBottomCommentView
🔥 CLBottomCommentView 仿网易底部评论视图

![CLBottomCommentView](https://github.com/FelixMLians/CLBottomCommentView/blob/master/snapshot/CLCommentViewSnapShot.gif)
````

## Introduction

This is a comment tool bar.

If you feel good, please give me a star, thank you very much! ⭐️

## Installation

## Non-CocoaPods Installation

Just drag the CLBottomCommentView folder into your project.

## Usage

* Use by including the following import:
````objc
#import "CLBottomCommentView.h"
````
* Demo code:
````objc 
// init CLBottomCommentView
#pragma mark - Accessor

- (CLBottomCommentView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[CLBottomCommentView alloc] initWithFrame:CGRectMake(0, cl_ScreenHeight - kBottomViewHeight, cl_ScreenWidth, kBottomViewHeight)];
        _bottomView.delegate = self;
        _bottomView.clTextView.delegate = self;
    }
    return _bottomView;
}
````

* Delegate (`@optional`):
````objc
@optional

- (void)bottomViewDidShare;
- (void)bottomViewDidMark:(UIButton *)markButton;

- (void)cl_textViewDidChange:(CLTextView *)textView;
- (void)cl_textViewDidEndEditing:(CLTextView *)textView;

````
* For example:
````objc
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

````

## Support
* If you have any questions, please commit a issure! Thx!
* Email: felixmorgan109@gmail.com 
* Weibo: http://www.weibo.com/felixmorgan/
* Twitter: https://twitter.com/FelixMLians
* Facebook: https://www.facebook.com/felixmorgan109

### License
[MIT License](http://opensource.org/licenses/MIT)
