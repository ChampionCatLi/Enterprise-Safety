//
//  LearnPlaneBeanFrame.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/19.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnPlaneBeanFrame.h"
#import "LearnPlaneDetialBean.h"

@implementation LearnPlaneBeanFrame

@end


@implementation LearnPlaneDetialBeanCourseFrame

- (void)setCourseBean:(CourseBean *)courseBean{
    _courseBean=courseBean;
    
    CGFloat courseLeftStatusX=LCMAEGIN_15;
    CGFloat courseLeftStatusY=LCMAEGIN_15;
    CGFloat courseLeftStatusW=20;
    CGFloat courseLeftStatusH=20;
    
    self.courseLeftStatusF=CGRectMake(courseLeftStatusX, courseLeftStatusY, courseLeftStatusW, courseLeftStatusH);
    
    CGFloat courseRightStatusW=20;
    CGFloat courseRightStatusH=20;
    CGFloat courseRightStatusX=SCREEN_WIDTH-LCMAEGIN_15-courseRightStatusW;
    CGFloat courseRightStatusY=LCMAEGIN_15;
    self.courseRightStatusF=CGRectMake(courseRightStatusX, courseRightStatusY, courseRightStatusW, courseRightStatusH);
    
    
    
    CGFloat courseTitleX=courseLeftStatusX+courseLeftStatusW+LCMAEGIN_15;
    CGFloat courseTitleY=LCMAEGIN_15;
    CGFloat courseTitleW=SCREEN_WIDTH-courseLeftStatusW-courseRightStatusW-LCMAEGIN_15;
    CGFloat courseTitleH=25;
    self.courseTitleF=CGRectMake(courseTitleX, courseTitleY, courseTitleW, courseTitleH);
    
    self.cellHeight=LCMAEGIN_15+CGRectGetMaxY(_courseLeftStatusF);
    
}

@end


@implementation LearnPlaneDetailArticleFrame

-(void)setArticleBean:(ArticleBean *)articleBean{
    _articleBean=articleBean;
    
    
    CGFloat articleImgH=60;
    CGFloat articleImgW=80;
    CGFloat articleImgX=SCREEN_WIDTH-articleImgW-LCMAEGIN_15;
    CGFloat articleImgY=LCMAEGIN_15;
    
    CGFloat articleTitleX=LCMAEGIN_15;
    CGFloat articleTitleY=LCMAEGIN_15;
    CGFloat articleTitleW;
    if(articleBean.articleImg.length==0){
        articleTitleW=SCREEN_WIDTH-LCMAEGIN_15;
    }else{
        articleTitleW=SCREEN_WIDTH-articleImgW-LCMAEGIN_15;
        self.articleImgF=CGRectMake(articleImgX, articleImgY, articleImgW, articleImgH);
    }
    CGSize articleSize=[LCUtils get15LabelSize:articleBean.articleTitle viewWith:articleTitleW];
    self.articleTitleF=CGRectMake(articleTitleX, articleTitleY, articleTitleW, articleSize.height);
    
    self.cellHeightA=CGRectGetMaxY(_articleTitleF);
    
    
    
}

@end
