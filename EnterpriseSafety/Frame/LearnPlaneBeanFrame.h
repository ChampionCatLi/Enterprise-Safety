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
@class ExamBean;


@interface LearnPlaneBeanFrame : NSObject
@property(nonatomic,assign) CGFloat cellHeight;
@end

@interface LearnPlaneDetialBeanCourseFrame : LearnPlaneBeanFrame
@property(nonatomic, assign) CGRect courseTitleF;
@property(nonatomic,assign) CGRect courseLeftStatusF;
@property(nonatomic,assign) CGRect courseRightStatusF;


@property(strong,nonatomic) CourseBean * courseBean;
@end

@interface LearnPlaneDetailArticleFrame :  LearnPlaneBeanFrame

@property(nonatomic,assign) CGRect articleTitleF;
@property(nonatomic,assign) CGRect articleImgF;
@property(nonatomic,assign) CGRect articleStatusF;
@property(nonatomic,strong) ArticleBean * articleBean;

@end

@interface LearnPlaneDetailExamFrame : LearnPlaneBeanFrame
 
@property(nonatomic,strong) ExamBean * examBean;

@property(nonatomic,assign) CGRect examTitleF;
@property(nonatomic,assign) CGRect examTimeF;
@property(nonatomic,assign) CGRect examScoreF;
@property(nonatomic,assign) CGRect examChanceF;
@property(nonatomic,assign) CGRect examDurationF;
 

@end

NS_ASSUME_NONNULL_END
