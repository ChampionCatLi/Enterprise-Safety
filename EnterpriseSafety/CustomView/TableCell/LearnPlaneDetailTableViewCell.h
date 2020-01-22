//
//  LearnPlaneDetailTableViewCell.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/19.
//  Copyright © 2020 chao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LearnPlaneDetialBeanCourseFrame;
@class LearnPlaneDetailArticleFrame;

NS_ASSUME_NONNULL_BEGIN

@interface LearnPlaneDetailCourseTableViewCell : UITableViewCell

@property(nonatomic,strong) LearnPlaneDetialBeanCourseFrame * learnPlaneDetialBeanCourseFrame;

@end



@interface LearnPlaneDetailArticleCell  :  UITableViewCell

@property(nonatomic,strong) LearnPlaneDetailArticleFrame * learnPlaneDetailArticleFrame;

@end

NS_ASSUME_NONNULL_END
