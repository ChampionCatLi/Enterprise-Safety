//
//  LCCircular.h
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/23.
//  Copyright © 2019 chao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCCircular : UIView

-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth;

@property (assign,nonatomic) float progress;

@property (assign,nonatomic) CGFloat lineWidth;
@end

NS_ASSUME_NONNULL_END
