//
//  ArticleBeanFrame.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.
//

#import "ArticleBeanFrame.h"
#import "ArticleDetailBean.h"
@implementation ArticleBeanFrame

-(void)setArticleDetailBean:(ArticleDetailBean *)articleDetailBean{
    _articleDetailBean=articleDetailBean;
    
    
    CGFloat titleW;
    CGFloat titleX=LCMAEGIN_15;
    CGFloat titleY=LCMAEGIN_15;
    CGFloat picW=80.0;
    CGFloat picH=60.0;
    CGFloat picX;
    CGFloat picY;
    CGSize titleSize;
    
    
    if (articleDetailBean.articleThumb.length==0) {
        titleW=SCREEN_WIDTH-LCMAEGIN_15*2;
    }else{
        titleW=SCREEN_WIDTH -LCMAEGIN_15*3-picW;
        picX=titleW+LCMAEGIN_15+10;
        picY=LCMAEGIN_15;
        _picF=CGRectMake(picX, picY, picW, picH);
    }
    CGSize sigleTitleSize= [@"example" sizeWithFont:LCFont12 constrainedToSize:CGSizeMake(titleW,MAXFLOAT)];
    titleSize=  [_articleDetailBean.articleTitle sizeWithFont:LCFont12 constrainedToSize:CGSizeMake(titleW,MAXFLOAT)];
    
    _titleF=CGRectMake(titleX, titleY, titleW, titleSize.height);
    CGFloat timeX=LCMAEGIN_15;
    CGFloat timeY=LCMAEGIN_15+titleSize.height;
    CGFloat timeW=200;
    CGFloat timeH=30;
    
    _timeF=CGRectMake(timeX, timeY, timeW,timeH );
    
     _cellHeight=timeY+timeH;
    //对于单行且含有图片高度的修正
    if (articleDetailBean.articleThumb.length!=0){
        
        if (sigleTitleSize.height==titleSize.height) {
            
            _titleF=CGRectMake(titleX, titleY, titleW, sigleTitleSize.height*2);
            _timeF=CGRectMake(timeX, timeY+sigleTitleSize.height, timeW,timeH );
            _cellHeight=timeY+sigleTitleSize.height+timeH+LCMAEGIN_15;
        }
    }
    
   
    
}


@end
