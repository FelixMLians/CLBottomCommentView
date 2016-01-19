//
//  KYDProgressHUD.h
//  CuoTiBenHD
//
//  Created by chenlian on 15/1/26.
//  Copyright (c) 2015年 深圳市华普教育科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.H"

@interface CLProgressHUD : MBProgressHUD

+ (void)showErrorInView:(UIView *)view
               delegate:(id)del
                  title:(NSString *)title
               duration:(CGFloat)duration;

+ (void)showSuccessInView:(UIView *)view
                 delegate:(id)del
                    title:(NSString *)title
                 duration:(CGFloat)duration;

+ (void)showInView:(UIView *)view
                 delegate:(id)del
                    title:(NSString *)title
                 duration:(CGFloat)duration;

+ (void)showInView:(UIView *)view
          delegate:(id)del
               tag:(int)tag
             title:(NSString *)title;

+ (void)dismissHUDByTag:(int)tag
               delegate:(id)del
                 inView:(UIView *)view;

- (MBProgressHUD *)showProgressInView:(UIView *)view delegate:(id)del title:(NSString *)title progress:(CGFloat)progress;
@end
