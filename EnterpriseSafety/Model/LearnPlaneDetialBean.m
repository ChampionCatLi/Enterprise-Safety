//
//  LearnPlaneBean.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.


#import "LearnPlaneDetialBean.h"
#import <XMNetworking.h>
@interface LearnPlaneDetialBean()


//学习模式 /*必修的学习模式,1,顺序学习 2,随时学习*/
@property(nonatomic,assign) int learnType;
//考核模式 /*考核方式 1:不考核,2:常规考核,3:签退签到课堂日志*/
@property(nonatomic,assign) int trackType;
//开始模式 /*开课时间模式,1.固定时间开始 2.随时开始*/
@property(nonatomic,assign) int  startType;

@end

@implementation LearnPlaneDetialBean

- (void)setMessageDic:(NSDictionary *)messageDic setArticleDicArr:(nullable NSArray *)articleDicArr{
    _messageDic=messageDic;
    _articleDicArr=articleDicArr;
    self.totalDataArr =[NSMutableArray new ];
    NSDictionary * clazzDic=messageDic[@"clazz"];
    _startType=[clazzDic[@"startMode"] intValue];
    self.clazzID=[clazzDic[@"id"] stringValue];
    NSDictionary * ruleDic=messageDic[@"rule"];
    NSDictionary * scDic=messageDic[@"sc"];
    [self parseRuleDic:ruleDic parseScDic:scDic];
}
-(void) parseRuleDic:(NSDictionary *) ruleDic parseScDic:(NSDictionary *)scDic{
    _sectionTitleArr=[NSMutableArray new];
    //学习模式
    _learnType=[ruleDic[@"learnMode"] intValue];
    //考核模式
    _trackType=[ruleDic[@"trackType"] intValue];
    //必修课件数
    int reqNum=[ruleDic[@"reqNum"] intValue];
    if (reqNum>0) {
        [self parseReqArrAndOptArr:self.messageDic[@"reqs"]] ;
        SectionTitleBean * sectionBean=[[SectionTitleBean alloc] init];
        sectionBean.titleStr=@"必修";
        sectionBean.tipsStr=@"请学习并通过以下全部课件";
        sectionBean.sectionType=LCPlaneCellReqCourse;
        int reqLearnProgress=[scDic[@"reqProgress"] intValue];
        sectionBean.progressTipsStr=[LCUtils getLearnProgresstTips:reqLearnProgress];
        [self.sectionTitleArr addObject:sectionBean];

    }
    //选修课件数
    int optNum=[ruleDic[@"optNum"] intValue ];
    if (optNum>0) {
        [self parseReqArrAndOptArr:self.messageDic[@"opts"]];
        SectionTitleBean * optSectionTitleBean=[[SectionTitleBean alloc] init];
        [self.sectionTitleArr addObject:optSectionTitleBean];
        optSectionTitleBean.sectionType=LCPlaneCellOptCourse;
        optSectionTitleBean.titleStr=@"选修";
        int optRequireNum=[ruleDic[@"optPassNum"] intValue];
        optSectionTitleBean.tipsStr=[NSString stringWithFormat:@"%@%d%@",@"请学习并至少通过",optRequireNum,@"课件"];
        int optLearnProgress=[scDic[@"optProgress"] intValue];
        optSectionTitleBean.progressTipsStr=[LCUtils getLearnProgresstTips:optLearnProgress];
    }
    
    //阅读数
    if (_articleDicArr.count!=0) {
        [self parseArticleData:_articleDicArr];
        SectionTitleBean * readSectionTitleBean=[[SectionTitleBean alloc] init];
        readSectionTitleBean.titleStr=@"阅读";
        readSectionTitleBean.sectionType=LCPlaneCellArticle;
        int learnReadProgress=[scDic[@"readProgress"] intValue];
        
        readSectionTitleBean.progressTipsStr=[LCUtils getLearnProgresstTips:learnReadProgress];
        int readRequireNum=[ruleDic[@"readNum"] intValue];
        readSectionTitleBean.tipsStr=[NSString stringWithFormat:@"%@%d%@",@"请学习并至少通过",readRequireNum,@"课件"];
        [self.sectionTitleArr addObject:readSectionTitleBean];
        
    }
    
    //考试数
    int quizNum =[ruleDic[@"quizNum"] intValue];
    if (quizNum>0) {
        [self parseExamData:self.messageDic[@"quizs"]];
        SectionTitleBean * examSectionTitleBean=[[SectionTitleBean alloc] init];
        examSectionTitleBean.titleStr=@"测评";
        examSectionTitleBean.tipsStr=@"请参加以下测评并达到要求分数";
        examSectionTitleBean.sectionType=LCPlaneCellExam;
        int examProgress=[scDic[@"quizProgress"] intValue];
        examSectionTitleBean.progressTipsStr=[LCUtils getLearnProgresstTips:examProgress];
 
        [self.sectionTitleArr addObject:examSectionTitleBean];
    }
    
    
}


/**
 解析必修选修数据
 */
-(void) parseReqArrAndOptArr:(NSArray *) dataArr{
    NSMutableArray * courseArr= [NSMutableArray new];
    [self.totalDataArr addObject:courseArr];
    for (int i=0; i<dataArr.count; i++) {
        NSDictionary * data=dataArr[i];
        LearnPlaneDetialBeanCourseFrame * learnCourseF=[[LearnPlaneDetialBeanCourseFrame alloc] init];
        CourseBean * courseBean=[[CourseBean alloc] init];
        courseBean.courseID=data[@"cri"];
        courseBean.trackType=_trackType;
        learnCourseF.courseBean=courseBean;
        //课件 dic
        NSDictionary * courseDic=data[@"courseware"];
        courseBean.courseName=courseDic[@"name"];
        [courseArr addObject:learnCourseF];
        NSArray *allKeys  =data.allKeys;
        NSDictionary * logDic;
        if([allKeys containsObject:@"log"]){
            courseBean.isStartLearn=YES;
            logDic=data[@"log"];
            courseBean.isPassed=[logDic[@"passed"] boolValue];
            courseBean.courseLeftStatusIcon=courseBean.isPassed?@"check.png":@"half.png";
        }else{
            courseBean.courseLeftStatusIcon=@"empty.png";
            
        }
        
        
        
    }
}


-(void) parseArticleData:(NSArray *) dataArr{
    //只显示1条，当超过1条显示加载更多 跳转至新页面
    NSMutableArray * articleArr=[NSMutableArray new];
    [self.totalDataArr addObject:articleArr];
    
    for (int i = 0; i<2; i++) {
        NSDictionary * articleDic=dataArr[i];
        LearnPlaneDetailArticleFrame *learnPlaneArticleF=[[LearnPlaneDetailArticleFrame alloc] init];
        ArticleBean * articleBean=[[ArticleBean alloc] init];
        
        
        articleBean.articleID=articleDic[@"id"];
        articleBean.articleTitle=articleDic[@"title"];
        articleBean.articleImg=articleDic[@"thumb"];
        articleBean.articleTitle=@"哈哈哈哈哈哈哈哈哈哈阿哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈阿哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈阿哈哈哈哈哈哈哈哈哈哈哈哈阿哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈阿哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈阿哈哈哈哈哈哈哈";
        learnPlaneArticleF.articleBean=articleBean;
        [articleArr addObject:learnPlaneArticleF];
    }
}

-(void) parseExamData:(NSArray *) dataArr{
    NSMutableArray * examArr=[NSMutableArray new];
    [self.totalDataArr addObject:examArr];
    
    for (int i = 0; i<dataArr.count; i++) {
        NSDictionary * dataDic=dataArr[i];
        NSDictionary * crpDic= dataDic[@"crp"];
        NSDictionary * settingDic=dataDic[@"settings"];
        LearnPlaneDetailExamFrame * learnPlaneDetailF=[[LearnPlaneDetailExamFrame alloc] init];
        ExamBean * examBean=[[ExamBean alloc] init];
        examBean.examTitle=crpDic[@"name"];
        examBean.passScore=[crpDic[@"passScore"] intValue];
        examBean.examStartTime=[settingDic[@"startTime"] longValue];
        examBean.examEndTime=[settingDic[@"endTime"] longValue];
        int canTryChance=[crpDic[@"tryCount"] intValue];
       
        if(_startType==START_TYPE_SET_TIME){
         examBean.examTime=[LCUtils long2TimeStr:examBean.examStartTime endTime:examBean.examEndTime midStr:@"-"];
        }else{
         examBean.examTime= [LCUtils long2Str:examBean.examEndTime];
        }
         int duracation=[crpDic[@"duration"] intValue];
        if (duracation<9999) {
            examBean.examDuration=[NSString stringWithFormat:@"时间：%d分钟",duracation];
        }

        NSArray * allKeys=dataDic.allKeys;
        int  getScore=0;
        int  lastChance=0;

        if ([allKeys containsObject:@"log"]) {
            //todo
            NSDictionary * logDic= dataDic[@"log"];
            NSArray * allKeys=logDic.allKeys;
            if ([allKeys containsObject:@"score"]) {
              getScore=[logDic[@"score"] intValue];
            }
            if ([allKeys containsObject:@"tryCount"]) {
                int  realTryChance=[logDic[@"tryCount"] intValue];
                lastChance=canTryChance-realTryChance;
            }
        }
        if(examBean.passScore==0){
           examBean.examScore=@"要求分数：不限";
        }else{
            if (getScore!=0) {
                examBean.examScore=[NSString  stringWithFormat:@"得分/要求分数: %d/%d",getScore,examBean.passScore ];
            }
        }
        if(_trackType==TRACK_TYPE_NO||_trackType==TRACK_TYPE_SIGN){
            if (examBean.passScore==0) {
                examBean.examScore=@"";
            }else{
                examBean.examScore=[NSString stringWithFormat:@"要求得分: %d",examBean.passScore];
            }
        }
        
        if (canTryChance<9999) {
            examBean.examChance=[NSString stringWithFormat:@"剩余次数: %d",lastChance];
        }
        
        learnPlaneDetailF.examBean=examBean;
        [examArr addObject:learnPlaneDetailF];
        
    }
    
}

@end


@implementation CourseBean



@end
@implementation ArticleBean



@end
@implementation SectionTitleBean



@end
@implementation ExamBean

@end


