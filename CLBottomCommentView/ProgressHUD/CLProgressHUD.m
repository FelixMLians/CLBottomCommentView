//
//  KYDProgressHUD.m
//  CuoTiBenHD
//
//  Created by chenlian on 15/1/26.
//  Copyright (c) 2015年 深圳市华普教育科技有限公司. All rights reserved.
//

#import "CLProgressHUD.h"

@implementation CLProgressHUD

//+ (KYDProgressHUD *)share
//{
//    static dispatch_once_t once = 0;
//    static KYDProgressHUD *progressHUD;
//    dispatch_once(&once, ^{ progressHUD = [[KYDProgressHUD alloc] init]; });
//    return progressHUD;
//}
//
//- (instancetype)init
//{
//        self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
//        id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
//        if ([delegate respondsToSelector:@selector(window)])
//            window = [delegate performSelector:@selector(window)];
//        else
//            window = [[UIApplication sharedApplication] keyWindow];
//    
//        hud = [[MBProgressHUD alloc] initWithWindow:self.window];
//        return self;
//}

+ (void)showErrorInView:(UIView *)view
               delegate:(id)del
                  title:(NSString *)title
               duration:(CGFloat)duration
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    HUD.delegate = del;
    HUD.labelText = title;
    
    [HUD show:YES];
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    
    [HUD hide:YES afterDelay:duration];
}

+ (void)showSuccessInView:(UIView *)view
               delegate:(id)del
                  title:(NSString *)title
               duration:(CGFloat)duration
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    HUD.delegate = del;
    HUD.labelText = title;
    
    [HUD show:YES];
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    
    [HUD hide:YES afterDelay:duration];
}

+ (void)showInView:(UIView *)view
          delegate:(id)del
             title:(NSString *)title
          duration:(CGFloat)duration {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    
    HUD.delegate = del;
    HUD.labelText = title;
    
    [HUD show:YES];
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    
    [HUD hide:YES afterDelay:duration];
}

+ (void)showInView:(UIView *)view
          delegate:(id)del
               tag:(int)tag
             title:(NSString *)title
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.tag = tag;
    [view addSubview:HUD];
    
    HUD.delegate = del;
    HUD.labelText = title;
    
    [HUD show:YES];
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
}

+ (void)dismissHUDByTag:(int)tag
               delegate:(id)del
                 inView:(UIView *)view
{
    MBProgressHUD *HUD = (MBProgressHUD *)[view viewWithTag:tag];
    HUD.delegate = del;
    [HUD hide:YES];
}

- (MBProgressHUD *)showProgressInView:(UIView *)view delegate:(id)del title:(NSString *)title progress:(CGFloat)progress
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeDeterminate;
    
    HUD.delegate = del;
    HUD.labelText = title;
    
    [HUD show:YES];
    
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    
    HUD.progress = progress;
    
    return HUD;
}

@end
