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

@end
