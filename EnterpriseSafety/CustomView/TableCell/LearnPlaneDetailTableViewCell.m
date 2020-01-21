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
        _ivCourseRightStatus==[[UIImageView alloc] init];
    }
    return _ivCourseRightStatus;
}
@end
