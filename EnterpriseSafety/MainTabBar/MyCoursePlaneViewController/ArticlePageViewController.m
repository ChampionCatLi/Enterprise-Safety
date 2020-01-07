//
//  ArticlePageViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.
//

#import "ArticlePageViewController.h"

@interface ArticlePageViewController ()
@property(nonatomic,strong) UILabel * contentLabel;
@end

@implementation ArticlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.view addSubview:self.contentLabel];
    
}

-(UILabel *) contentLabel{
    
    if (_contentLabel==nil) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 450)];
        _contentLabel.text=@"我是内容";
    }
    
    return _contentLabel;
}
@end
