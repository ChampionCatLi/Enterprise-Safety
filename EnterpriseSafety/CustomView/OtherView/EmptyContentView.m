//
//  EmptyContentView.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/8.
//  Copyright © 2020 chao. All rights reserved.
//

#import "EmptyContentView.h"

@interface  EmptyContentView()

@property(nonatomic,strong) UIImageView * emptyIcon;
@property(nonatomic,strong) UILabel * emptyText;
@end
@implementation EmptyContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSelfView];
    }
    return self;
}

-(void) addSelfView{
    [self addSubview:self.emptyIcon];
    [_emptyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@60);
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-60);
    }];
    [self addSubview:self.emptyText];
    [_emptyText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.height.equalTo(@5);
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.emptyIcon.mas_bottom).offset(10);
    }];
}

-(UIImageView *) emptyIcon{
    if (_emptyIcon==nil) {
        UIImage * img=[UIImage imageNamed:@"description.png"];
        _emptyIcon=[[UIImageView alloc] initWithImage:img];
      
    }
    
    return _emptyIcon;
}

-(UILabel *) emptyText{
    if (_emptyText==nil) {
        _emptyText=[[UILabel alloc]  init];
        _emptyText.text=@"暂无内容";
        _emptyText.textColor=LCGay979797;
        _emptyText.font=LCFont12;
    }
    
    return _emptyText;
}

@end
