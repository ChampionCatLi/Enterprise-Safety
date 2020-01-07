//
//  ArticleDetaileTableViewCell.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.
//

#import "ArticleDetaileTableViewCell.h"
#import "ArticleDetailBean.h"
#import "ArticleBeanFrame.h"
@interface ArticleDetaileTableViewCell()

@property(nonatomic,strong) UILabel * titleLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UIImageView * picImageview;
@end

@implementation ArticleDetaileTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initView];
        
        
    }
    
    return  self;
}


-(void) initView{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview: self.timeLabel];
    [self.contentView addSubview:self.picImageview];
    
}

-(void) setArticleBeanFrame:(ArticleBeanFrame *)articleBeanFrame{
    _articleBeanFrame=articleBeanFrame;
    
}
-(void) setViewFrame{
    self.titleLabel.frame=_articleBeanFrame.titleF;
    self.timeLabel.frame=_articleBeanFrame.timeF;
//    self.picImageview.frame=_articleBeanFrame.picF;

}
-(void) setViewData:(ArticleDetailBean *) articleDetailBean{
    self.titleLabel.text=articleDetailBean.articleTitle;
    self.timeLabel.text=articleDetailBean.showDuration;
}

-(UILabel *)  titleLabel{
    if (_titleLabel==nil) {
        _titleLabel=[[UILabel alloc] init];
        _titleLabel.font=LCFont15;
        _titleLabel.textColor=LCBlack333333;
        _titleLabel.numberOfLines=2;
    }
    
    return _titleLabel;
}


-(UILabel *) timeLabel{
    if (_timeLabel==nil) {
        _timeLabel=[[UILabel alloc] init];
        _timeLabel.font =LCFont12;
        _timeLabel.textColor=LCGay9E9E9E;
    }
    
    return _timeLabel;
}
-(UIImageView *) picImageview{
    if (_picImageview==nil) {
        _picImageview=[[UIImageView alloc] init];
    }
    return _picImageview;
}

@end
