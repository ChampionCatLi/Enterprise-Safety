//
//  CircularPrograss.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/23.
//  Copyright © 2019 chao. All rights reserved.
//

#import "CircularPrograss.h"
#import "LCCircular.h"

@implementation CircularPrograss
{
    LCCircular *_circular;
    UILabel *_percentLabel;
    
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI
{
    float lineWidth = 0.1*self.bounds.size.width;
    _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _percentLabel.textColor = [UIColor grayColor];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = [UIFont boldSystemFontOfSize:15];
    _percentLabel.text = @"0%";
    [self addSubview:_percentLabel];
    
    _circular = [[LCCircular alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    [self addSubview:_circular];
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
    _circular.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

@end
