//
//  LoadMoreFooterView.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/8.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LoadMoreFooterView.h"
@interface LoadMoreFooterView()
@property(nonatomic,strong) UILabel * contentLabel;
@property(nonatomic,strong) UIView * gayLine;
@end

@implementation LoadMoreFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSelfView];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

-(void) setContent:(NSString *)contentText{
    self.contentLabel.text=contentText;
}


-(void) addSelfView{
    [self addSubview:self.contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
        
    }];
    [self addSubview:self.gayLine];
}


-(UILabel *) contentLabel{
    
    if (_contentLabel==nil) {
        _contentLabel=[[UILabel alloc] init];
        //居中显示
        _contentLabel.textAlignment=NSTextAlignmentCenter;
        _contentLabel.textColor=LCBlueColor;
        _contentLabel.font=LCFont15;
        _contentLabel.text=@"更多内容";
    }
    
    return _contentLabel;
}
-(UIView *) gayLine{
    
    if (_gayLine==nil) {
        _gayLine=[[UIView alloc] initWithFrame:CGRectMake(15, 0, self.frame.size.width, 0.5)];
        _gayLine.backgroundColor=LCGayLineBDBDBD;
    }
    
    return _gayLine;
}
@end
