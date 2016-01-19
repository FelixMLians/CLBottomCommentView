//
//  CLBottomCommentViewDelegate.h
//  CLBottomCommentView
//
//  Created by YuanRong on 16/1/19.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  CLTextView;

@protocol CLBottomCommentViewDelegate <NSObject>

@optional

/**
 *  bottom comment view button response's delegate
 */
- (void)bottomViewDidShare;
- (void)bottomViewDidMark:(UIButton *)markButton;

/**
 *  CLTextView delegate
 */
- (void)cl_textViewDidChange:(CLTextView *)textView;
- (void)cl_textViewDidEndEditing:(CLTextView *)textView;

@end
