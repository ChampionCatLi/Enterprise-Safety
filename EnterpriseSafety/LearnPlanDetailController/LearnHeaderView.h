//
//  LearnHeaderView.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/9.
//  Copyright © 2020 chao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LearnHeaderView : UIView
-(void) setPlaneName:(NSString *)planeName setPlaneDesc:(NSString *) planeDesc setPlaneTime:(NSString *) planeTime;
@property(nonatomic,assign)CGFloat  headerHeight;

@end

NS_ASSUME_NONNULL_END
