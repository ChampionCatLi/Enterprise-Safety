//
//  ArticlePageViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.


#import "ArticlePageViewController.h"

@interface ArticlePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * articleListTableView;
@end

@implementation ArticlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{}

@end
