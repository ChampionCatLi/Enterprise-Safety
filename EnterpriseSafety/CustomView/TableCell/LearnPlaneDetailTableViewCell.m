//
//  LearnPlaneDetailTableViewCell.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/19.
//  Copyright © 2020 chao. All rights reserved.
//


#import "LearnPlaneDetailTableViewCell.h"
#import "LearnPlaneBeanFrame.h"
#import "LearnPlaneDetialBean.h"

#pragma mark --必修 选修--
@interface LearnPlaneDetailCourseTableViewCell()

@property(nonatomic,strong) UIImageView * ivCourseLeftStatus;
@property(nonatomic,strong) UILabel *   labCourseTitle;
@property(nonatomic,strong) UIImageView * ivCourseRightStatus;

@end


@implementation LearnPlaneDetailCourseTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initView];
        
    }
    return  self;
}


-(void) initView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.ivCourseLeftStatus];
    [self.contentView addSubview:self.ivCourseRightStatus];
    [self.contentView addSubview:self.labCourseTitle];
    
}


-(void)setLearnPlaneDetialBeanCourseFrame:(LearnPlaneDetialBeanCourseFrame *)learnPlaneDetialBeanCourseFrame{
    
    _learnPlaneDetialBeanCourseFrame=learnPlaneDetialBeanCourseFrame;
    self.labCourseTitle.frame=learnPlaneDetialBeanCourseFrame.courseTitleF;
    self.ivCourseLeftStatus.frame=learnPlaneDetialBeanCourseFrame.courseLeftStatusF;
    self.ivCourseRightStatus.frame=learnPlaneDetialBeanCourseFrame.courseRightStatusF;
    self.labCourseTitle.text= learnPlaneDetialBeanCourseFrame.courseBean.courseName;

}

-(UILabel *) labCourseTitle{
    
    if (_labCourseTitle==nil) {
        _labCourseTitle=[[UILabel alloc] init];
        _labCourseTitle.font=LCFont15;
        _labCourseTitle.textColor=LCBlack333333;
    }
    
    return _labCourseTitle;
}
-(UIImageView *)ivCourseLeftStatus{
    if (_ivCourseLeftStatus==nil) {
        _ivCourseLeftStatus=[[UIImageView alloc] init];
        
    }
    
    return _ivCourseLeftStatus;
}
-(UIImageView *) ivCourseRightStatus{
    if (_ivCourseRightStatus==nil) {
        _ivCourseRightStatus=[[UIImageView alloc] init];
    }
    return _ivCourseRightStatus;
}
@end



#pragma mark --文章cell--
@interface LearnPlaneDetailArticleCell()

@property(nonatomic,strong) UILabel * articleTitleLabel;
@property(nonatomic,strong) UIImageView * articlePic;
@property(nonatomic,strong) UIImageView *  articleStatusPic;
 
@end

@implementation  LearnPlaneDetailArticleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initView];
    }
    return self;
}



-(void)setLearnPlaneDetailArticleFrame:(LearnPlaneDetailArticleFrame *)learnPlaneDetailArticleFrame{
    _learnPlaneDetailArticleFrame=learnPlaneDetailArticleFrame;

    self.articlePic.frame=_learnPlaneDetailArticleFrame.articleImgF;
    self.articleTitleLabel.frame=_learnPlaneDetailArticleFrame.articleTitleF;
    
    self.articleStatusPic.frame= _learnPlaneDetailArticleFrame.articleStatusF;
    
    self.articleTitleLabel.text=_learnPlaneDetailArticleFrame.articleBean.articleTitle;
    
}


-(void) initView{
    [self.contentView addSubview:self.articleTitleLabel];
    [self.contentView addSubview:self.articlePic];
    [self.contentView addSubview:self.articleStatusPic];
}

-(UILabel *) articleTitleLabel{
    if (_articleTitleLabel==nil) {
        _articleTitleLabel=[[UILabel alloc] init];
        _articleTitleLabel.numberOfLines=0;
        _articleTitleLabel.font=LCFont15;
    }
    return _articleTitleLabel;
}
-(UIImageView *) articlePic{
    if (_articlePic==nil) {
        _articlePic=[[UIImageView alloc] init];
    }
    return _articlePic;
}
-(UIImageView *)articleStatusPic{
    
    if (_articleStatusPic==nil) {
        _articleStatusPic=[[UIImageView alloc] init];
    }
    
    return _articleStatusPic;
}

@end
#pragma  mark --测评cell--
@interface LearnPlaneDetailExamCell()

@property(strong,nonatomic) UILabel * examTitle;
@property(strong,nonatomic) UILabel * examTime;
@property(strong,nonatomic) UILabel * examChance;
@property(strong,nonatomic) UILabel * examScore;
@property(strong,nonatomic) UIImageView * examIcon;
@property(strong,nonatomic) UILabel * examDuration;
 
@end

@implementation LearnPlaneDetailExamCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        [self initView];
    }
    return self;
    
}


-(void) initView{
    
    
    [self.contentView addSubview:self.examTitle];
    [self.contentView addSubview:self.examTime];
    [self.contentView addSubview:self.examScore];
    [self.contentView addSubview:self.examIcon];
    [self.contentView addSubview:self.examChance];
    [self.contentView addSubview:self.examDuration];

}

- (void)setLearnPlaneDetailExamFrame:(LearnPlaneDetailExamFrame *)learnPlaneDetailExamFrame{
    _learnPlaneDetailExamFrame=learnPlaneDetailExamFrame;
    self.examTitle.frame=learnPlaneDetailExamFrame.examTitleF;
    self.examTime.frame=learnPlaneDetailExamFrame.examTimeF;
    self.examScore.frame=learnPlaneDetailExamFrame.examScoreF;
    self.examChance.frame=learnPlaneDetailExamFrame.examChanceF;
    self.examDuration.frame=learnPlaneDetailExamFrame.examDurationF;
    [self setViewData:learnPlaneDetailExamFrame.examBean];
    
}
-(void) setViewData:(ExamBean *) examBean{
    self.examTitle.text=examBean.examTitle;
    self.examTime.text=examBean.examTime;
    self.examScore.text=examBean.examScore;
    self.examDuration.text=examBean.examDuration;
    self.examChance.text=examBean.examChance;
    
}

-(UILabel *) examTitle{
    
    if (_examTitle==nil) {
        _examTitle=[[UILabel alloc] init];
        _examTitle.font=LCFont15;
        _examTitle.textColor=LCBlack333333;
        _examTitle.numberOfLines=1;
    }
    
    return _examTitle;
}

-(UILabel *) examTime{
    
    if (_examTime==nil) {
        _examTime=[[UILabel alloc] init];
        _examTime.font=LCFont12;
        _examTime.textColor=LCGay9E9E9E;
        
    }
    
    return _examTime;
}
-(UILabel *) examScore{
    if (_examScore==nil) {
        _examScore=[[UILabel alloc] init];
        _examScore.font=LCFont12;
        _examScore.textColor=LCGay9E9E9E;
    }
    
    return _examScore;
}
-(UILabel *) examChance{
    if (_examChance==nil) {
        _examChance=[[UILabel alloc] init];
        _examChance.font =LCFont12;
        _examChance.textColor=LCGay9E9E9E;
    }
    return _examChance;
}
-(UIImageView *) examIcon{
    if (_examIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"arrow_r.png"];
        _examIcon=[[UIImageView alloc] initWithImage:image];
        _examIcon.frame=CGRectMake(SCREEN_WIDTH-35, self.contentView.center.y, 20, 20);
        
    }
    
    return _examIcon;
}
-(UILabel *) examDuration{
    if (_examDuration==nil) {
        _examDuration=[[UILabel alloc] init];
        _examDuration.font=LCFont12;
        _examDuration.textColor=LCGay9E9E9E;
    }
    
    return _examDuration;
}

@end
