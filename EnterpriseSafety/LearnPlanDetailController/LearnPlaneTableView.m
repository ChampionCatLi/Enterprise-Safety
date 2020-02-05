//
//  LearnPlaneTableView.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnPlaneTableView.h"
#import "LearnPlaneDetialBean.h"
#import "LearnPlaneDetailTableViewCell.h"
#import "LearnPlaneSectionHeaderView.h"
#import "LearnPlaneDetialBean.h"



@interface LearnPlaneTableView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray * sectionTitleArr;

@end

@implementation LearnPlaneTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self=[super initWithFrame:frame style:style]){
        
        [self initView];
        
    }
    return self;
    
}
-(void) initView{
    self.delegate=self;
    self.dataSource=self;
}

- (void)setLearnPlaneDetailBean:(LearnPlaneDetialBean *)learnPlaneDetailBean{
    
    _learnPlaneDetailBean=learnPlaneDetailBean;
    _sectionTitleArr=learnPlaneDetailBean.sectionTitleArr;
}

//
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0 )];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LearnPlaneSectionHeaderView * learnSectionHeaderView=[[LearnPlaneSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    SectionTitleBean * sectionTitleBean=_sectionTitleArr[section];
    
    [learnSectionHeaderView setTitle:sectionTitleBean.titleStr setTips:sectionTitleBean.tipsStr setProgressTips:sectionTitleBean.progressTipsStr];
    
    return learnSectionHeaderView;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SectionTitleBean * sectionTitleBean=_sectionTitleArr[indexPath.section];
    NSString * ID=sectionTitleBean.sectionType;
    NSArray * data;
    data =  self.learnPlaneDetailBean.totalDataArr[indexPath.section];
    if ([ID isEqualToString:LCPlaneCellOptCourse]|[ID isEqualToString:LCPlaneCellReqCourse]) {
        LearnPlaneDetailCourseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
        
        if (cell==nil) {
            cell=[[LearnPlaneDetailCourseTableViewCell alloc] init];
        }
        
        LearnPlaneDetialBeanCourseFrame * learnCourseFrame=  data[indexPath.row];
        cell.learnPlaneDetialBeanCourseFrame=learnCourseFrame;
        return cell;
        
    }else if([ID isEqualToString:LCPlaneCellArticle ]){
        LearnPlaneDetailArticleCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(cell==nil){
            cell=[[LearnPlaneDetailArticleCell alloc] init];
        }
        LearnPlaneDetailArticleFrame * learnArticleFrame=data[indexPath.row];
        cell.learnPlaneDetailArticleFrame=learnArticleFrame;
        return cell;
    }else if([ID isEqualToString:LCPlaneCellExam]){
        LearnPlaneDetailExamCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell=[[LearnPlaneDetailExamCell alloc] init];
            
        }
        LearnPlaneDetailExamFrame * learnExamF=data[indexPath.row];
        cell.learnPlaneDetailExamFrame=learnExamF;
        return cell;
        
    }
    return nil;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray * data=self.learnPlaneDetailBean.totalDataArr[section];
    
    return data.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * data=self.learnPlaneDetailBean.totalDataArr[indexPath.section];
    LearnPlaneBeanFrame * learnPlaneBeanF=  data[indexPath.row];
    return  learnPlaneBeanF.cellHeight;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.learnPlaneDetailBean.totalDataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
}
/**
 点击逻辑
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SectionTitleBean * secationBean  =  self.sectionTitleArr[indexPath.section];
    NSArray * data =self.learnPlaneDetailBean.totalDataArr[indexPath.section];
    NSString * type=secationBean.sectionType;
    if([type isEqualToString:LCPlaneCellReqCourse]||[type isEqualToString:LCPlaneCellOptCourse]){
        LearnPlaneDetialBeanCourseFrame * courseFrame=data[indexPath.row];
        CourseBean * courseBean=courseFrame.courseBean;
        [self go2LearnVideoActivity:courseBean];
        
    }else if([type isEqualToString:LCPlaneCellArticle]){
        
    }else if ([type isEqualToString:LCPlaneCellExam]){
    }
}


#pragma mark --跳转逻辑
// 前往视频学习页面
-(void) go2LearnVideoActivity :(CourseBean *) courseBean{
    if (self.myDeletage!=nil) {
        [self.myDeletage gotoLearnVideoClazzId:_learnPlaneDetailBean.clazzID courseID:courseBean.courseID lastLearnVideoId:1];
    }
}
//前往测试
-(void) go2ExamActivity{
    
}
// 前往阅读
-(void) go2ArticleActivity{
    
}
@end

