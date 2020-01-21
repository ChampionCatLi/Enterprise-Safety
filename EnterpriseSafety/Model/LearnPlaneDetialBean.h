//
//  LearnPlaneBean.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearnPlaneBeanFrame.h"


NS_ASSUME_NONNULL_BEGIN

@interface LearnPlaneDetialBean : NSObject
@property(strong,nonatomic) NSDictionary * messageDic;
@property(strong,nonatomic) NSMutableArray *totalDataArr;
@property(strong,nonatomic) NSArray * articleDicArr;

-(void) setMessageDic:(NSDictionary * )messageDic setArticleDicArr:(nullable  NSArray * )  articleDicArr;

@end
/**
 课程  包含 必修 选修
 */
@interface CourseBean: NSObject
@property(strong,nonatomic)NSString * courseName;
@property(nonatomic,assign)NSInteger courseID;
@property(nonatomic,assign) BOOL isStartLearn;
@property(nonatomic,assign) BOOL  isPassed;

@end
/**
 阅读
 */
@interface ArticleBean : NSObject
@property(strong,nonatomic)NSString * articleTitle;
@property(strong,nonatomic)NSString * articleImg;
@property(strong,nonatomic)NSString * articleID;
@end

@interface ExameBean : NSObject




@end
NS_ASSUME_NONNULL_END
