//
//  LearnPlaneSection.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/22.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnPlaneSectionHeaderView.h"
@interface LearnPlaneSectionHeaderView()
@property(nonatomic,strong) UILabel * title;
@property(nonatomic,strong) UILabel * tips;
@property(nonatomic,strong) UILabel * progressTips;
@property(nonatomic,strong) UIView * gaySpace;


@end

@implementation LearnPlaneSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor greenColor];
        [self initView];
    }
    
    
    return self;
}

-(void) initView{
    [self addSubview:self.gaySpace];
    [self addSubview:self.title];
    [self addSubview:self.tips];
    [self addSubview:self.progressTips];
    
}

-(void)setTitle:(NSString *)titleStr setTips:(NSString *)tipsStr setProgressTips:(NSString *)progressTipsStr
{
    self.title.text=titleStr;
    self.tips.text=tipsStr;
    self.progressTips.text=progressTipsStr;
    
    
}

-(UILabel *) title{
    
    if (_title==nil) {
        
        _title=[[UILabel alloc] initWithFrame:CGRectMake(LCMAEGIN_15,25, 60, 15)];
        _title.textColor=LCBlack333333;
        _title.font=LCFont15;
    }
    return _title;
}


-(UILabel *) tips{
    if (_tips==nil) {
        _tips=[[UILabel alloc] initWithFrame:CGRectMake(LCMAEGIN_15, 50, 180, 15)];
        _tips.font=LCFont12;
        _tips.textColor=LCGay979797;
    }
    return _tips;
}

-(UILabel *) progressTips{
    if (_progressTips==nil) {
        _progressTips=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-75, 50, 120, 15)];
        _progressTips.font=LCFont12;
        _progressTips.textColor=LCGay979797;
    }
    return _progressTips;
}

-(UIView *)gaySpace{
    if (_gaySpace==nil) {
        _gaySpace=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
        _gaySpace.backgroundColor=[UIColor greenColor];
    }
    
    return _gaySpace;
}
@end
