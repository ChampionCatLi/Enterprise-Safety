//
//  Utils.h
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/24.
//  Copyright © 2019 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCUtils : NSObject
+(NSString *)long2Str:(long )time;

+(NSString *) articleLong2Str:(long)time;

+(NSString *) appendLong2Str:(long)startTime  endTime:(long)endTime;
+(NSString *) planeLong2str:(long)startTime endTime :(long) endTime;

+(CGSize) get12LabelSize:(NSString *)contentText viewWith:(CGFloat) viewWith;
+(CGSize) get15LabelSize:(NSString *)contentText viewWith:(CGFloat) viewWith;
+(CGSize) getLabelSize:(NSString *) contentText viewWith:(CGFloat) viewWith fontSize:(UIFont *) fontSize;
//获取单行高度。
+(CGFloat)getSingleHeight:(CGFloat)viewWith fontsize:(UIFont *)fontSize;

//获取学习计划 详情列表 进度 提示  progresstips
+(NSString *) getLearnProgresstTips:(int )learnProgress;
@end
NS_ASSUME_NONNULL_END
