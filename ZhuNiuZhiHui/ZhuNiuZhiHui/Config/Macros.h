//
//  Macros.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


#endif /* Macros_h */

//公共接口的url类型
//测试接口
#define kTextPublickURL @"http://192.168.1.188/mobile-web/mobile/"
//真实接口
#define kPublickURL @"http://lc.zhuniu.com/mobile-web/mobile/"


// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]
// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height

#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
#define Main_Screen_bounds     [[UIScreen mainScreen]bounds]
// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)


// 系统控件默认高度
#define kStatusBarHeight        (20.f)

#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)

#define kCellDefaultHeight      (44.f)

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

//导航栏高度
#define KNAV_TOOL_HEIGHT 64
#define ScreenCGRec  [[UIScreen mainScreen] bounds]//屏幕大小


// 加载图片
#define PNGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue , transparency) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:transparency]


//number转String
#define IntTranslateStr(int_str) [NSString stringWithFormat:@"%d",int_str];
#define FloatTranslateStr(float_str) [NSString stringWithFormat:@"%.2d",float_str];

//用户信息的宏
#define kUserInfoKeyArray @[@"companyId",@"departmentId",@"departmentName",@"email",@"flag",@"hasLogined",@"nickName",@"personId",@"position",@"rongToKen",@"sex",@"telephone",@"token",@"userCode"]

//主题色
#define kThemColor UIColorFromRGB(0x2b9dfe, 1)
//背景色
#define kBackGroundColor UIColorFromRGB(0xf4f4f4, 1)
//字体颜色
#define kTextColor  UIColorFromRGB(0xbfbfbf,1)

//查询数据库中的参数
#define CodeUserId   [NSString stringWithFormat:@"%@",[[JPPD sharedJPPD] valueForKey:@"id" inTable:@"UserInfor"].value]

#define CodeToken   [NSString stringWithFormat:@"%@",[[JPPD sharedJPPD] valueForKey:@"token" inTable:@"UserInfor"].value]
#define CodeCompany  [NSString stringWithFormat:@"%@",[[JPPD sharedJPPD] valueForKey:@"companyId" inTable:@"UserInfor"].value]
