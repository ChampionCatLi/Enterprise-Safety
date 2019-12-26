//
//  OpenCourseTableViewCell.h
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/26.
//  Copyright © 2019 chao. All rights reserved.
//
/**
 主页 开放选课 cell
 */
#import <UIKit/UIKit.h>
#import "OpenCourseData.h"
NS_ASSUME_NONNULL_BEGIN

@interface OpenCourseTableViewCell : UITableViewCell

+(void) setOpenCourseData : (OpenCourseData *) openCourseData;

@end

NS_ASSUME_NONNULL_END
