//
//  ArticleBeanFrame.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArticleDetailBean ;
NS_ASSUME_NONNULL_BEGIN

@interface ArticleBeanFrame : NSObject
@property(nonatomic,assign,readonly) CGRect  titleF;
@property(nonatomic,assign,readonly) CGRect  timeF;
@property(nonatomic,assign,readonly) CGRect  picF;

@property(nonatomic,assign,readonly) CGFloat cellHeight;
@property(nonatomic,strong)  ArticleDetailBean * articleDetailBean;


@end

NS_ASSUME_NONNULL_END
