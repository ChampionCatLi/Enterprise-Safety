//
//  OpenCourseFrame.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/3.
//  Copyright © 2020 chao. All rights reserved.
//

#import "OpenCourseFrame.h"
#import "OpenCourseData.h"


@implementation OpenCourseFrame

-(void) setOpenCourseData:(OpenCourseData *)openCourseData{
    
    _openCourseData=openCourseData;
    
    //标题 frame
    CGSize nameSize = [_openCourseData.name sizeWithAttributes:@{NSFontAttributeName:LCFont15} ];
    CGFloat nameX =LCMAEGIN_15;
    CGFloat nameY= LCMAEGIN_15;
    _nameF=CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //时间 frame
    
    CGSize timeSize =[_openCourseData.showDuration sizeWithAttributes:@{NSFontAttributeName:LCFont12}];
    CGFloat timeX=LCMAEGIN_15;
    CGFloat timeY =LCMAEGIN_15+ nameY+15 ;
    _timeF=CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    
    //描述 frame
    CGFloat descX=LCMAEGIN_15;
    CGFloat descY=LCMAEGIN_15+timeY+15;
    CGFloat descWith=SCREEN_WIDTH-30;
    CGSize descSize =[_openCourseData.desc sizeWithFont:LCFont12 constrainedToSize:CGSizeMake(descWith,MAXFLOAT)];
    _descF=CGRectMake(descX, descY, descWith, descSize.height);
    
    //选择按钮
    CGFloat selectButtonW= 64;
    CGFloat selectButtonH= 24;
    CGFloat selectButtonX=SCREEN_WIDTH-LCMAEGIN_15-selectButtonW;
    CGFloat selectButtonY=LCMAEGIN_15;
    _selectButtonF=CGRectMake(selectButtonX, selectButtonY, selectButtonW, selectButtonH);
    
    
    
    if (_openCourseData.desc.length==0) {
        _cellHeight=LCMAEGIN_15+CGRectGetMaxY(_timeF);
    }else{
         _cellHeight=LCMAEGIN_15+CGRectGetMaxY(_descF);
    }
}



@end
