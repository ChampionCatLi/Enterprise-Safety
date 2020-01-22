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
