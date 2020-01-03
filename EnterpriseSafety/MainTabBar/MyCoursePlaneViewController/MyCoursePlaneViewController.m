//
//  MyCoursePlaneViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/30.
//  Copyright © 2019 chao. All rights reserved.
//

#import "MyCoursePlaneViewController.h"
#import "GKCycleScrollView.h"
#import "GKCycleScrollViewCell.h"
#import <XMNetworking.h>
#import "OpenCourseData.h"
#import "OpenCourseTableViewCell.h"
#import "OpenCourseFrame.h"


@interface MyCoursePlaneViewController ()<GKCycleScrollViewDelegate,GKCycleScrollViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) GKCycleScrollView * cycleScrollView;

@property(nonatomic,strong) NSArray * planeDataArr;

@property(nonatomic,strong) NSMutableArray * openCourseFrameArr;
@property(nonatomic,strong) UITableView * rootTableview;
@property(nonatomic,strong) UIView * openCourseTableViewHeaderView;
@property(nonatomic,strong) GKCycleScrollViewCell * cycleScrollViewCell;
@property(nonatomic,strong) UIView * footerView;


@end

@implementation MyCoursePlaneViewController



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
    [self.view addSubview:self.rootTableview];

    [_rootTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
        self.openCourseFrameArr= [NSMutableArray  new];
        for (int i= 0; i<clazzArr.count; i++) {
            NSDictionary * clazzData=clazzArr[i];
            NSInteger ruleId;
            ruleId=[[clazzData objectForKey:@"ruleId"] intValue];
            OpenCourseData * openCourse=[[OpenCourseData alloc] initWithDict:clazzData rule:clazzData];
            if(i==1){
                 openCourse.desc=@"过年了 过年了过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了13432423425";
            }
            
            OpenCourseFrame * openFrame=[[OpenCourseFrame alloc] init];
            openFrame.openCourseData=openCourse;
            
            [self.openCourseFrameArr addObject:openFrame];
        }
      
        [self.rootTableview reloadData];
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
    OpenCourseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell = [[OpenCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
     }
    cell.openCourseFrame=self.openCourseFrameArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"cellheight::%f",[self.openCourseFrameArr[indexPath.row] cellHeight]);
    return [self.openCourseFrameArr[indexPath.row] cellHeight];
}

#pragma mark - add view

-(UITableView *) rootTableview{
    
    if (_rootTableview==nil) {
        _rootTableview =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain   ];
        _rootTableview.backgroundColor=LCBackGroundColor;
        _rootTableview.delegate=self;
        _rootTableview.dataSource=self;
        _rootTableview.scrollEnabled=YES;
        _rootTableview.showsVerticalScrollIndicator=YES;
    }
    
    return _rootTableview;
}



-(void) addPlaneScrollView{
    self.rootTableview.tableHeaderView=self.cycleScrollView;
    [self.cycleScrollView reloadData];
}


#pragma mark - init view
-(GKCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView=[[GKCycleScrollView alloc ] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,220)];
        _cycleScrollView.dataSource =self;
        _cycleScrollView.delegate=self;
        _cycleScrollView.isAutoScroll=NO;
        _cycleScrollView.isInfiniteLoop=NO;
        _cycleScrollView.isChangeAlpha=NO;
        _cycleScrollView.leftRightMargin=30.0f;
    }
    return _cycleScrollView;
}





-(UIView *) openCourseTableViewHeaderView{
    if (_openCourseTableViewHeaderView==nil) {
        _openCourseTableViewHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        _openCourseTableViewHeaderView.backgroundColor=[UIColor orangeColor];
        UILabel * headerTitle=[[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
        headerTitle.font=LCFont15;
        headerTitle.text=@"可选课程";
        headerTitle.adjustsFontSizeToFitWidth=YES;
        [_openCourseTableViewHeaderView addSubview:headerTitle];
        [headerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_openCourseTableViewHeaderView.mas_centerY);
            make.left.equalTo(self.openCourseTableViewHeaderView.mas_left).offset(15);
        }];

        UIView * gayLine=[[UIView alloc] init];
        gayLine.backgroundColor=LCGayLineBDBDBD;
        [self.openCourseTableViewHeaderView addSubview:gayLine];
        [gayLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.openCourseTableViewHeaderView.mas_width);
            make.height.equalTo(@0.5);
            make.bottom.equalTo(self.openCourseTableViewHeaderView.mas_bottom);
        }];

    }
    return _openCourseTableViewHeaderView;
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
