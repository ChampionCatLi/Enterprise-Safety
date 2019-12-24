//
//  Utils.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/24.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LCUtils.h"
#define formatYYYYMMDD @"yyyy.MM.dd "
@implementation LCUtils


+(NSString *) long2Str:(long)longTime{
    
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:longTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatYYYYMMDD];
    NSString *dateStr = [formatter stringFromDate:date];
    
    return dateStr;
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


@end
