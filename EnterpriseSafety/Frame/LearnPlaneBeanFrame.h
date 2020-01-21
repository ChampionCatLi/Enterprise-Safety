//
//  LearnPlaneBeanFrame.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/19.
//  Copyright © 2020 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CourseBean;
@class ArticleBean;
@interface LearnPlaneBeanFrame : NSObject

@end

@interface LearnPlaneDetialBeanCourseFrame : NSObject
@property(nonatomic, assign) CGRect courseTitleF;
@property(nonatomic,assign) CGRect courseLeftStatusF;
@property(nonatomic,assign) CGRect courseRightStatusF;
@property(nonatomic,assign) CGFloat cellHeight;

@property(strong,nonatomic) CourseBean * courseBean;
@end

@interface LearnPlaneDetailArticleFrame :  NSObject

@property(nonatomic,assign) CGRect articleTitleF;
@property(nonatomic,assign) CGRect articleImgF;
@property(nonatomic,strong) ArticleBean * articleBean;

@property(nonatomic,assign) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
