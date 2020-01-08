//
//  ArticleDetailBean.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.
//
//文章详情 封装类
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleDetailBean : NSObject

@property(nonatomic,strong) NSString * articleTitle;
@property(nonatomic,assign) NSInteger  articleId;
@property(nonatomic,assign) long  articleCreatTime;
@property(nonatomic,strong) NSString * showDuration;
@property(nonatomic,assign) NSInteger articleOrgId;
//图片地址
@property(nonatomic,strong) NSString * articleThumb;
@end

NS_ASSUME_NONNULL_END
