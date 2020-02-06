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
#define LCGay979797 [UIColor colorWithWhite:97/255.0 alpha:1]
#define LCGay9E9E9E [UIColor colorWithWhite:158/255.0 alpha:1]
#define LCGayLineBDBDBD [UIColor colorWithWhite:189/255.0 alpha:1]
#define LCButtonUnclickColor [UIColor colorWithWhite:224/255.0 alpha:1]
#define LCButtonclickColor [UIColor colorWithRed:33/255.0 green:150/255.0 blue:245/255.0 alpha:1]
#define LCGay979797Color [UIColor colorWithWhite:97/ 255.0 alpha:1]
#define LCBlueColor  [UIColor colorWithRed:33/255.0 green:150/255.0 blue:245/255.0 alpha:1]
#define LCBlack333333 [UIColor colorWithWhite:33/255.0 alpha:1]

#pragma mark -font 字号
#define LCFont15 [UIFont systemFontOfSize:15]
#define LCFont12 [UIFont systemFontOfSize:12]


#pragma mark -string

#define LCMainCourseTitle @"我的课程"
#define LCMainMyCenterTitle @"个人中心"

#define LCPlaneCellReqCourse @"reqCourseCell"
#define LCPlaneCellOptCourse @"optCourseCell"
#define LCPlaneCellArticle @"articleCell"
#define LCPlaneCellExam @"examCell"

#pragma mark - ui data
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define ITEM_HEIGHT 50
#define MARGIN_LEFT_15 15
#define LCMAEGIN_15 15

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
//1.5 培训计划详情
#define url_get_plane_detail @"/m/home/my/clazz/get"


#pragma mark -课件

///m/home/my/clazz/courseware/outline/{cri}/{clazzId}
//2.1 获取 教学大纲和学习记录
#define url_get_learn_video_detail @"/m/home/my/clazz/courseware/outline"
#pragma mark - 阅读列表
//阅读
//4.1 阅读列表
//m/home/my/clazz/article/list/{clazzId}/{offset}/{count}
#define url_get_read_article_data @"/m/home/my/clazz/article/list"

#pragma mark -公众栏目
//5 公众栏目
// 5.1 栏目列表
#define url_get_article_title @"/m/home/article/columns"
// 5.2 栏目列表  /m/home/article/list/{columnId}/{offset}/{count}
#define url_get_article_list @"/m/home/article/list"
//5.3 文章详情 /m/home/article/get/{id}
#define  url_get_article_detail @"/m/home/article/get"
//5.4 提交阅读行为 /m/home/article/log/{id}?acts=xxx
#define url_commit_read_log @"/m/home/article/log"
//5.5 访问附件  /m/p/article/img/{tenantId}/{columnId}/{articleId}/{filename}
#define url_visit_article_pic @"/m/p/article/img"


#pragma mark -data key

#define data_key_user_token @"token"
#define data_key_user_fee_modle @"feeMode"
#define data_key_user_name @"name"
#define data_key_user_jse_id @"jsessionid"
#define data_key_user_id @"id"


#pragma mark -const 常量
 /*开课时间模式,1.固定时间开始 2.随时开始*/
#define course_start_model_set_time 1


// 开课时间 1 固定时间 2随时开始
#define START_TYPE_SET_TIME 1
#define START_TYPE_ANY_TIME 2
//考核方式  /*考核方式 1:不考核,2:常规考核,3:签退签到课堂日志*/
#define TRACK_TYPE_NO 1
#define TRACK_TYPE_COMMON 2
#define TRACK_TYPE_SIGN 3

#endif /* Header_h */
