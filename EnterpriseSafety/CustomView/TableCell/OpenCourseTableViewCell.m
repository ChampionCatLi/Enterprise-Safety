//
//  OpenCourseTableViewCell.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/26.
//  Copyright © 2019 chao. All rights reserved.
//
#import "OpenCourseTableViewCell.h"




@interface  OpenCourseTableViewCell()
@property(nonatomic,strong) UIView * itemView;
@property(nonatomic,strong) UILabel * courseNameLabel;
@property(nonatomic,strong) UILabel * courseDescLabel;
@property(nonatomic,strong) UILabel * courseTimeLabel;
@property(nonatomic,strong) UIButton *  selectButton;

@end




@implementation OpenCourseTableViewCell



-(void) setOpenCourseData:(OpenCourseData *)openCourseData{
    [self initView];
    [self fillData:openCourseData];
}

#pragma mark - 填充data
-(void) fillData:(OpenCourseData *) openCourseData{
    _courseNameLabel.text=openCourseData.name;
    _courseTimeLabel.text=openCourseData.showDuration;
    if (openCourseData.desc.length == 0) {
        self.courseDescLabel.hidden=YES;
  
 
    }else{
         self.courseDescLabel.hidden=NO;
       _courseDescLabel.text=openCourseData.desc;

    }
    
    
}
#pragma mark - 初始化 view
-(void) initView{



    [self.contentView addSubview:self.courseNameLabel];

    [_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(15);

    }];

    [self.contentView addSubview:self.courseTimeLabel ];
    [_courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.courseNameLabel.mas_bottom).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(15);
    }];

    [self.contentView addSubview:self.courseDescLabel];

    [_courseDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.courseTimeLabel.mas_bottom).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);

    }];

}


#pragma mark - 初始化 view
//-(void) initView{
//
//    [self.contentView addSubview:self.itemView];
//    [_itemView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.mas_top).offset(15);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
//        make.left.equalTo(self.contentView.mas_left).offset(15);
//        make.right.equalTo(self.contentView.mas_right).offset(-15);
//
//    }];
//
//    [self.itemView addSubview:self.courseNameLabel];
//
//    [_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(self.itemView.mas_top);
//        make.left.equalTo(self.itemView.mas_left);
//        make.height.equalTo(@15);
//    }];
//
//    [self.itemView addSubview:self.courseTimeLabel ];
//    [_courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.courseNameLabel.mas_bottom).offset(15);
//        make.left.equalTo(self.itemView.mas_left);
//    }];
//
//    [self.itemView addSubview:self.courseDescLabel];
//
//    [_courseDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.courseTimeLabel.mas_bottom);
//        make.left.equalTo(self.itemView.mas_left);
//
//    }];
//
//}

-(UIView *) itemView{
    if (_itemView==nil) {
        _itemView=[[UIView alloc] init];
    }
    return _itemView;
    
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
        _courseDescLabel.textColor=LCGay979797;
        _courseDescLabel.numberOfLines=0;

        _courseTimeLabel.adjustsFontSizeToFitWidth=YES;
        
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
    }
    return _selectButton;
}






@end
