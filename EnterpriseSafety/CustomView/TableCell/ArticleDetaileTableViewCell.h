//
//  ArticleDetaileTableViewCell.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ArticleDetailBean;
@class  ArticleBeanFrame;

NS_ASSUME_NONNULL_BEGIN

@interface ArticleDetaileTableViewCell : UITableViewCell

@property(nonatomic,strong) ArticleDetailBean * articleDetailBean;
@property(nonatomic,strong) ArticleBeanFrame * articleBeanFrame;
@end

NS_ASSUME_NONNULL_END
