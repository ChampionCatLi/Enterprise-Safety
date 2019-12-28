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
#import "OpenCourseData.h"
#import "OpenCourseTableViewCell.h"

@interface CourseViewController ()<GKCycleScrollViewDelegate,GKCycleScrollViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) GKCycleScrollView * cycleScrollView;

@property(nonatomic,strong) NSArray * planeDataArr;
@property(nonatomic,strong)GKCycleScrollViewCell * cycleScrollViewCell;
@property(nonatomic,strong) NSMutableArray * openCourseDataArr;
@property(nonatomic,strong) UITableView  * openCourseTableview;
@property(nonatomic,strong) UIScrollView * uiScrollVIew;
@property(nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIView * headerView;

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
    [self.view addSubview:self.uiScrollVIew];
    [_uiScrollVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];

    [self.uiScrollVIew addSubview:self.contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height);
        make.width.equalTo(@SCREEN_WIDTH);
    }];

}

#pragma -mark 获取网络数据
-(void) initData{
    //获取在学习计划列表
  [self getLearnPlane];
  [self getOpenCourse];
    
}





#pragma mark -network


-(void)  getLearnPlane{
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_get_learn_plane;
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSArray * keys=  [responseObject allKeys];
        if ( [keys containsObject:@"message"]) {
            self.planeDataArr=responseObject[@"message"];
            [self addPlaneScrollView];
        }
          
    }];
}

-(void) getOpenCourse{
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_get_open_course;
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSDictionary * messageData=responseObject[@"message"];
        NSArray * clazzArr=messageData[@"clazzes"];
        self.openCourseDataArr= [NSMutableArray  new];
        for (int i= 0; i<clazzArr.count; i++) {
            NSDictionary * clazzData=clazzArr[i];
            NSInteger ruleId;
            ruleId=[[clazzData objectForKey:@"ruleId"] intValue];
            OpenCourseData * openCourse=[[OpenCourseData alloc] initWithDict:clazzData rule:clazzData];
//            if(i==1){
//                 openCourse.desc=@"过年了 过年了过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了";
//            }
            [self.openCourseDataArr addObject:openCourse];
        }
        [self addOpenCourseTableView];
        
        
    }];
}

#pragma mark -delegate

-(GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index{
    GKCycleScrollViewCell * cell =[cycleScrollView dequeueReusableCell];
    if (!cell) {
        cell=[GKCycleScrollViewCell new];
        cell.layer.masksToBounds=NO;
    }
    [self putData2Cell:cell cellIndex:index];
    return cell;
}
-(CGSize)sizeForCellInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return CGSizeMake(300.0f, 200.0f);
}
-(NSInteger)numberOfCellsInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return self.planeDataArr.count;
}
- (void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didScrollCellToIndex:(NSInteger)index{
    
    
}


-(void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didSelectCellGTitleLabelAtIndex:(NSInteger)index{
    
    NSLog(@"label 被点击了 index:: %ld ",index-0x111);
}
#pragma mark -open course tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"cell";
    OpenCourseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[OpenCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell setOpenCourseData:self.openCourseDataArr[indexPath.row]];
    
    return cell;
}

#pragma mark - add view

-(void) addPlaneScrollView{
    [self.contentView addSubview: self.cycleScrollView];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.height.mas_equalTo(200.0f);
    }];
    [self.cycleScrollView reloadData];
}
-(void) addOpenCourseTableView {
    
    [self.contentView addSubview:self.openCourseTableview ];
    [_openCourseTableview mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.cycleScrollView.mas_bottom).offset(15);
//       make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.equalTo(@200);
        make.width.equalTo(@SCREEN_WIDTH);
    }];
    [self.openCourseTableview reloadData];
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
-(UITableView *) openCourseTableview{
    if (_openCourseTableview==nil) {
        _openCourseTableview=[[UITableView alloc]init];
        _openCourseTableview.dataSource=self;
        _openCourseTableview.delegate=self;
        _openCourseTableview.backgroundColor=[UIColor greenColor];
         _openCourseTableview.estimatedRowHeight=80.0;
        _openCourseTableview.rowHeight=UITableViewAutomaticDimension;
        _openCourseTableview.scrollEnabled=NO;
        [_openCourseTableview setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
        _openCourseTableview.tableHeaderView=self.headerView;

    }
    return _openCourseTableview;
}

-(UIScrollView *) uiScrollVIew{
    if (_uiScrollVIew==nil) {
        _uiScrollVIew=[[UIScrollView alloc] init];
        _uiScrollVIew.alwaysBounceVertical=YES;
        _uiScrollVIew.contentSize=CGSizeMake(0, 0);
    }
    
    return _uiScrollVIew;
}

-(UIView *) contentView{
    if (_contentView==nil) {
        _contentView =[[UIView alloc] init];
        _contentView.backgroundColor=[UIColor redColor];
    }
    return _contentView;
}


-(UIView *) headerView{
    if (_headerView==nil) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        _headerView.backgroundColor=[UIColor whiteColor];
        UILabel * headerTitle=[[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
        headerTitle.font=LCFont15;
        headerTitle.text=@"可选课程";
        headerTitle.adjustsFontSizeToFitWidth=YES;
        [_headerView addSubview:headerTitle];
        [headerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_headerView.mas_centerY);
            make.left.equalTo(self.headerView.mas_left).offset(15);
        }];
        
        UIView * gayLine=[[UIView alloc] init];
        gayLine.backgroundColor=LCGayLineBDBDBD;
        [self.headerView addSubview:gayLine];
        [gayLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.headerView.mas_width);
            make.height.equalTo(@0.5);
            make.bottom.equalTo(self.headerView.mas_bottom);
        }];
        
        
        
    }
    return _headerView;
}



#pragma mark - 给 cell  添加数据


-(void)putData2Cell:(GKCycleScrollViewCell * )cell cellIndex:(NSInteger) index{
    NSDictionary * planeDic =self.planeDataArr[index];
    NSDictionary * ruleDic =planeDic[@"rule"];
    NSString * name =ruleDic[@"name"];
    
    NSDictionary * scDic=planeDic[@"sc"];
    long  startDate;
    long endDate ;
    startDate =[[scDic objectForKey:@"startTime"] longValue]/1000;
    endDate=[[scDic objectForKey:@"endTime"] longValue]/1000;
    NSString * duration=[LCUtils appendLong2Str:startDate endTime:endDate];
    cell.titleLabel.text=name;
    cell.planeTime.text=duration;
    
}
@end
