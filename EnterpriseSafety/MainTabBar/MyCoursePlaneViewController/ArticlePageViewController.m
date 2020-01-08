//
//  ArticlePageViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/7.
//  Copyright © 2020 chao. All rights reserved.

//文章详情此页面 vc
#import "ArticlePageViewController.h"
#import "ArticleBeanFrame.h"
#import "ArticleDetaileTableViewCell.h"
#import "LoadMoreFooterView.h"
#import "EmptyContentView.h"

@interface ArticlePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * articleListTableView;
@end

@implementation ArticlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.view addSubview:self.articleListTableView];

}

-(void)setDataSource:(NSMutableArray *)dataSource{

    
    if(dataSource.count>5){
        //大于 5 条显示 更多加载布局
        [dataSource removeObjectAtIndex:5];
        _dataSource=dataSource;
        LoadMoreFooterView * footerView =[[LoadMoreFooterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        
        [self.articleListTableView setTableFooterView:footerView];
        [self.articleListTableView reloadData];
        
    }else if(dataSource.count==0){
        //没有则显示空布局
        EmptyContentView *emptyContentView=[[EmptyContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 450)];
        [self.view addSubview:emptyContentView];
        
    } else{
        //其余显示全部文章
        _dataSource=dataSource;
        self.articleListTableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
        [self.articleListTableView reloadData];
    }
    
}
#pragma mark --delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID =@"cell";
    ArticleDetaileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell =[[ArticleDetaileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    cell.articleBeanFrame=_dataSource[indexPath.row];
    
    return cell;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return [_dataSource[indexPath.row] cellHeight];
}



-(UITableView *) articleListTableView{
    
    if (_articleListTableView==nil) {
        _articleListTableView=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _articleListTableView.dataSource=self;
        _articleListTableView.delegate=self;
        _articleListTableView.backgroundColor=[UIColor whiteColor];
        _articleListTableView.scrollEnabled=NO;
    }
    
    
    return _articleListTableView;
}



@end
