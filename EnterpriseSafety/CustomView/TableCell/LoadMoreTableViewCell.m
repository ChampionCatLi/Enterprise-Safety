//
//  LoadMoreTableViewCell.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/3.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LoadMoreTableViewCell.h"

@interface  LoadMoreTableViewCell()
@property(nonatomic,strong) UILabel * contentLabel;

@end
@implementation LoadMoreTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.contentLabel];
        
    }
    
    return self;
}




-(UILabel *)  contentLabel {
    
    
    if (_contentLabel==nil) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(self.contentView.center.x, self.contentView.center.y-10, 200, 20)];
        _contentLabel.text=@"更多课程";
        _contentLabel.textColor=LCBlueColor;
        _contentLabel.font=[UIFont systemFontOfSize:15];
        
        
    }
    
    return _contentLabel;
}



@end
