//
//  OpenCourseFrame.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/3.
//  Copyright © 2020 chao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class OpenCourseData ;
@interface OpenCourseFrame : NSObject

@property(nonatomic,assign,readonly) CGRect nameF;
@property(nonatomic,assign,readonly) CGRect timeF;
@property(nonatomic,assign,readonly) CGRect descF;

@property(nonatomic,assign,readonly) CGRect selectButtonF;

@property(nonatomic,assign,readonly) CGFloat cellHeight;
@property(nonatomic,strong) OpenCourseData * openCourseData;

@end

NS_ASSUME_NONNULL_END
