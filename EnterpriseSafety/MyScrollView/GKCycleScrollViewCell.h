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
 cell点击回调
 */
@property (nonatomic, copy) cellClickBlock  didCellClick;
@property (nonatomic,copy) cellTititleLabelClickBlock didCellTitleLabelClick;
- (void)setupCellFrame:(CGRect)frame;

@end