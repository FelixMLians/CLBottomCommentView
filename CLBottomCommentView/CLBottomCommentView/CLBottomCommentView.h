//
//  CLBottomCommentView.h
//  CLBottomCommentView
//
//  Created by YuanRong on 16/1/19.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLBottomCommentViewDelegate.h"
#import "CLTextView.h"
#import "CLBottomCommentViewConfig.h"

@interface CLBottomCommentView : UIView<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *editView;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (weak, nonatomic) IBOutlet UIButton *markButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) id<CLBottomCommentViewDelegate> delegate;

@property (nonatomic, strong) CLTextView *clTextView;

- (void)showTextView;

- (void)clearComment;

@end
