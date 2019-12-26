//
//  Header.h
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/6.
//  Copyright © 2019 chao. All rights reserved.
//
#ifndef Header_h
#define Header_h


//判断iPhoneX
#define DeviceIsIphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)  : NO)
//判断iPHoneXr
#define DeviceIsIphoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size)) : NO)
//判断iPhoneXs
#define DeviceIsIphoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs Max
#define DeviceIsIphoneXS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
//判断是否为全面屏
#define DeviceIsFullScreen (DeviceIsIphoneX == YES || DeviceIsIphoneXR == YES || DeviceIsIphoneXS == YES || DeviceIsIphoneXS_MAX == YES)


#define kZDNavigationBarHeight              44
#define kZDStatusBarHeight                  (DeviceIsFullScreen?44:20)
#define kZDTabBarHeight                     (DeviceIsFullScreen?(49+34):49)
#define kZDBottomSpace                      (DeviceIsFullScreen?34:0)
#define kZDBottomSpaceLandscape             (DeviceIsFullScreen?12:0)
#define kAdaptedWidth4(width)               (width * (kScreenWidth / 320))
#define kAdaptedWidth47(width)              (width * (kScreenWidth / 375))

#define kNavigationBarBottom  (kZDStatusBarHeight + kZDNavigationBarHeight)


#pragma mark -colors
#define LCRGBAColor(r, g, b, a)  [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define LCRGBColor(r, g, b)     LCRGBAColor(r, g, b, 1.0)

#define LCBackGroundColor  [UIColor colorWithWhite:245 / 255.0 alpha:1]
#define LCGay616161 [UIColor colorWithWhite:97/255.0 alpha:1]
#define LCGayLineBDBDBD [UIColor colorWithWhite:189/255.0 alpha:1]
#define LCButtonUnclickColor [UIColor colorWithWhite:224/255.0 alpha:1]
#define LCButtonclickColor [UIColor colorWithRed:33/255.0 green:150/255.0 blue:245/255.0 alpha:1]
#define LCGay979797Color [UIColor colorWithWhite:97/ 255.0 alpha:1]
#define LCBlueColor  [UIColor colorWithRed:33/255.0 green:150/255.0 blue:245/255.0 alpha:1]

#pragma mark -string

#define LCMainCourseTitle @"我的课程"
#define LCMainMyCenterTitle @"个人中心"


#pragma mark - ui data
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define ITEM_HEIGHT 50
#define MARGIN_LEFT_15 15

#pragma mark -用户 url
#define url_get_account_organ @"/m/p/a/check/"
//用户 1.3 /m/login?tid={tenantId}&orgid={orgId}
#define url_do_login_by_password @"/m/login"
//1.2 token 登录
#define url_do_login_by_token @"/m/login"

#pragma mark -学习 url
// 获取 用户在学 学习计划
#define url_get_learn_plane @"/m/home/my/clazz/list/actives"
//1.1 获取开放课程
#define url_get_open_course @"/m/home/my/clazz/list/open/actives"



#pragma mark -data key

#define data_key_user_token @"token"
#define data_key_user_fee_modle @"feeMode"
#define data_key_user_name @"name"
#define data_key_user_jse_id @"jsessionid"
#define data_key_user_id @"id"


#pragma mark -const 常量
 /*开课时间模式,1.固定时间开始 2.随时开始*/
#define course_start_model_set_time 1

#endif /* Header_h */
