//
//  GKCycleScrollViewCell.h
//  GKCycleScrollViewDemo
//
//  Created by QuintGao on 2019/9/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GKCycleScrollViewCell;

typedef void(^cellClickBlock)(NSInteger index);
typedef void (^cellTititleLabelClickBlock)(NSInteger index);

@interface GKCycleScrollViewCell : UIView<UIGestureRecognizerDelegate>

/**
 标题
 */

@property(nonatomic,strong) UILabel * titleLabel;
/**
 是否通过状态
 */
@property(nonatomic,strong) UIImageView * statusImageView;

/**
 学习时间
 */
@property(nonatomic,strong) UILabel * planeTime;
/**
 学习 button
 */
@property(nonatomic,strong) UIButton * learnButton;


/**
 cell点击回调
 */
@property (nonatomic, copy) cellClickBlock  didCellClick;
@property (nonatomic,copy) cellTititleLabelClickBlock didCellTitleLabelClick;
- (void)setupCellFrame:(CGRect)frame;

@end
