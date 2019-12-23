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
#import <XMNetworking.h>

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
    [self initView];
    [self initData];
   
}




#pragma -mark init self view
-(void) initView{
    self.edgesForExtendedLayout = UIRectEdgeNone;//这句话就是从导航栏下面开始计算高度
    self.view.backgroundColor=LCBackGroundColor;
}

#pragma -mark 获取网络数据
-(void) initData{
    //获取在学习计划列表
    [self getLearnPlane];
       
}





#pragma mark -network


-(void)  getLearnPlane{
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_get_learn_plane;
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSArray * keys=  [responseObject allKeys];
        if ( [keys containsObject:@"message"]) {
            self.dataArr=responseObject[@"message"];
            [self addPlaneScrollView];
        }
        
    }];
    
}

#pragma mark -delegate

-(GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index{
    GKCycleScrollViewCell * cell =[cycleScrollView dequeueReusableCell];
    if (!cell) {
        cell=[GKCycleScrollViewCell new];
        cell.layer.masksToBounds=NO;
    }
    NSDictionary * planeDic =self.dataArr[index];
    NSDictionary * ruleDic =planeDic[@"rule"];
    NSString * name =ruleDic[@"name"];
    [cell.titleLabel setText:name];
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

#pragma mark - add view

-(void) addPlaneScrollView{
    [self.view addSubview: self.cycleScrollView];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(15);
        make.height.mas_equalTo(200.0f);
    }];
    [self.cycleScrollView reloadData];
}



#pragma mark - init view
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

@end
