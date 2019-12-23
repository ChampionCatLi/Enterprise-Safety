//
//  GKCycleScrollViewCell.m
//  GKCycleScrollViewDemo
//
//  Created by QuintGao on 2019/9/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKCycleScrollViewCell.h"

@implementation GKCycleScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        [self initView];
    }
    return self;
}

-(void) initView{
    self.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.titleLabel];
        
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).with.offset(-35);
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(15);
    }];
    
}

-(void)handleTitleLabelGesture:(UITapGestureRecognizer *)tap{
    NSInteger labelTag=0x111+self.tag;
    if (_didCellTitleLabelClick) {
        _didCellTitleLabelClick(labelTag);
    }
    
}
- (void)handleTapGesture:(UITapGestureRecognizer *)tap {
    !self.didCellClick ? : self.didCellClick(self.tag);
}

- (void)setupCellFrame:(CGRect)frame {
    self.titleLabel.frame=frame;
}

#pragma mark - 懒加载

- (UILabel *) titleLabel{
    if (!_titleLabel) {
        _titleLabel =[UILabel new];
        _titleLabel.font=[UIFont systemFontOfSize:17];
        _titleLabel.numberOfLines=1;
        _titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        _titleLabel.userInteractionEnabled=YES;
        UITapGestureRecognizer * titleLabelTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTitleLabelGesture:)];
        [_titleLabel addGestureRecognizer:titleLabelTap];
        
    }
    return _titleLabel;
}



@end
