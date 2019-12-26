//
//  OpenCourseData.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/26.
//  Copyright © 2019 chao. All rights reserved.
//

#import "OpenCourseData.h"

@interface OpenCourseData ( )

@property(nonatomic,assign) NSInteger startMode;
@property(nonatomic,assign) long startDate;
@property(nonatomic,assign) long  endDate;

@property(nonatomic,assign) NSInteger duration;
@property(nonatomic,assign) NSInteger priceRuleId;
@property(nonatomic,assign) NSInteger ruleId;

@end

@implementation OpenCourseData


-(instancetype) initWithDict:(NSDictionary *)clazz rule:(NSDictionary *)rule{
   
    if (self =[super init]) {
      self.name= rule[@"name"];
        self.desc=rule[@"desc"];
        self.priceRuleId=[clazz[@"priceRuleId"] intValue];
        self.startMode=[clazz[@"startMode"] intValue];
        self.ruleId=[clazz[@"ruleId"] intValue ];
        if (self.startMode==course_start_model_set_time) {
            self.startDate=[clazz[@"startDate"] intValue];
            self.endDate=[clazz[@"endDate"]  intValue];
            self.showDuration=[LCUtils appendLong2Str:self.startDate endTime:self.endDate];
            
        }else{
            self.duration=[clazz[@"duration"] intValue];
            self.showDuration=[NSString stringWithFormat:@"%ld%@",(long)self.duration,@"天"];
        }
        
    }
    return self;
}
@end
