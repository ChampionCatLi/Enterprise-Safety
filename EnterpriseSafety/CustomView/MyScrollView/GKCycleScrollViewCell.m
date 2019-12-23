//
//  GKCycleScrollViewCell.m
//  GKCycleScrollViewDemo
//
//  Created by QuintGao on 2019/9/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKCycleScrollViewCell.h"

@interface GKCycleScrollViewCell()
@property(nonatomic,strong) UIView * gayLineView;


@end

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
        
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).with.offset(-35);
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(15);
    }];
    [self addSubview:self.statusImageView];
    
    
    [_statusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@46);
        make.right.equalTo(self.mas_right);
    }];
    [self addSubview:self.gayLineView];
    
    [_gayLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
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
-(UIImageView *) statusImageView{
    
    if (_statusImageView==nil) {
        UIImage * image=[UIImage imageNamed:@"passed.png"];
        _statusImageView=[[UIImageView alloc] initWithImage:image];
        _statusImageView.hidden=NO;
    }
    
    return _statusImageView;
}
-(UIView *)gayLineView{
    
    if (_gayLineView==nil) {
        _gayLineView=[[UIView alloc] init];
        _gayLineView.backgroundColor=LCGayLineBDBDBD;
    }
    
    
    return _gayLineView;
    
}

-(UILabel *) planeTime{
    
    if (_planeTime==nil) {
        _planeTime=[[UILabel alloc] init];
        _planeTime.textColor=LCGay979797Color;
        _planeTime.font=[UIFont systemFontOfSize:12];
    }
    
    return  _planeTime;
}

@end
