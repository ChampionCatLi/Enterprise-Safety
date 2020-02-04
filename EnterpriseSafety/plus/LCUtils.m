//
//  Utils.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/24.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LCUtils.h"
#define formatYYYYMMDD @"yyyy.MM.dd "
#define formatYYYYMMDDHHMM @"yyyy-MM-dd HH:MM"
#define formatMMDDHHMM @"MM-dd HH:MM"

@implementation LCUtils


+(NSString *) long2Str:(long)longTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:longTime/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatYYYYMMDD];
    NSString *dateStr = [formatter stringFromDate:date];
    
    return dateStr;
}

//文章时间格式化
+(NSString *) articleLong2Str:(long)time{

  NSDate *targetDate = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSDateFormatter * formatter =[[NSDateFormatter alloc] init];

    if ([self isNowYear:targetDate]) {
        [formatter setDateFormat:formatMMDDHHMM];
     
    }else{
         [formatter setDateFormat:formatYYYYMMDDHHMM];
    }
       return [formatter stringFromDate:targetDate];
    
}
//学习计划时间格式化

+ (NSString *)planeLong2str:(long)startTime endTime:(long)endTime{
    NSDateFormatter * formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatYYYYMMDD];
    NSDate * startData=[NSDate dateWithTimeIntervalSince1970:startTime/1000];
    NSDate * endData =[NSDate dateWithTimeIntervalSince1970:endTime/1000];
    
    
    
    NSString * startTimeStr=[formatter stringFromDate:startData ];
    NSString * endTimeStr = [formatter stringFromDate:endData];
    NSString * tempTimeStr=@"学习时间: ";
    tempTimeStr=[tempTimeStr stringByAppendingString:startTimeStr];
    tempTimeStr=[tempTimeStr stringByAppendingString:@"- "];
    tempTimeStr=[tempTimeStr stringByAppendingString:endTimeStr];
    
    return tempTimeStr;

}
+(NSString *)long2TimeStr:(long)startTime endTime:(long)endTime midStr:(NSString *)mindStr{
    NSString * startTimeStr =[self long2Str:startTime];
    NSString * endTimeStr =[self long2Str:endTime];
    return [NSString stringWithFormat:@"%@ %@ %@",startTimeStr,mindStr,endTimeStr ];

}

+(NSString *)appendLong2Str:(long) startTime endTime:(long)endTime{
    
    
    NSString * startTimeStr=[self long2Str:startTime];
    NSString * endTimeStr=[self long2Str:endTime];
    NSString * tempStr=@"学习时间: ";
//    tempStr=[[NSString alloc] stringw:@"%@",@"%@",startTimeStr,endTimeStr];
    tempStr=[tempStr stringByAppendingString:startTimeStr];
    tempStr=[tempStr stringByAppendingString:@"- "];
    tempStr=[tempStr stringByAppendingString:endTimeStr];
    return tempStr;
}


+(BOOL) isNowYear:(NSDate *)tatgetDate{
    
     
     NSCalendar *calendar = [NSCalendar currentCalendar];

     int unit = NSCalendarUnitYear;
        
       // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
        // 2.获得self的年月日
    NSDateComponents *targetCmps = [calendar components:unit fromDate:tatgetDate];

    return  nowCmps.year == targetCmps.year;
}

+ (CGSize)get12LabelSize:(NSString *)contentText viewWith:(CGFloat)viewWith{
    return  [self getLabelSize:contentText viewWith:viewWith fontSize:LCFont12];
    
}
+ (CGSize)get15LabelSize:(NSString *)contentText viewWith:(CGFloat)viewWith{
        return  [self getLabelSize:contentText viewWith:viewWith fontSize:LCFont15];
}
+ (CGSize)getLabelSize:(NSString *)contentText viewWith:(CGFloat)viewWith fontSize:(UIFont *)fontSize{
    return  [contentText sizeWithFont:fontSize constrainedToSize:CGSizeMake(viewWith,MAXFLOAT)];
}

+(CGFloat) getSingleHeight:(CGFloat)viewWith fontsize:(UIFont *)fontSize{
    return [self getLabelSize:@"example" viewWith:viewWith fontSize:fontSize].height;
}

+(NSString *)getLearnProgresstTips:(int)learnProgress{
    
    return [NSString stringWithFormat:@"%@%d%@",@"进度：",learnProgress,@"%"];
    
}
@end
