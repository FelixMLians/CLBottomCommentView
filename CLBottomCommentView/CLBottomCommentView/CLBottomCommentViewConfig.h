//
//  CLBottomCommentViewConfig.h
//  CLBottomCommentView
//
//  Created by YuanRong on 16/1/19.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#ifndef CLBottomCommentViewConfig_h
#define CLBottomCommentViewConfig_h

//app的高度
#define cl_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
//app的宽度
#define cl_ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#pragma mark - color

#define UIColorFromRGB(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define UIColorFromHEX(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

// 颜色
#define kColorTabBarBackground UIColorFromHEX(0xEEEEEE)
#define kColorNavigationBar UIColorFromHEX(0xc72b2c)

#define kColorTextMain UIColorFromHEX(0x333333) // 一般文本色,名字颜色 (20 %)
#define kColorTextSubTitle UIColorFromHEX(0x7B7B81) // 次要文本色 (48 %)
#define kColorTextTime UIColorFromHEX(0x838383) // 时间颜色 (51 %)
#define kColorTextOrange UIColorFromHEX(0xf26220) // 橙名颜色
#define kColorTextBlue UIColorFromHEX(0x005ec4) // 蓝名颜色
#define kColorLineCellSeperator UIColorFromHEX(0xBCBAC1) // cell 分隔线线条颜色 (73 %)
#define kColorLineBarSeperator UIColorFromHEX(0xA3A3A3) // navbar底部，tabbar顶部，toolbar顶部 线条颜色 (64 %)

#define kColorLinkTextHighlight UIColorFromHEX(0x527ead) // Link 文本色
#define kColorLinkTextHighlightBackground UIColorFromHEX(0xbfdffe) // Link 点击背景色

#endif /* CLBottomCommentViewConfig_h */
