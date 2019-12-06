//
//  CourseViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/2.
//  Copyright © 2019 chao. All rights reserved.
//

#import "CourseViewController.h"
#import "GKCycleScrollView.h"
#import "GKCycleScrollViewCell.h"

@interface CourseViewController ()<GKCycleScrollViewDelegate,GKCycleScrollViewDataSource>
@property (nonatomic,strong) GKCycleScrollView * cycleScrollView;

@property(nonatomic,strong) NSArray * dataArr;
@property(nonatomic,strong)GKCycleScrollViewCell * cycleScrollViewCell;

@end

@implementation CourseViewController



-(instancetype)init{
    if (self =[super init]) {
        self.tabBarItem.title=@"我的课程";
        self.tabBarItem.image=[UIImage imageNamed:@"movie"];
        [self setTitle:@"我的课程"];
    
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}




#pragma init
-(void) initView{
    NSLog(@"nav height %f",self.navigationController.view.frame.size.height);
    [self.view addSubview: self.cycleScrollView];
    self.view.backgroundColor=[UIColor colorWithRed:245/255.0  green:245/255.0  blue:245/255.0  alpha:1];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(15+kZDNavigationBarHeight);
        make.height.mas_equalTo(200.0f);
    }];
    [self.cycleScrollView reloadData];
}
-(void) initData{
    self.dataArr=@[@{@"title": @"我是标题我是标题1我是标题我是标题1我是标题我是标题1我是标题我是标题1",@"img_url":@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3724300455,3419815340&fm=26&gp=0.jpg"},@{@"title":@"我是标题我是标题",@"img_url":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3657258270,1485602730&fm=26&gp=0.jpg"}
    ];}
-(GKCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView=[GKCycleScrollView new ];
        _cycleScrollView.dataSource =self;
        _cycleScrollView.delegate=self;
        _cycleScrollView.isAutoScroll=NO;
        _cycleScrollView.isInfiniteLoop=NO;
        _cycleScrollView.isChangeAlpha=NO;
        _cycleScrollView.leftRightMargin=30.0f;
    }
    return _cycleScrollView;
    
}


#pragma delegate

-(GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index{
    GKCycleScrollViewCell * cell =[cycleScrollView dequeueReusableCell];
    if (!cell) {
        cell=[GKCycleScrollViewCell new];
        cell.layer.masksToBounds=NO;
    }
    NSDictionary * dict =self.dataArr[index];
    [cell.titleLabel setText:dict[@"title"]];
    return cell;
    
    
}
-(CGSize)sizeForCellInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return CGSizeMake(300.0f, 200.0f);
}
-(NSInteger)numberOfCellsInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return self.dataArr.count;
}
- (void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didScrollCellToIndex:(NSInteger)index{
    
    
}

-(void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didSelectCellAtIndex:(NSInteger)index{
    
}
-(void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didSelectCellGTitleLabelAtIndex:(NSInteger)index{
    
    NSLog(@"label 被点击了 index:: %ld ",index-0x111);
}

@end
