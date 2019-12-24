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
@property(nonatomic,strong) UIView * refreshLayout;
@property(nonatomic,strong) UIImageView * refreshImage;
@property(nonatomic,strong) UILabel * refreshTitle;

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
        make.width.equalTo(self).offset(-35);
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(15);
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
    [self addSubview:self.planeTime];
    
    [_planeTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.top.equalTo(self.gayLineView.mas_bottom).offset(15);
        make.left.equalTo(self).offset(15);
    }];
    
    
    [self addSubview:self.refreshLayout];
    [_refreshLayout  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gayLineView.mas_bottom).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@15);
        make.right.equalTo(self.mas_right).offset(-15);
        
    }];
    [self.refreshLayout addSubview:self.refreshImage];
    [_refreshImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.refreshLayout.mas_centerY);
        make.left.equalTo(self.refreshLayout.mas_left).offset(5);
        make.size.equalTo(@15);
    }];
    
    [self.refreshLayout addSubview:self.refreshTitle];
    [_refreshTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.refreshLayout);
        make.height.equalTo(@20);
        make.left.equalTo(self.refreshImage.mas_right).offset(5);
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

#pragma mark -  init view 懒加载

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
        _planeTime.adjustsFontSizeToFitWidth=YES;
        _planeTime.text=@"hahaha";
    }
    return  _planeTime;
}



-(UIView *)  refreshLayout{
    if (_refreshLayout==nil) {
        _refreshLayout=[[UIView alloc] init];
        _refreshLayout.backgroundColor=[UIColor whiteColor];
    }
    
    return _refreshLayout;
}

-(UIImageView *) refreshImage{
    if (_refreshImage==nil) {
        UIImage * image= [UIImage imageNamed:@"refresh.png"];
        _refreshImage=[[UIImageView alloc] initWithImage:image];
    }
    
    
    
    return _refreshImage;
}
-(UILabel *) refreshTitle{
    
    if (_refreshTitle==nil) {
        _refreshTitle=[[UILabel alloc] init];
        _refreshTitle.text=@"刷新";
        _refreshTitle.textColor=LCBlueColor;
        _refreshTitle.font=[UIFont systemFontOfSize:12];
        _refreshTitle.adjustsFontSizeToFitWidth=YES;
    }
    return _refreshTitle;
}
@end
