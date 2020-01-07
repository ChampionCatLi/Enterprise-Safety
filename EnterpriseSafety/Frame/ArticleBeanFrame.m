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
    CGFloat titleH=42.0;
    CGFloat titleW;
    CGFloat titleX=LCMAEGIN_15;
    CGFloat titleY=LCMAEGIN_15;
    CGFloat picW=80.0;
    CGFloat picH=60.0;
    CGFloat picX;
    CGFloat picY;
    
    if (articleDetailBean.articleThumb.length==0) {
        titleW=SCREEN_WIDTH-LCMAEGIN_15*2;
        _titleF=CGRectMake(titleX, titleY, titleW, titleH);
    }else{
        titleW=SCREEN_WIDTH -LCMAEGIN_15*3-picW;
        picX=SCREEN_WIDTH -titleW-LCMAEGIN_15;
        picY=LCMAEGIN_15;
        _picF=CGRectMake(picX, picY, picW, picH);
    }
    CGFloat timeX=LCMAEGIN_15;
    CGFloat timeY=LCMAEGIN_15*2+titleH;
    CGFloat timeW=200;
    CGFloat timeH=30;
    
    _timeF=CGRectMake(timeX, timeY, timeW,timeH );

    
    _cellHeight=timeY+LCMAEGIN_15;
    
    
}


@end
