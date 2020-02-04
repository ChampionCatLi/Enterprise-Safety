//
//  OpenCourseTableVIewTitleTableViewCell.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/3.
//  Copyright © 2020 chao. All rights reserved.
//
#import "OpenCourseTableViewTitleTableViewCell.h"

@interface  OpenCourseTableViewTitleTableViewCell()
@property(nonatomic,strong) UILabel * titleLabel;
@end


@implementation OpenCourseTableViewTitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLabel];
        
    }

    return  self;
}


-(UILabel *) titleLabel{
    if (_titleLabel==nil) {
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 20)];
        _titleLabel.text=@"可选课程";
        _titleLabel.textColor=LCBlack333333;
        _titleLabel.font=LCFont15;
        _titleLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _titleLabel;
}



@end
