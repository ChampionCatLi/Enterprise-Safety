//
//  OpenCourseData.h
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/26.
//  Copyright © 2019 chao. All rights reserved.
//
/**
 主页 开放课程 数据封装类
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCourseData : NSObject

@property(nonatomic,assign) NSInteger id;
@property(nonatomic,strong) NSString * name;

@property(nonatomic,strong) NSString * desc;
@property(nonatomic,assign) NSInteger fee;
@property(nonatomic,strong) NSString * showDuration;

-(instancetype) initWithDict:(NSDictionary *) clazz rule: (NSDictionary *) rule;

+(instancetype) new NS_UNAVAILABLE;
-(instancetype) init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
