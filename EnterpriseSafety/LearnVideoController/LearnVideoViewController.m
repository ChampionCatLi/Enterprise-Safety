//
//  LearnVideoViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LearnVideoViewController.h"
#import <SGPagingView.h>
#import <SGPageTitleView.h>
#import <SGPageContentScrollView.h>
#import "VideoListViewController.h"
#import "VideoDetailViewController.h"
#import "CommentViewController.h"

@interface LearnVideoViewController ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>

//视频站位view
@property(strong,nonatomic) UIView * topView;
@property(strong,nonatomic) SGPageTitleView * pageTitleView;
@property(strong,nonatomic) SGPageContentScrollView * pageContentView;


@end

@implementation LearnVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=_courseName;
    [self initView];
    [self initData];
}
-(void) initData{
    [self getLearnVideoDetail];
}
-(void) initView{
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.pageTitleView];
    
}


-(void) getLearnVideoDetail{
    
    NSString * url =[NSString stringWithFormat:@"%@/%@/%@",url_get_learn_video_detail,self.courseId,self.clazzId];
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url;
        request.httpMethod=kXMHTTPMethodGET;


    } onSuccess:^(id  _Nullable responseObject) {
        NSLog(@"learnvideo:::%@",responseObject);
    }];
    
    
}


#pragma mark -- view


-(UIView *) topView{
    
    
    if (_topView==nil) {
        _topView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _topView.backgroundColor=[UIColor orangeColor];
    }
    
    return _topView;
}
-(SGPageTitleView *) pageTitleView{

    if (_pageTitleView==nil) {
    NSArray * titleArr=@[@"目录",@"介绍",@"互动"];
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
        
        _pageTitleView=[SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 215, SCREEN_WIDTH,44 ) delegate:self titleNames:titleArr configure:configure];
        
    }
    
    return _pageTitleView;
}

 
-(SGPageContentScrollView *) pageContentView{
    if (_pageContentView==nil) {
        NSMutableArray * vcData=[NSMutableArray new];
        VideoListViewController * videoListVC=[[VideoListViewController alloc] init];
        VideoDetailViewController * videoDetailVC=[[VideoDetailViewController alloc] init];
        CommentViewController * commentVC=[[CommentViewController alloc] init];
        [vcData addObject:videoListVC];
        [vcData addObject:videoDetailVC];
        [vcData addObject:commentVC];
        
        
        _pageContentView=[[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, 275, SCREEN_WIDTH, SCREEN_HEIGHT-275) parentVC:self childVCs:vcData];
    }
    
    
    return _pageContentView;
}

#pragma mark --delegate--
-(void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageContentScrollViewCurrentIndex:selectedIndex];
}
- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView index:(NSInteger)index {
    /// 说明：在此获取标题or当前子控制器下标值
}

@end
