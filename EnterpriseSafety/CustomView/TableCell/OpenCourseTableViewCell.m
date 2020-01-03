//
//  OpenCourseTableViewCell.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/26.
//  Copyright © 2019 chao. All rights reserved.
//
#import "OpenCourseTableViewCell.h"
#import "OpenCourseFrame.h"
#import "OpenCourseData.h"



@interface  OpenCourseTableViewCell()
@property(nonatomic,strong) UILabel * courseNameLabel;
@property(nonatomic,strong) UILabel * courseDescLabel;
@property(nonatomic,strong) UILabel * courseTimeLabel;
@property(nonatomic,strong) UIButton *  selectButton;

@end


@implementation OpenCourseTableViewCell

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSelfView];
    }
    return self;
    
}
-(void)setOpenCourseFrame:(OpenCourseFrame *)openCourseFrame{
    _openCourseFrame=openCourseFrame;
    
    [self settingData];
    [self settingSubviewFrame];
    
}
-(void) settingData{
    
    OpenCourseData * openCourseData=self.openCourseFrame.openCourseData;
    self.courseNameLabel.text=openCourseData.name;
    self.courseTimeLabel.text=openCourseData.showDuration;
  
    if (openCourseData.desc.length==0) {
        self.courseDescLabel.hidden=YES;
    }else{
          self.courseDescLabel.text=openCourseData.desc;
        self.courseDescLabel.hidden=NO;
    }
}


-(void) settingSubviewFrame{
    self.courseNameLabel.frame=self.openCourseFrame.nameF;
    self.courseDescLabel.frame=self.openCourseFrame.descF;
    self.courseTimeLabel.frame=self.openCourseFrame.timeF;
    self.selectButton.frame=self.openCourseFrame.selectButtonF;

}


#pragma mark - 初始化 view
-(void) addSelfView{
    [self.contentView addSubview:self.courseNameLabel];
    [self.contentView addSubview:self.courseTimeLabel ];
    [self.contentView addSubview:self.courseDescLabel];
    [self.contentView addSubview:self.selectButton];
    
}



-(UILabel *) courseNameLabel{
    if (_courseNameLabel==nil) {
        _courseNameLabel=[[UILabel alloc] init];
        _courseNameLabel.textColor=LCBlack333333;
        _courseNameLabel.font=LCFont15;
        _courseNameLabel.adjustsFontSizeToFitWidth=YES;
        _courseNameLabel.numberOfLines=1;
    }
    return _courseNameLabel;

}
-(UILabel *) courseDescLabel{
    if(_courseDescLabel==nil){
        _courseDescLabel=[[UILabel alloc] init];
        _courseDescLabel.font=LCFont12;
        _courseDescLabel.backgroundColor=[UIColor greenColor];
        _courseDescLabel.textColor=LCGay979797;
        _courseDescLabel.numberOfLines=0;
    }
    return _courseDescLabel;


}
-(UILabel *) courseTimeLabel{
    if (_courseTimeLabel==nil) {
        _courseTimeLabel=[[UILabel alloc] init];
        _courseTimeLabel.textColor=LCGay979797;
        _courseTimeLabel.font=LCFont12;
        _courseTimeLabel.adjustsFontSizeToFitWidth=YES;
    }
    
    return _courseTimeLabel;
    
}
-(UIButton *) selectButton{
    if (_selectButton==nil) {
        _selectButton=[[UIButton alloc] init];
        [_selectButton setTitle:@"我要选课" forState:UIControlStateNormal];
        _selectButton.titleLabel.font=[UIFont systemFontOfSize:12];
        _selectButton.backgroundColor=LCBlueColor;
        [_selectButton.layer setMasksToBounds:YES];
        [_selectButton.layer setCornerRadius:5];
        [_selectButton setTitleColor:[UIColor whiteColor ]forState:UIControlStateNormal];
    }
    return _selectButton;
}






@end
