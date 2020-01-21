//
//  LearnPlaneBean.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.


#import "LearnPlaneDetialBean.h"
#import <XMNetworking.h>
@interface LearnPlaneDetialBean()

@property(nonatomic,strong) NSString * clazzID;


@end

@implementation LearnPlaneDetialBean

- (void)setMessageDic:(NSDictionary *)messageDic setArticleDicArr:(nullable NSArray *)articleDicArr{
    _messageDic=messageDic;
    _articleDicArr=articleDicArr;
    self.totalDataArr =[NSMutableArray new ];
    NSDictionary * clazzDic=messageDic[@"clazz"];
    self.clazzID=[clazzDic[@"id"] stringValue];
    
    NSDictionary * ruleDic=messageDic[@"rule"];
    [self parseRuleDic:ruleDic];
    NSDictionary * scDic=messageDic[@"sc"];
    NSString * name= ruleDic[@"name"];
}
-(void) parseRuleDic:(NSDictionary *) ruleDic{
    //学习模式
    int learnMode=[ruleDic[@"learnMode"] intValue];
    //必修课件数
    int reqNum=[ruleDic[@"reqNum"] intValue];
    if (reqNum>0) {
        [self parseReqArrAndOptArr:self.messageDic[@"reqs"]] ;
    }
    //选修课件数
    int optNum=[ruleDic[@"optNum"] intValue ];
    if (optNum>0) {
        [self parseReqArrAndOptArr:self.messageDic[@"opts"]];
    }
 
    //阅读数
    if (_articleDicArr!=nil) {
        [self parseArticleData:_articleDicArr];
    }
    
    //考试数
    int quizNum =[ruleDic[@"quizNum"] intValue];
    if (quizNum>0) {
        
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
        learnCourseF.courseBean=courseBean;
        //课件 dic
        NSDictionary * courseDic=data[@"courseware"];
        courseBean.courseName=courseDic[@"name"];
        [courseArr addObject:learnCourseF];
        NSArray *allKeys  =data.allKeys;
        if([allKeys containsObject:@"log"]){
            courseBean.isStartLearn=YES;
            NSDictionary * logDic=data[@"log"];
            courseBean.isPassed=[logDic[@"passed"] boolValue];
            
        }
    }
}




-(void) parseArticleData:(NSArray *) dataArr{
    //只显示1条，当超过1条显示加载更多 跳转至新页面
    NSMutableArray * articleArr=[NSMutableArray new];
    [self.totalDataArr addObject:articleArr];
    
    for (int i = 0; i<2; i++) {
        NSDictionary * articleDic=dataArr[i];
        ArticleBean * articleBean=[[ArticleBean alloc] init];
        [articleArr addObject:articleBean];
        articleBean.articleID=articleDic[@"id"];
        articleBean.articleTitle=articleDic[@"title"];
        articleBean.articleImg=articleDic[@"thumb"];
    }
}

@end


@implementation CourseBean



@end
@implementation ArticleBean



@end


