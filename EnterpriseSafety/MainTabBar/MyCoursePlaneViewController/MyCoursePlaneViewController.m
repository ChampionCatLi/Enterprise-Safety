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
#import "OpenCourseTableViewTitleTableViewCell.h"
#import "LoadMoreTableViewCell.h"
#import "ArticleListData.h"
#import "ArticleDetailBean.h"
#import <SGPagingView.h>
#import <SGPageTitleView.h>
#import <SGPageContentScrollView.h>
#import "ArticlePageViewController.h"


@interface MyCoursePlaneViewController ()<GKCycleScrollViewDelegate,GKCycleScrollViewDataSource,UITableViewDelegate,UITableViewDataSource,SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>
@property (nonatomic,strong) GKCycleScrollView * cycleScrollView;

@property(nonatomic,strong) NSArray * planeDataArr;

@property(nonatomic,strong) NSMutableArray * openCourseFrameArr;
@property(nonatomic,strong) UITableView * rootTableview;
@property(nonatomic,strong) UIView * openCourseTableViewHeaderView;
@property(nonatomic,strong) GKCycleScrollViewCell * cycleScrollViewCell;
@property(nonatomic,assign) BOOL isShowAllData ;
@property(nonatomic,assign) NSInteger articleCount ;
@property(nonatomic,assign) NSInteger articleOffset ;
@property(nonatomic,assign) NSInteger articleAddCout;
// 文章标题总数组
@property(nonatomic,strong) NSMutableArray * articleTitleArr;
//文章详情 列表 总数组
@property(nonatomic,strong) NSMutableArray * articleTotalDetailListArr;


@property(nonatomic,strong) SGPageTitleView * pageTitleView;
@property(nonatomic,strong) SGPageContentScrollView * pageContentScrollView;
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
    self.isShowAllData=NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;//这句话就是从导航栏下面开始计算高度
    
    self.view.backgroundColor=LCBackGroundColor;
    [self.view addSubview:self.rootTableview];
    
    [_rootTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
}

#pragma -mark 获取网络数据
-(void) initData{
    self.articleCount=6;
    self.articleOffset=1;
    
    
    //获取在学习计划列表
    [self getLearnPlane];
    [self getOpenCourse];
    [self getArticleTitle];
    
}
#pragma mark -network
// 获取在学 学习计划
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
// 获取可选课程列表
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
            if (i==0) {
                openCourse.desc=@"马上过年 马上过年";
                
            }    else  if(i==1){
                openCourse.desc=@"过年了 过年了过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了过年了 过年了 过年了过年了 过年了过年了 过年了13432423425";
            }
            
            OpenCourseFrame * openFrame=[[OpenCourseFrame alloc] init];
            openFrame.openCourseData=openCourse;
            
            [self.openCourseFrameArr addObject:openFrame];
        }
        if (self.openCourseFrameArr.count<=2) {
            self.isShowAllData=YES;
        }
        [self.rootTableview reloadData];
    }];
}
// 获取文章标题
-(void) getArticleTitle{
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_get_article_title;
        request.httpMethod=kXMHTTPMethodGET;
        
    } onSuccess:^(id  _Nullable responseObject) {
        NSArray * keys=[responseObject allKeys];
        if ([keys containsObject:@"message"]) {
            NSArray * messageArr=responseObject[@"message"];
            
            [self parseArticleTitleData:messageArr];
        }
        
        
    }];
}

// 获取文章栏目列表
-(void) getArticleList:(NSString *) articleId indexList:(NSInteger) index{
    
    
    NSString * articleOffsetStr=[NSString stringWithFormat:@"%ld",self.articleOffset];
    NSString * articleCountStr=[NSString stringWithFormat:@"%ld",self.articleCount];
    NSString * url =[NSString stringWithFormat:@"%@/%@/%@/%@",url_get_article_list,articleId,articleOffsetStr,articleCountStr];
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url;
        request.httpMethod=kXMHTTPMethodGET;
        
    } onSuccess:^(id  _Nullable responseObject) {
        NSArray * tempArr;
        NSArray * keys=[responseObject allKeys];
        if ([keys containsObject:@"message"]) {
            tempArr=responseObject[@"message"];
        }else{
            tempArr=[NSArray new];
        }
        
        
        [self setDataAndSyn:tempArr indexList:index];
    }];
}


#pragma mark - parse data

//解析 文章标题 并请求 文章列表。
-(void) parseArticleTitleData:(NSArray *) messageArr{
    self.articleTitleArr=[NSMutableArray new];
    self.articleTotalDetailListArr=[NSMutableArray new];
    for (int i=0; i<messageArr.count; i++) {
        NSDictionary * articleTitleBean=messageArr[i];
        NSString * articleNameStr=articleTitleBean[@"name"];
        [_articleTitleArr addObject:articleNameStr];
        NSString * articleID=articleTitleBean[@"id"];
        ArticleListData * articleListData=[[ArticleListData alloc] init];
        [self.articleTotalDetailListArr addObject:articleListData];
        [self getArticleList:articleID indexList:i];
    }
    
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
    
}
#pragma mark -open course tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.openCourseFrameArr.count>2){
        if(_isShowAllData){
            return self.openCourseFrameArr.count+1;
        }else{
            return 4;
        }
        
    }
    return self.openCourseFrameArr.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID;
    
    if (indexPath.row==0) {
        ID=@"titleCell";
        OpenCourseTableViewTitleTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            
            cell=[[OpenCourseTableViewTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.row==3&&!_isShowAllData){
        ID=@"footerCell";
        LoadMoreTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            
            cell=[[LoadMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
           cell.separatorInset=UIEdgeInsetsMake(0,SCREEN_WIDTH, 0, 0);
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell ;
    }else{
        ID=@"contentCell";
        OpenCourseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        if (cell==nil) {
            cell = [[OpenCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.openCourseFrame=self.openCourseFrameArr[indexPath.row-1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        return 45;
    }else  if(indexPath.row==3&&!_isShowAllData){
        return 45;
        
    }else{
        return [self.openCourseFrameArr[indexPath.row-1] cellHeight];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==3){
        self.isShowAllData=YES;
        [self.rootTableview reloadData];
    }
}

-(void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}
- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView index:(NSInteger)index {
    /// 说明：在此获取标题or当前子控制器下标值
    NSLog(@"index - - %ld", index);
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
// 添加w文章活动页面
-(void) initPageView{
    SGPageTitleViewConfigure * configure=[SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleFont=[UIFont systemFontOfSize:13];
    configure.titleColor=LCGay979797;
    configure.indicatorHeight=3;
    configure.indicatorCornerRadius=5;
    configure.indicatorToBottomDistance=5;
    configure.indicatorColor=LCBlueColor;
    configure.titleSelectedColor=LCBlack333333;
    configure.titleSelectedFont=[UIFont systemFontOfSize:13];
    configure.indicatorStyle=SGIndicatorStyleFixed;
    configure.indicatorFixedWidth=20.0f;
    configure.bottomSeparatorColor=[UIColor whiteColor];
    
    
    self.pageTitleView=[SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 44) delegate:self titleNames:self.articleTitleArr configure:configure];
    _pageTitleView.selectedIndex=0;
    NSMutableArray * articleChildVCArr=[NSMutableArray new];
    for (int i=0; i<self.articleTitleArr.count; i++) {
        ArticlePageViewController * articleVC=[[ArticlePageViewController alloc] init];
        
        [articleChildVCArr addObject:articleVC];
    }
    
    _footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];
    _footerView.backgroundColor=LCBackGroundColor;
    [self.footerView addSubview:self.pageTitleView];
    
    self.pageContentScrollView=[[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, 54, self.view.frame.size.width, 500) parentVC:self childVCs:articleChildVCArr];
    _pageContentScrollView.delegatePageContentScrollView=self;
    self.pageContentScrollView.backgroundColor=[UIColor whiteColor];
    [self.footerView addSubview:self.pageContentScrollView];
    [self.rootTableview setTableFooterView:self.footerView];
    
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


#pragma mark -- 其他一些方法
//添加文章并同步文章列表请求是否都已经完毕
-(void) setDataAndSyn:(NSArray *) articleListArr indexList:(NSInteger) index{
    
    ArticleListData * articleListData =self.articleTotalDetailListArr[index];
    articleListData.articleDetailList=articleListArr;
    
    self.articleAddCout++;
    @synchronized (self.articleTotalDetailListArr) {
        if (_articleAddCout==self.articleTitleArr.count) {
            [self initPageView];
        }
    }
    
}


@end
