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

#define LCRGBAColor(r, g, b, a)  [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define LCRGBColor(r, g, b)     LCRGBAColor(r, g, b, 1.0)





#endif /* Header_h */
