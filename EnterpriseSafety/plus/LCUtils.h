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
@end
NS_ASSUME_NONNULL_END
