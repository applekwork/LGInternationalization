
//
//  Macro.h
//  LGInternationalization
//
//  Created by LG on 2018/11/14.
//  Copyright © 2018年 applekwork@163.com. All rights reserved.
//

#ifndef Macro_h
#define Macro_h
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define THEMECOLOR                  UIColorFromRGB(0x0a285a)  //主题色，多用于导航栏背景色
#define TEXTCOLOR                   UIColorFromRGB(0x000000)  //【文字颜色】普通文字颜色
#define MINORCOLOR                  UIColorFromRGB(0x8e8e8e)  //【文字颜色】次要或提示性文字
#define TABBARCOLOR                 UIColorFromRGB(0xf7f7f7)  //标签栏的背景色
#define LINECOLOR                   UIColorFromRGB(0xc8c7cc)  //大多数分割线的颜色
#define navi_bar_textsize              19               //【文字大小】导航栏字体大小38px
#endif /* Macro_h */
