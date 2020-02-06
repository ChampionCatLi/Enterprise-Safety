//
//  LearnPlaneTableView.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.
//
/**
 学习计划详情root  tableview  全写到vc  代码太臃肿
 */
#import <UIKit/UIKit.h>



@class LearnPlaneDetialBean;
@class LearnPlaneTableView;
@class CourseBean;

NS_ASSUME_NONNULL_BEGIN

@protocol  LearnPlaneTableViewDelegate <NSObject>

@optional


-(void) clickItemCourse:(CourseBean *) clickCourseBean;
@end



@interface LearnPlaneTableView : UITableView
//数据源
@property(nonatomic,strong)LearnPlaneDetialBean *learnPlaneDetailBean;

@property(nonatomic,weak) id<LearnPlaneTableViewDelegate> myDeletage;


@end


NS_ASSUME_NONNULL_END
